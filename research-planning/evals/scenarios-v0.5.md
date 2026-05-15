# Research Planner Sub-Agent — v0.5.0 Eval Scenarios

A scenario suite specific to v0.5.0's RPI-shaped workflow and three-outcome exit
model. Sibling to [`scenarios.md`](./scenarios.md) (S01–S25 regression baseline
covering v0.4.0's 11-step workflow); these 14 scenarios target behaviors that
only exist in v0.5.0:

- Phase 1 inference from a broad opener (vs. v0.4.0's cold foundational asks)
- Phase 2 multi-stream research (workspace scan, conditional web search, tool
  discovery) and the "present research back" rule
- Three first-class exit outcomes (A: redirect, B: dig more, C: brief) with
  fluid phase boundaries and narrated pivots
- Tool-aware Phase 4 handoff specific to the tool(s) chosen during Phase 3

Each scenario maps to one or more edge cases enumerated in the v0.5.0 design
memo §7 (`Knowledge/projects/planning-skill/plugin-v0.5.0-rpi-redesign.md`).
Scoring lives in [`rubric-v0.5.md`](./rubric-v0.5.md) — the 11-dim binary
rubric (D1–D8 carry over from `rubric.md`; D9–D11 are new for v0.5.0).

---

## Scenarios

### S01 — "I don't know much yet"

**Input:** "I want to figure out something around skill-sharing on engineering teams, but honestly I don't really know much about this yet."

**Dimensions tested:** Phase 1 thin-prior-knowledge handling, Phase 2 research-carries-the-load fallback, Exit C default

**Expected behavior:**
- Phase 1 (Interview): agent does NOT treat thin prior knowledge as a failure. Acknowledges and moves on without over-interviewing.
- Phase 2 (Research): workspace scan runs to fill the prior-knowledge gap. Audience-accessibility check fires; if topic is publicly-written-about, web search is offered.
- Phase 3 (Plan): brief is assembled from research findings + targeted gap-fill, not from a cold foundational interview.
- If foundational fields remain inferred, ⚠️ Open items callout fires at the top of the brief.

**Pass criteria:** no "please tell me more first" friction; Phase 2 research carries the foundational-field load; brief drafts with callout flagging any remaining inferences; no plumbing language leaks.

---

### S02 — 300-word context dump with all foundational fields

**Input:** A 300-word opener covering: PM at SaaS company; deciding whether to invest in a skill-sharing platform; stakeholders are eng leadership + her manager; subjects are senior engineers on platform teams; timeline is end of quarter; prior research she's read on the topic; specific assumptions she wants to test.

**Dimensions tested:** Phase 1 over-interviewing defense, Phase 2 reduced scan, fast path to brief

**Expected behavior:**
- Phase 1: agent enumerates what it found ("Sounds like the goal is X, decision is Y, stakeholders are Z, subjects are W"). Confirms in one turn. Does NOT re-ask any field the user already provided.
- Phase 2: reduced workspace scan (the user's dump may already cover it). Web search skipped unless audience-accessibility check still independently fires. Tool discovery still runs.
- Phase 3: brief drafts without belaboring the interview. No ⚠️ callout (all fields attested).

**Pass criteria:** agent does NOT re-ask fields the user provided; Phase 2 streams reduced but not skipped entirely; brief lands in 2-3 turns total; no plumbing language leaks.

---

### S03 — Phase 2 workspace scan finds nothing

**Input:** "I want to understand how customer support agents at logistics companies handle exceptions during peak season." (Workspace contains no files matching the keywords.)

**Dimensions tested:** Phase 2 Stream 1 negative-result handling, graceful fallback

**Expected behavior:**
- Phase 2: agent runs Stream 1 (workspace scan) narrating intent. After the glob+grep produces nothing relevant, reports the negative plainly: *"Looked for files matching support agents, logistics, exceptions, peak season — nothing relevant in your workspace."*
- Agent does NOT flag the empty workspace as a problem. Falls back to interview-only mode for remaining streams.
- Phase 3 brief drafts from Interview + Stream 2/3/4, with no apologetic "I wish I had more context" coda.

**Pass criteria:** negative result reported plainly; agent does not nag user about absence; brief still produced from non-workspace streams; no plumbing language.

---

### S04 — Phase 2 web search offered, user declines

**Input:** "I want to understand how indie game developers think about Steam vs. Itch.io for launch." (Audience-accessibility check returns "rarely" + topic publicly-written-about; agent offers web search; user replies "no, just go off what we've talked about.")

**Dimensions tested:** Phase 2 Stream 2 opt-in discipline, gracefully proceeding on decline

**Expected behavior:**
- Phase 2: agent asks the audience-accessibility pair correctly. With "rarely + publicly-written-about" combo, offers web search rather than running it.
- User declines. Agent does NOT nag, does NOT re-offer, does NOT push back on the decision.
- Phase 3: brief drafts from what's gathered. Methodology rationale may note the absence of secondary research if relevant (e.g., flag in How → role-of-secondary-research).
- The user's "decline" doesn't morph the run into Exit B unless the broader Exit B composite actually fires.

**Pass criteria:** single offer, no nag; brief produced; web-search absence may be flagged in brief's methodology section but not as a refusal trigger.

---

### S05 — Phase 2 research flips Exit C → Exit B

**Input:** Opener: "I want to do generative research with research ops leads about how they think about non-employee incentive policy." (Phase 1 looks like a clean Exit C path. Phase 2 workspace scan turns up a Reforge piece and two prior internal memos on incentive policy; audience-accessibility check returns "monthly + publicly-written-about.")

**Dimensions tested:** Phase 2 → Exit B pivot, narrated pivot, fluid phase boundaries

**Expected behavior:**
- Phase 1 produces a working model heading to Exit C.
- Phase 2 Stream 1 surfaces prior public + internal writing on the topic. Audience-accessibility check pairs hard-to-reach with publicly-written-about.
- Agent narrates the pivot in plain language: *"Hold on — looks like there's quite a bit already written on this, and your audience is hard to recruit. Before we scope primary research, let me suggest a different sequencing."*
- Routes to Exit B using `secondary-research-paths.md` — 2-hour desk path with specific search queries built from the Phase 1 surface, named source types for B2B SaaS, and the standing offer to return.

**Pass criteria:** pivot is narrated, not silent; Exit B fires with concrete digging guidance (not generic "do desk research first"); standing offer to return is verbatim; no "phase two" language exposed.

---

### S06 — Phase 2 research flips Exit C → Exit A

**Input:** Opener: "We're scoping research on whether to launch the enterprise tier in EMEA." (Phase 1 looks Exit-C-shaped. Phase 2 workspace scan turns up `decisions/2026-04-emea-launch-memo.md` showing leadership locked in the EMEA launch three weeks ago.)

**Dimensions tested:** Phase 2 → Exit A pivot via A1 (decision already made), narrated pivot

**Expected behavior:**
- Phase 1 produces a working model heading to Exit C.
- Phase 2 Stream 1 surfaces the decision memo. Agent re-runs Exit A trigger checks against the post-scan picture.
- Agent narrates the pivot: *"Hold on — the memo from April says the EMEA launch is already decided. Research after the fact rarely changes the call. Let me redirect."*
- Outputs Exit A redirect (per A1 in `pre-flight-gate.md`): two alternatives — (a) decision memo documenting rationale, or (b) reframe to evaluative research on *implementation* (which surfaces are confusing, usability/A/B).

**Pass criteria:** pivot narrated; Exit A redirect produced with both alternatives; the specific memo is quoted as the trigger; no brief drafted on the original framing; no plumbing leaks.

---

### S07 — Phase 3 foundational gap can't be filled

**Input:** Opener thin on stakeholders. Phase 2 workspace scan + targeted gap-fill in Phase 3 still don't surface them. User says: "Honestly, I don't know who the stakeholders are yet."

**Dimensions tested:** ⚠️ Open items callout discipline, fabrication defense, targeted-asks-then-flag pattern

**Expected behavior:**
- Phase 3: agent asks the targeted gap question once, plain English (the verbatim Stakeholders ask phrasing from the prompt).
- User can't answer. Agent does NOT fabricate a stakeholder. Does NOT keep probing past one targeted ask.
- Agent flags the gap in the brief via the ⚠️ Open items callout at the TOP, above any drafted content. Names the inferred-or-missing field with a one-line ask: *"Stakeholders: undetermined — confirm or correct before proceeding."*
- The Who → Stakeholders field in the brief body reads "TBD (see Open items)" or similar, not a fabrication.

**Pass criteria:** no fabrication; callout fires at top of brief; field's body content reflects the gap honestly; single targeted ask, no nagging.

---

### S08 — Exit A redirect, user wants brief anyway

**Input:** S03-style decision-already-made trigger fires in Phase 1. Agent produces Exit A redirect. User responds: "I hear you, but my VP still wants the brief. Just draft it."

**Dimensions tested:** Exit A pushback handling, explicit acknowledgment + documentation, redirect-then-comply protocol

**Expected behavior:**
- Agent quotes the user's specific framing back in the user's own language ("you said the decision is already made, that's the part I flagged").
- Agent requires explicit acknowledgment: *"To proceed, I need you to acknowledge — 'I understand this looks like the decision is already made and want to proceed anyway.'"*
- On acknowledgment, agent drafts the brief BUT documents the acknowledgment in the ⚠️ Open items callout at the top of the brief.
- Brief proceeds with the original framing but the callout is non-negotiable.

**Pass criteria:** explicit acknowledgment required and documented; ⚠️ callout at top of brief carries the acknowledgment language; brief still drafts (compliance after the principled redirect); no soft "well, since you insist" capitulation.

---

### S09 — Audience-accessibility ambiguous

**Input:** Phase 2 Stream 2 audience-accessibility check. Agent asks the pair; user says "I honestly don't know how hard they'd be to reach."

**Dimensions tested:** Phase 2 ambiguous-input default, brief-flagging discipline, Exit C default when triggers don't conclusively fire

**Expected behavior:**
- Agent does NOT pattern-match a guess at accessibility. Accepts the "I don't know" answer.
- Defaults to Exit C (no Exit B trigger fires conclusively).
- In Phase 3 brief's Who section, adds a flag sentence: *"Confirm reach to this audience before fielding — if it's harder than expected, secondary research first may be the right move."*
- Recommends user verify accessibility as a pre-recruiting step in Next steps.

**Pass criteria:** Exit C fires (not a speculative Exit B); brief includes the flag sentence in Who; Next steps surfaces the accessibility-check-before-fielding action; no plumbing leaks.

---

### S10 — User points at file that conflicts with workspace glob

**Input:** Phase 2 Stream 1. Agent asks "anywhere I should look first?" User points to `Knowledge/2026-03-skill-sharing-pilot-retro.md` saying the pilot worked well. Workspace glob also surfaces `Knowledge/2026-04-skill-sharing-team-pulse.md` reporting low adoption and engineer pushback.

**Dimensions tested:** Conflict surfacing per `workspace-scanning.md`, anti-silent-averaging discipline, user-resolves-conflicts rule

**Expected behavior:**
- Agent reads both files (within the 3-file / 5K-char cap).
- Surfaces the conflict explicitly, quoting both excerpts in 1-2 sentences each: *"The pilot retro you pointed me to says X. The team pulse from the next month says Y. Which should I weight?"*
- Does NOT silently average ("the pilot had mixed results"), does NOT apply a recency heuristic ("the pulse is newer so it wins"), does NOT apply a source heuristic ("the retro is more formal so it wins").
- Waits for the user's resolution before continuing. The unchosen interpretation is discarded for this brief.

**Pass criteria:** both files quoted; explicit ask; no silent resolution; user-resolved interpretation flows into Phase 3 working model; no plumbing language.

---

### S11 — Re-invocation post-brief asking for amendment

**Input:** A brief has been produced in this conversation. User says: "Actually, can you re-do this with an Express timeline — I need it in 3 days." (Pure Polish-style amendment.)

**Dimensions tested:** Polish-vs-fresh-interview discipline, sticky state, surgical re-running of affected sections only

**Expected behavior:**
- Agent treats this as a Phase 3 amendment, NOT a fresh Phase 1 interview.
- Does NOT re-ask foundational questions (Why / What / Stakeholders / Subjects already attested in the original brief).
- Re-runs methodology selection with the new timeline constraint. Surfaces tradeoffs: Express bounds methods to AI-moderated / unmoderated / in-product survey / async-short-diary.
- If original method doesn't fit the Express set, agent surfaces the method shift and asks user to confirm before re-drafting.
- Updates affected sections (How → method, How → tools, When and where → timeline, Next steps) and shows an inline diff or "what changed" note. Does NOT regenerate the whole brief silently.

**Pass criteria:** no fresh interview; surgical re-run of affected sections only; user sees what changed; methodology re-selection runs against Express constraints; no plumbing leaks.

---

### S12 — Phase 2 Stream 4 — no execution tools detected

**Input:** Phase 2 Stream 4 runs. No `user-interviews-*` MCPs visible in env, no Granola/Bluedot MCPs, no notion MCP, no slack MCP. Agent asks user about non-MCP tools. User says: "I don't have any of those — we're scrappy."

**Dimensions tested:** Phase 4 tool-aware handoff fallback, manual-recruiting routing, honest gap-naming in brief

**Expected behavior:**
- Phase 3 methodology selection still runs normally based on the question + decision intent.
- Tooling recommendation step surfaces the manual path honestly: *"No recruiting tool available in your environment, and you haven't named one — your options are internal panel + Calendly + Zoom + Otter, or sourcing per-study."*
- Brief's How → Tools & logistics sub-field reads "manual" with specific gaps named: panel provider, recording tool, scheduling tool.
- Phase 4 handoff paragraph routes to the manual path: *"Use this brief as-is — share with your team, run it through your panel provider, or work it directly."*
- Agent does NOT pretend a tool exists; does NOT recommend a tool the user doesn't have.

**Pass criteria:** Tools & logistics reads "manual" with specific gaps; Phase 4 handoff matches manual path verbatim from the prompt; no fabricated tools; no plumbing leaks.

---

### S13 — Multiple tools could serve method

**Input:** Phase 2 Stream 4 auto-detects User Interviews MCP + Granola MCP. User also mentions: "I have a Maze account and a Lyssna account." Phase 3 lands on unmoderated usability as the method.

**Dimensions tested:** Multi-tool ranking, Phase 3 user-picks-tool flow, Phase 4 handoff specific to choice

**Expected behavior:**
- Phase 3 tooling recommendation surfaces 2-3 ranked options for unmoderated usability:
  1. Maze (user-named, fits method, has prototype integration)
  2. Lyssna (user-named, fits method, lighter-weight)
  3. UserTesting unmoderated (only if user mentioned; else not surfaced)
- Auto-detected MCPs (UI MCP, Granola) noted as not-the-best-fit for unmoderated usability — UI MCP for recruiting only, Granola not relevant to unmoderated tests.
- User picks (e.g., Maze). Brief's How → Tools & logistics names Maze with rationale.
- Phase 4 handoff paragraph is Maze-specific: *"Drop the relevant sections into Maze's setup flow — the What + Who + How sections map directly to its prototype, audience, and task fields."*

**Pass criteria:** 2-3 ranked options surfaced; user picks; brief + handoff specific to choice (not generic); ranking rationale visible; no plumbing leaks.

---

### S14 — User-named tool doesn't fit method

**Input:** Phase 2 Stream 4. User mentions: "I have a Maze account, can we use that for the interviews?" Phase 3 methodology selection lands on 1:1 generative discovery interviews (depth interviewing).

**Dimensions tested:** Method-tool mismatch surfacing, anti-silent-substitution discipline, offer-to-shift-method-or-tool

**Expected behavior:**
- Agent does NOT silently substitute (e.g., quietly recommending Zoom + Granola while pretending the user's Maze account is part of the workflow).
- Agent does NOT shoehorn the depth interviews into Maze (which is unmoderated).
- Agent surfaces the mismatch in plain language: *"Maze is great for unmoderated usability, but for the depth-interview shape we landed on, you'd want Zoom + Granola or a similar moderated setup. Want to stick with depth interviews, or shift the method to unmoderated usability to fit Maze?"*
- Gives the user a real choice: shift the tool OR shift the method.
- Whichever the user picks, Phase 4 handoff is tool-specific to that choice.

**Pass criteria:** mismatch surfaced explicitly; both options (shift tool vs. shift method) offered; no silent substitution; no pretending Maze works for depth interviews; final brief + handoff match user's resolved choice.

---

## Per-scenario dimension map

| ID  | Phase tested  | Exit outcome     | Key behavior probed                                 |
|-----|---------------|------------------|-----------------------------------------------------|
| S01 | 1 + 2         | C                | Thin-prior-knowledge → research carries load        |
| S02 | 1 + 2         | C                | Dense opener → reduced scan, no re-asking           |
| S03 | 2             | C                | Empty workspace → graceful fallback                 |
| S04 | 2             | C                | Web search declined → proceed without nag           |
| S05 | 2             | C → B            | Research flips to Exit B, narrated pivot            |
| S06 | 2             | C → A            | Research flips to Exit A, narrated pivot            |
| S07 | 3             | C (with ⚠️)      | Gap survives interview + research → callout         |
| S08 | 1             | A → comply       | Exit A pushback → acknowledgment + document         |
| S09 | 2             | C (with flag)    | Ambiguous accessibility → default C + flag in brief |
| S10 | 2             | C                | Conflict surfacing, no silent average               |
| S11 | Polish        | C (amend)        | Re-invocation = amendment, not fresh interview      |
| S12 | 2 + 4         | C (manual)       | No tools → manual handoff path                      |
| S13 | 2 + 3 + 4     | C (multi-tool)   | Multi-tool ranking + tool-aware handoff             |
| S14 | 2 + 3         | C (resolved)     | Method-tool mismatch surfaced, user resolves        |

---

## Maintenance

When the agent prompt gains a new responsibility specific to v0.5.0, add a scenario
to this file rather than the regression `scenarios.md`. Keep this file scoped to
v0.5.0-introduced behaviors — anything that would have also tested v0.4.0 belongs
in the regression suite.
