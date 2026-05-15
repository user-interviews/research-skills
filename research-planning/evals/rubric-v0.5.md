# Research Planner Sub-Agent — v0.5.0 Scoring Rubric (11-dim)

Each scenario in [`scenarios-v0.5.md`](./scenarios-v0.5.md) is scored against the
11 binary dimensions below. Total per scenario: **0–11** (some dims may be N/A).
Aggregate score across N scenarios: **0 – (11 × N − N/A)**.

D1–D8 carry over from [`rubric.md`](./rubric.md), preserved verbatim where
possible — they're the regression dimensions, equally applicable to v0.5.0. D9,
D10, D11 are new for v0.5.0 and target behaviors that only exist in the new
workflow shape.

Scoring is strict: **1 (pass)** only if the agent fully satisfies the dimension.
**PARTIAL** counts as 0 for aggregate purposes but is flagged so the run report
can describe what was close-but-not-quite. **N/A** counts as automatic pass for
aggregate purposes (e.g., D6 is N/A when an Exit A redirect is the right move
and no brief should be drafted).

---

## D1 — Pre-flight gate honored

**Definition:** The agent correctly refused-or-redirected when the input fails a
pre-flight check (Exit A or Exit B), and proceeded when it passes. The gate is
neither over-applied (refusing well-formed asks) nor under-applied (drafting on
inputs that should have been redirected).

**Score 1 when:**
- The gate's verdict matches the scenario's expected exit (A, B, or C).
- If the gate fails, the redirect quotes the specific concern in user-facing language.
- If the gate passes, the agent moves into Phases 2–3 cleanly.

**Score 0 when:**
- A "fail" scenario gets a brief drafted anyway.
- A "pass" scenario gets spuriously refused.
- Gate reasoning is generic rather than tied to the specific failure mode.

**Pass example (S06):** "Hold on — the memo from April says the EMEA launch is already decided. Research after the fact rarely changes the call."

**Fail example (S06):** Drafts a brief titled "Validating the EMEA launch" without surfacing the decision-memo finding.

---

## D2 — Foundational fields populated correctly

**Definition:** Why / What (decision) / Stakeholders / Research subjects are
populated in the working model before the brief is drafted. v0.5.0 INFERS these
from the Phase 1 surface (per OP #1 swap), so the test is: did the agent
correctly infer what was attested, ask only the gaps, and flag any remaining
inferences via the ⚠️ Open items callout at the TOP of the brief?

**Score 1 when:**
- All four foundational fields are either explicitly attested, correctly inferred from Phase 1+2 surface, OR explicitly asked-and-answered.
- The agent does NOT re-ask fields the user already provided.
- If any field is still inferred at brief time, the ⚠️ Open items callout fires at the **top** of the brief, above any drafted content.
- "Just me" is accepted as a valid Stakeholders answer without probing.

**Score 0 when:**
- A field is silently inferred without the ⚠️ callout firing.
- The agent re-asks a field the user already attested.
- Inferences are present but the callout is buried at the bottom or absent.
- Solo case is probed further ("but who else might…?").

**Pass example (S02):** Agent enumerates the dump: "Sounds like the goal is X, decision is Y, stakeholders are Z, subjects are W. Anything to correct?" Single confirmation turn.

**Fail example (S02):** Agent asks for Why, then What, then Stakeholders, then Subjects despite the user having attested all four in the opener.

---

## D3 — Voice / no plumbing leakage

**Definition:** User-facing output does not mention internal implementation
language: "Phase 1," "Phase 2," "Stream 4," "the workflow," "the gate," "operating
principle," "references," "the rubric," "system reminder," "playbook." Output
reads as plain-language researcher voice. The Stakeholders ask, if used, uses
the verbatim plain-English phrasing. The political-weaponization reframe, if
triggered, is verbatim.

**Score 1 when:**
- Output reads as plain-language researcher voice across all turns.
- Redirects quote the user-facing concern, not the gate's name.
- Fallbacks (reference file fails to load) are silent.
- Stakeholders ask, when used, matches verbatim phrasing.
- Political-weaponization reframe, when used, is verbatim.

**Score 0 when:**
- Any banned term appears in user-facing output.
- The agent narrates phase transitions ("transitioning to Research...").
- Fallback announcements surface.
- Stakeholders ask is paraphrased.
- Political-weaponization reframe is softened.

**Pass example:** "Let me check your workspace for files matching skill-sharing — sound good?"

**Fail example:** "Beginning Phase 2 Research, Stream 1. Loading workspace-scanning.md..."

---

## D4 — Methodology selected with rationale

**Definition:** The brief names a method explicitly. Method is tied to the
research question, decision intent (Pejman's 3 categories), audience (Who), and
constraints. Multi-axis rubric from `methodology-selection.md` is applied. If
interview-style, AI-moderation-fit check runs.

**Score 1 when:**
- A specific method is named (not "user research" generically).
- Rationale references ≥2 of: decision type, product-cycle stage, generative-vs-evaluative, budget/timeline, evidence-stakeholders-find-compelling.
- For solo studies (Stakeholders = "just me"), the audience-evidence axis is correctly skipped.
- If method is interview-style, AI-moderation-fit is run.

**Score 0 when:**
- Method is generic.
- No rationale ties method to question.
- Method is picked before question refinement.
- Solo case has the audience-evidence axis applied anyway.

**N/A when:** Exit A or Exit B fires and no method is drafted.

---

## D5 — Anti-patterns caught

**Definition:** The brief doesn't exhibit any of the anti-patterns from
`anti-patterns.md`: method-first, validation framing, leading questions,
synthetic-as-substitute, no counterfactual, ranges with overlap,
self-reported-future-behavior-as-evidence, no real humans named in Who,
stakeholders-as-role-categories, generic-LLM-brief.

**Score 1 when:**
- Scan of the brief surfaces zero anti-patterns.
- For inputs containing an anti-pattern, the agent catches and reframes.
- Stakeholders are named as relationships / teams, not role categories.

**Score 0 when:**
- Any anti-pattern survives into the final brief.
- The agent fails to catch an anti-pattern present in the input.
- Stakeholders read "PMs, Designers" instead of "my team, Sarah from sales."

**N/A when:** Exit A or Exit B fires and no brief is drafted.

---

## D6 — 6-field brief structure complete

**Definition:** The brief uses the canonical 6-field structure from
`templates/default-brief.md`: **What / Why / How / Who / When and where / Next
steps**. All six fields are populated with non-empty, non-trivial content. The
Phase 4 handoff paragraph is appended; the Patterns-applied footer is present.

**Score 1 when:**
- All 6 fields are present and named correctly.
- Each field has at least the canonical sub-content.
- Handoff paragraph appended (specific to chosen tool — see D11).
- Patterns-applied footer present.

**Score 0 when:**
- A field is missing.
- A field is a one-liner with no real content.
- Handoff paragraph is missing.
- Patterns footer is missing.
- Fields are reorganized.

**N/A when:** Exit A or Exit B fires and no brief is drafted.

---

## D7 — Stakeholders captured relationally, not categorically

**Definition:** The Stakeholders field captures specific people, teams, or
relationships ("my team," "my manager," "Sarah from sales") — not role-category
abstractions ("PMs," "Designers," "Engineers," "Executives," "Researchers").
"Just me" is a valid and common answer that doesn't trigger further probing.

**Score 1 when:**
- Stakeholders read as relationships or specific names.
- Solo answers ("just me") accepted and recorded as-is.
- Research subjects and stakeholders are named separately when they diverge.

**Score 0 when:**
- Stakeholders read as role categories.
- Agent probes further on a clean "just me" answer.
- Stakeholders and research subjects are conflated.

**N/A when:** Exit A or Exit B fires and no brief is drafted.

---

## D8 — Inference surrogate guard (⚠️ Open items callout)

**Definition:** If any foundational field (Why / What / Stakeholders / Research
subjects) is inferred rather than attested at brief-output time, the
`⚠️ Open items to confirm` callout fires at the **TOP** of the brief, above
any drafted content. Lists each inferred field with the inference and a one-line
ask. Also fires when an Exit A acknowledgment is documented for an override.

**Score 1 when:**
- If any field is inferred, callout fires at top of brief.
- Each inferred field is listed with the inference and a confirm/correct ask.
- For Exit A overrides, the user's acknowledgment is documented in the callout.
- Callout is above any other brief content (not at the bottom, not as a footnote).

**Score 0 when:**
- Inferences are present but no callout fires.
- Callout fires but is below the brief content.
- Callout fires but doesn't name the specific inferred field.

**N/A when:** All foundational fields attested AND no Exit A override.

**Pass example (S07):** ⚠️ Open items at top of brief: "Stakeholders: undetermined — confirm or correct before proceeding."

**Fail example (S07):** Brief drafts with Stakeholders = "TBD" but no callout fires.

---

## D9 — Three-outcome exit discipline (NEW for v0.5.0)

**Definition:** The agent fires the correct exit (A / B / C) given the inputs.
Exit A redirects carry honest alternatives, not just refusal. Exit B redirects
include the verbatim standing offer and concrete digging guidance from
`secondary-research-paths.md`. Political-weaponization reframe stays verbatim
when triggered. If the user pushes back, the principled response holds (explicit
acknowledgment required for Exit A; document-as-risk for Exit B).

**Score 1 when:**
- Correct exit fires for the scenario's expected outcome.
- Exit A output names ≥1 honest alternative (decision memo, stakeholder workshop, analytics check, evaluative reframe).
- Exit B output includes the verbatim standing offer ("After 2 hours of desk research, if a gap remains, come back...") AND concrete search queries built from the user's case.
- Political-weaponization reframe phrasing is verbatim, not softened.
- On Exit A pushback, agent requires explicit acknowledgment and documents in ⚠️ callout.
- On Exit B pushback, agent documents the override as a methodology risk in the brief.

**Score 0 when:**
- Wrong exit fires (e.g., scenario triggers Exit A; agent drafts a brief instead).
- Exit A redirect is a pure refusal without alternatives.
- Exit B output is generic ("do desk research first") with no concrete queries.
- Political-weaponization reframe is paraphrased.
- Exit A pushback is accepted softly without explicit acknowledgment.

**N/A when:** Scenario doesn't test exit discipline (rare — most v0.5.0 scenarios touch it).

**Pass example (S06):** "Hold on — the memo from April says the EMEA launch is already decided. Research after the fact rarely changes the call. Two options: (a) skip this study and document the decision rationale in a decision memo, or (b) reframe as evaluative research on the implementation."

**Fail example (S06):** "I'll draft a brief on the EMEA launch — what's the timeline?"

---

## D10 — Phase fluidity (NEW for v0.5.0)

**Definition:** The agent narrates pivots in plain language when post-research
information flips the working model, rather than silently changing course OR
enforcing strict phase order. The agent does NOT expose phase numbers or
internal language in user-facing text. The agent stays in the user's frame —
researcher-thinking-out-loud voice — not the workflow's frame.

**Score 1 when:**
- When a pivot happens (Exit C → A, Exit C → B, working-model change), agent narrates it in plain language: "Hold on — that changes the picture..."
- No phase numbers exposed ("Phase 2," "Stream 4," "transitioning to Plan").
- Narration sounds like a researcher thinking out loud, not a system reporting state.
- Fluid boundaries are honored — agent doesn't refuse to revisit a foundational field if post-research info reveals a gap.

**Score 0 when:**
- A pivot happens but is silent (working model changes without narration).
- Phase numbers appear in user-facing text.
- Narration sounds like workflow-state reporting ("Entering Stream 1...").
- Agent refuses to revisit something post-Phase-1 even when research demands it.

**N/A when:** Scenario involves no pivot and no phase boundary tension (rare).

**Pass example (S05):** "Hold on — looks like there's quite a bit already written on this, and your audience is hard to recruit. Before we scope primary research, let me suggest a different sequencing."

**Fail example (S05):** Agent silently switches from Exit C path to Exit B without narration; or says "Transitioning to Phase 2 Research, Stream 2..."

---

## D11 — Tool-aware handoff (NEW for v0.5.0)

**Definition:** The Phase 4 handoff paragraph matches the user's chosen tool(s).
The brief's Tools & logistics sub-field names the right tool(s) with rationale.
If no tools are available, handoff routes to the manual-recruiting path honestly
— it does NOT fabricate a tool. If a user-named tool doesn't fit the chosen
method, agent surfaces the mismatch in plain language and offers a real choice
(shift tool or shift method).

**Score 1 when:**
- Handoff paragraph is specific to the tool(s) chosen during Phase 3.
- Brief's Tools & logistics names the chosen tool(s) with one-line rationale.
- If no tools: handoff matches the manual-recruiting paragraph verbatim from the prompt; Tools field reads "manual" with specific gaps named.
- For multi-tool scenarios: 2-3 ranked options surfaced, user picks, handoff matches the pick.
- For method-tool mismatch: agent surfaces the mismatch explicitly; no silent substitution.
- Ranking respects: auto-detected MCPs first, user-named tools second, manual fallback third.

**Score 0 when:**
- Handoff is generic ("paste this into your tool of choice") when a tool was chosen.
- Brief recommends a tool the user doesn't have.
- Method-tool mismatch is silently substituted without surfacing.
- Tools & logistics names a wrong-fit tool.
- Manual path is missing when no tools available — instead, agent fabricates "you could use Maze or similar."

**N/A when:** Exit A or Exit B fires and no brief / handoff is drafted.

**Pass example (S13):** Tools & logistics: "Maze (user-named; fits unmoderated usability)." Handoff: "Drop the relevant sections into Maze's setup flow — the What + Who + How sections map directly to its prototype, audience, and task fields."

**Fail example (S13):** Tools & logistics: "Various tools available." Handoff: "Paste this brief into your tool of choice."

---

## Scoring per scenario

```
Scenario S0X
| Dim                                       | Score        | Note |
|-------------------------------------------|--------------|------|
| D1 — pre-flight gate honored              | 0 or 1       | …    |
| D2 — foundational fields populated        | 0 or 1       | …    |
| D3 — voice / no plumbing leakage          | 0 or 1       | …    |
| D4 — methodology selected w/ rationale    | 0 / 1 / N/A  | …    |
| D5 — anti-patterns caught                 | 0 / 1 / N/A  | …    |
| D6 — 6-field brief complete               | 0 / 1 / N/A  | …    |
| D7 — stakeholders relational              | 0 / 1 / N/A  | …    |
| D8 — ⚠️ Open items callout discipline     | 0 / 1 / N/A  | …    |
| D9 — three-outcome exit discipline (NEW)  | 0 / 1 / N/A  | …    |
| D10 — phase fluidity (NEW)                | 0 / 1 / N/A  | …    |
| D11 — tool-aware handoff (NEW)            | 0 / 1 / N/A  | …    |
| Total                                     | X / 11       |      |
```

## Aggregate

For a run of N scenarios:

```
Total possible        : 11 × N (minus N/A)
Total achieved        : sum of all scenario totals
Pass rate             : achieved / possible
Per-dimension pass rate: (scenarios where Dx = 1) / (scenarios where Dx applies)
```

A regression is any dimension whose pass rate drops between runs against the same
agent prompt SHA (or whose drop correlates with a known prompt edit). The 85%
threshold is the v0.5.0 release gate — anything below indicates the prompt needs
revision before ship.
