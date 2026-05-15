# Research Planning Skill — v0.6.0 Eval Scenarios

Scenario suite targeting v0.6.0 Pattern B behaviors. v0.6.0 splits the workflow
between main-thread `skills/research-planning/SKILL.md` (Interview, Research,
exits, confirmation pause, Polish) and the `research-brief-writer` sub-agent
(brief drafting only). The scenarios below target architecture-specific
behaviors that did not exist in v0.5.x:

- Three-tier inference confidence (`user-attested`, `user-confirmed-inference`,
  `workspace-with-user-confirm` / `rubric-derived-with-confirm`)
- The structural confirmation pause before brief drafting
- Surface detection (plugin sub-agent path vs. skill main-thread path)
- Sub-agent failure / fallback handling
- Preferences file lifecycle (`.claude/research-planning.local.md`)
- Validation diff catching drafter drift

Each scenario maps to one or more edge cases in design memo §11
(`Knowledge/projects/planning-skill/plugin-v0.6.0-pattern-b.md`). Scoring lives
in [`rubric-v0.6.md`](./rubric-v0.6.md) — a 15-dimension binary rubric (D1–D11
port forward from v0.5; D12–D15 are new for v0.6.0).

---

## Scenarios

### S01 — The grounding-research opener (primary regression test)

**Input (verbatim from session `b0bc14c7-852c-4f43-9743-9a18c5c00e80`):**

> "I've been talking to people who have inbound interest in using the new
> User Interviews MCP but there are lots of people who I haven't talked to
> who it could be beneficial to chat with-specifically designers and PMs
> (non traditional researchers) to better understand how their research
> workflows are changing with AI involved. This is more of grounding
> research to make sure that the inbound traffic doesn't mask the fact that
> teams might be thinking about research in completely new eays"

**Dimensions tested:** D2 (foundational fields), D12 (three-tier confidence), D13 (confirmation pause) — primary regression. Also D1, D3, D10.

**Expected behavior:**
- Agent does NOT produce a full brief in one round.
- Takes 3–5 conversational turns surfacing foundational fields (this is the load-bearing v0.6.0 difference vs. v0.5.1's over-inference).
- Asks AT LEAST 2 grounding questions before drafting (which decision is this informing? what timeline appetite? are you scoping or designing?).
- Inferences from the surface (subjects = designers + PMs; topic = AI-impact on research workflows) are surfaced back with provenance markers, not silently committed.
- Hits the confirmation pause before invoking the brief-writer.
- Does not invent methodology, sample size, or stakeholder names.

**Failure mode this guards against:** v0.5.1's silent over-inference of 8+ foundational fields on a thin grounding-research opener (the 2026-05-15 incident).

---

### S02 — Confirmation pause discipline

**Input:** "I want to do research on whether engineers at series-B startups would use an AI pair-programming tool that critiques their PRs before submission. We piloted something similar internally last month."

**Dimensions tested:** D12 (three-tier confidence), D13 (confirmation pause), D2, D8.

**Expected behavior:**
- Agent infers some foundational fields (subjects = engineers at series-B startups; some prior knowledge about a pilot).
- Surfaces inferences with provenance markers: subjects user-attested; topic user-attested; Why/Decision/Stakeholders inferred-pending-confirm.
- Asks targeted question(s) on the genuinely-missing fields (Why, Stakeholders).
- Pauses at the confirmation pause; does NOT invoke the brief-writer until the user explicitly confirms or corrects.
- If the user types only "ok" or "looks good," agent presses for explicit engagement with the fields (per the prose: "acknowledgment-only is insufficient").

**Failure mode this guards against:** treating acknowledgment as confirmation; sliding into brief drafting on unconfirmed inferences.

---

### S03 — Three-tier confidence with workspace conflict

**Input:** User opens: "I want to study how power users in our skill-sharing pilot are reacting to the new onboarding flow." Workspace contains `Knowledge/projects/skill-sharing/pilot-retro.md` saying the pilot had 8 users and reactions were mixed-to-negative on onboarding.

**Dimensions tested:** D12 (three-tier confidence), D10 (phase fluidity), D3 (voice).

**Expected behavior:**
- Mid-Interview, agent reads the pilot retro inline (anchored to a topic the user surfaced).
- Surfaces the workspace finding back: "Found `pilot-retro.md` — says 8 users, reactions on onboarding were rough. Match what you're working from?"
- User attests in conversation that "actually the new onboarding flow is a redesign launched after that retro — feedback is positive so far on the 3 users I've talked to."
- Agent surfaces the conflict: "The retro says rough onboarding; you're saying the new flow's been redesigned and is landing better. Which should I work from?"
- Does NOT silently average ("the pilot had mixed onboarding results"). Does NOT apply a recency heuristic silently.
- User's resolution enters the working model as `user-attested`; the retro's prior view is discarded for this brief or noted as historical context only.

**Failure mode this guards against:** silent averaging of conflicting context; provenance markers slipping when workspace contradicts the user.

---

### S04 — Surface detection: plugin path

**Input:** Standard Interview-leading opener on a clean topic ("I want to understand how product managers decide whether to invest in AI features"); user is on the Claude Code plugin surface with the Agent tool available.

**Dimensions tested:** D14 (surface detection), D11 (tool-aware handoff).

**Expected behavior:**
- During tool discovery, agent reads `~/.claude.json` and extracts only the top-level keys of the `mcpServers` object. Values are discarded (no OAuth tokens, env vars, or API keys leak).
- Cross-references detected server names against the tool-recommendations rubric.
- At the brief-drafting step (after confirmation pause), invokes the `research-brief-writer` sub-agent via the Agent tool with the state contract.
- Brief returns from the sub-agent as a single message; main thread relays it as-is.

**Failure mode this guards against:** main thread drafting inline on the plugin surface (defeats the architectural isolation benefit); leaking secret values from `~/.claude.json`.

---

### S05 — Surface detection: skill path

**Input:** Same opener as S04; user is on the Claude.ai chat skill surface — Agent tool NOT available, no filesystem access to `~/.claude.json`.

**Dimensions tested:** D14 (surface detection), D11.

**Expected behavior:**
- During tool discovery, agent introspects its own available tool roster (no `~/.claude.json` read attempted — that path doesn't exist).
- Filters against tool-recommendations for research relevance.
- At the brief-drafting step, drafts the brief inline in the main thread — same state-contract logic, same anti-pattern check, same handoff and footer. No sub-agent invocation.

**Failure mode this guards against:** attempting an Agent-tool invocation on the skill surface (which would fail) or announcing "I can't invoke a sub-agent here" (which exposes plumbing).

---

### S06 — Sub-agent failure → fallback

**Input:** On the plugin surface; user reaches the confirmation pause cleanly. Agent invokes `research-brief-writer`. Sub-agent invocation either (a) times out, (b) returns malformed output (missing 3 of the 6 brief fields), or (c) returns an error message.

**Dimensions tested:** D14 (surface detection / failure handling), D6 (brief structure).

**Expected behavior:**
- Main thread retries the sub-agent invocation ONCE with a tighter prompt.
- If the retry fails too, main thread falls back to drafting the brief inline using the same state contract.
- The user is NOT exposed to the failure. The brief surfaces normally — no "I had trouble invoking the brief-writer, let me try again."
- The user sees the brief, drafted with the same fidelity as if the sub-agent had succeeded.

**Failure mode this guards against:** exposing the sub-agent invocation as plumbing to the user; silently failing without producing a brief.

---

### S07 — Preferences file read at session start

**Input:** User on the plugin surface. `.claude/research-planning.local.md` exists with frontmatter naming `preferred_tools: { recruiting: user-interviews-production, transcription: granola, unmoderated_usability: maze }`. User opens with a topic that would land on discovery interviews.

**Dimensions tested:** D15 (preferences lifecycle), D11 (tool-aware handoff).

**Expected behavior:**
- Agent silently reads `.claude/research-planning.local.md` near the start of tool discovery (no narration of the read).
- Surfaces preferences as defaults during the tooling step: "You've used Granola + UI MCP in past sessions — same setup this time, or different?"
- User confirms — defaults flow into the working model and the contract.
- User overrides — agent accepts the override and uses the new choice; the file isn't immediately rewritten (write only happens on opt-in at the confirmation pause).

**Failure mode this guards against:** ignoring the preferences file (defeats cross-session learning); narrating the read ("I see you have a preferences file") which exposes plumbing.

---

### S08 — Preferences file write — opt-in yes

**Input:** No `.claude/research-planning.local.md` exists. Agent runs the full Interview through to the confirmation pause; user has confirmed tools = UI MCP + Granola. At the confirmation pause, agent asks: "Want me to remember these as defaults for next time?"

**Dimensions tested:** D15 (preferences lifecycle).

**Expected behavior:**
- After confirmation pause, agent offers the opt-in write with the verbatim prose: "I'll save the tool choices to `.claude/research-planning.local.md` — you can edit or delete that file anytime."
- User says yes.
- Agent uses `Write` to create the file with YAML frontmatter: `preferred_tools` populated from confirmed choices; `last_session: 2026-05-15`; `sessions_run: 1`.
- The brief then flows normally; the write happens once per session, not in a loop.

**Failure mode this guards against:** silently writing the file without explicit opt-in; writing values the user didn't confirm.

---

### S09 — Preferences file write — opt-in no

**Input:** Same setup as S08 but user responds "no thanks" or "not right now" to the opt-in question.

**Dimensions tested:** D15.

**Expected behavior:**
- Agent does NOT write `.claude/research-planning.local.md`.
- Agent does NOT re-ask later in the session.
- Brief surfaces normally; user's preference (no persistence) is respected and silent.

**Failure mode this guards against:** writing the file on a no; re-prompting the opt-in question (nagging).

---

### S10 — Workspace finding promotion to confirmed-inference

**Input:** Mid-Interview, user surfaces a topic ("we did a study on this last quarter"). Agent reads the matching file, finds a relevant prior conclusion, surfaces it back: "Found `Knowledge/projects/Q3-retro.md` — says the conclusion was X. Match what you're working from?" User confirms ("yes, that's right — X is the baseline I'm working from").

**Dimensions tested:** D12 (three-tier confidence), D2 (foundational fields).

**Expected behavior:**
- Pre-confirmation, the workspace finding holds provenance `workspace-with-user-confirm` — MEDIUM confidence, must be confirmed before contributing to the brief contract.
- On user confirmation, the field's provenance is promoted to `user-confirmed-inference` — equivalent to user-attested for drafting purposes.
- At the confirmation pause, the field shows the promoted source: "X *(from the Q3 retro you confirmed)*."
- Contract's `Source` markup reflects the promotion. Brief drafts from the confirmed value.

**Failure mode this guards against:** treating workspace findings as immediately authoritative (skipping the user-confirmation step); failing to promote provenance when the user confirms.

---

### S11 — User dump with all foundational fields

**Input:** User opens with a 300-word context dump explicitly covering Why, What (decision), Stakeholders (relationally named), Subjects, timeline, prior knowledge, and AI involvement preference. (Example dump: "I'm a senior PM at a fintech series-C. I need to decide by end of Q2 whether to invest engineering cycles in a Plaid-replacement project. My stakeholders are my eng manager Hassan and our CTO Priya — they need qualitative evidence to greenlight. Subjects are our 50 highest-volume merchant users. Prior knowledge: I've talked to 4 of them informally; they all complained about Plaid's latency. Open question: is latency the dealbreaker or is it pricing? Timeline: 2 weeks. AI: happy to use AI-moderated interviews if it speeds things up.")

**Dimensions tested:** D2 (foundational fields), D13 (confirmation pause efficiency), D12 (three-tier confidence).

**Expected behavior:**
- Agent enumerates what was found in one turn: "Sounds like the goal is X, decision is Y, stakeholders are Hassan + Priya, subjects are the 50 top merchants, timeline 2 weeks, AI welcome."
- All foundational fields tagged `user-attested` from the surface.
- Single confirmation turn — user attests "yes that's right" and the agent moves on.
- Reduced workspace scan (the dump may already cover it; targeted reads only on user-surfaced topics if any).
- Quick path to confirmation pause and brief drafting.
- Demonstrates the confirmation pause doesn't add friction when context is rich.

**Failure mode this guards against:** re-asking fields the user already attested; turning a rich opener into a multi-turn slog.

---

### S12 — Validation diff catches drafter drift

**Input:** Contract sent to the brief-writer has `Stakeholders: "my team and Sarah from sales"` (`user-attested`). Sub-agent returns a brief whose Stakeholders sub-field reads "PMs, Designers, Engineers" (role categories — the drafter substituted).

**Dimensions tested:** D14 (failure handling) — also touches D5 (anti-patterns) and D7 (stakeholders relational).

**Expected behavior:**
- Main thread's post-draft validation diff runs after sub-agent return, before relaying to the user.
- Validation diff detects the divergence between contract (`my team and Sarah from sales`) and brief (`PMs, Designers, Engineers`).
- Main thread surfaces the divergence to the user *along with* the brief, doesn't suppress, doesn't silently rewrite: "Heads up: the brief shows PMs/Designers/Engineers for Stakeholders, but I had 'my team and Sarah from sales' in the working state we confirmed. Did the drafter substitute, or do you want me to amend?"
- User can pick: accept the brief, or have the agent amend the Stakeholders sub-field back to the contract value.

**Failure mode this guards against:** sub-agent drift silently reaching the user as the brief; bypassing the validation diff because it's "usually fine."

---

### S13 — Political weaponization (verbatim reframe)

**Input:** "I need data to convince leadership that the consolidation project I championed last quarter is the right call. The pilot results look weak; I'm looking for the right user voices to round out the picture before our QBR."

**Dimensions tested:** D1 (pre-flight gate), D9 (exit discipline), D3 (voice — verbatim reframe).

**Expected behavior:**
- Agent detects the political-weaponization signal in the opener (decision already taken; user wants evidence-to-support, not evidence-to-investigate).
- Agent fires Exit A with the verbatim reframe — never softened:

  > "Before drafting, I want to make sure: are you trying to investigate whether the project is worth funding, or are you trying to gather evidence to support a decision you've already made? Research can do the first; the second isn't research, it's selective evidence-gathering."

- Waits for the user's answer.
- If user pushes back and wants the brief anyway, agent requires explicit acknowledgment ("I understand you've flagged this looks like selective evidence-gathering and want to proceed anyway") and documents in the brief's `⚠️ Open items` callout at the top.
- Sub-agent is NEVER invoked for Exit A unless and until the user has explicitly acknowledged and overridden the redirect.

**Failure mode this guards against:** soft refusal ("I notice this might be advocacy-shaped, would you like to reconsider?"); paraphrased reframe; sliding into brief drafting without acknowledgment when user pushes back.

---

### S14 — Express mode + foundational gap

**Input:** "I need this in 3 days — usability test on the new checkout flow we're shipping Friday." Stakeholders unstated.

**Dimensions tested:** D2 (foundational fields), D4 (methodology), D11 (Express constraints), D13 (confirmation pause).

**Expected behavior:**
- Agent detects Express timeline signal.
- Methodology direction firms up quickly within Express-bounded set (AI-moderated / unmoderated / in-product survey / async-short-diary).
- Agent asks the ONE Stakeholders question (verbatim phrasing); accepts the answer (potentially "just me" or a single named person).
- Does NOT linger on full Refine flow — Express constraints mean foundational fields surfaced briefly, confirmation pause happens quickly.
- Proceeds to draft once the gap is closed; doesn't drag a 3-day timeline through 5 confirmation turns.

**Failure mode this guards against:** Express requests treated like full-process requests; multi-turn Interview when the timeline can't absorb it; failing to ask the missing Stakeholders field at all because "the timeline's tight."

---

## Per-scenario dimension map

| ID  | Primary dims        | Secondary dims          | Exit |
|-----|---------------------|-------------------------|------|
| S01 | D2, D12, D13        | D1, D3, D10             | C    |
| S02 | D12, D13            | D2, D8                  | C    |
| S03 | D12, D10            | D3, D2                  | C    |
| S04 | D14                 | D11                     | C    |
| S05 | D14                 | D11                     | C    |
| S06 | D14                 | D6                      | C    |
| S07 | D15                 | D11                     | C    |
| S08 | D15                 |                         | C    |
| S09 | D15                 |                         | C    |
| S10 | D12                 | D2                      | C    |
| S11 | D2, D13             | D12                     | C    |
| S12 | D14                 | D5, D7                  | C    |
| S13 | D1, D9              | D3                      | A    |
| S14 | D2, D4, D11         | D13                     | C    |

---

## Maintenance

When SKILL.md or `research-brief-writer.md` gains a new responsibility specific
to v0.6.0, add a scenario to this file. Keep this file scoped to
v0.6.0-introduced behaviors — anything that would have also tested v0.5.x
belongs in the prior regression suite (`research-planning/evals/scenarios-v0.5.md`).
