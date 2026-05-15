# Research Planning Skill — v0.6.0 Scoring Rubric (15-dim)

Each scenario in [`scenarios-v0.6.md`](./scenarios-v0.6.md) is scored against
the 15 binary dimensions below. **YES** counts as pass, **NO** counts as fail,
**PARTIAL** is flagged with a note but counts as 0 for aggregate. **N/A**
counts as automatic pass (e.g., D6 is N/A when an Exit A redirect is the right
move and no brief should be drafted).

D1–D11 port forward from [`rubric-v0.5.md`](../../../research-planning/evals/rubric-v0.5.md);
verbatim wording is preserved where it still fits the v0.6.0 architecture. D12,
D13, D14, D15 are NEW for v0.6.0 and target behaviors that only exist in
Pattern B (main-thread Interview + brief-writer sub-agent + state contract +
preferences file).

**Pass gate:** ≥90% across (N scenarios × applicable dimensions) for release.

---

## D1 — Pre-flight gate enforcement

**Definition:** The skill correctly refused-or-redirected when the input fails a
pre-flight check (Exit A or Exit B) and proceeded when it passes. Gate is
neither over-applied (refusing well-formed asks) nor under-applied (drafting
on inputs that should have been redirected). Verbatim redirect language used
when an exit fires.

**YES when:** the gate's verdict matches the scenario's expected exit; redirect
quotes the specific user-facing concern; passing scenarios proceed cleanly to
Interview → Research → confirmation pause.

**NO when:** a fail-scenario gets a brief drafted anyway; a pass-scenario gets
spuriously refused; gate reasoning is generic.

**Pass example (S13):** "Before drafting, I want to make sure: are you trying
to investigate whether the project is worth funding, or are you trying to
gather evidence to support a decision you've already made?"

**Fail example (S13):** drafts a brief titled "Validating the consolidation
project" without firing Exit A.

---

## D2 — Foundational fields discipline

**Definition:** Why / What (decision) / Stakeholders / Research subjects are
populated correctly in the working model before the brief is drafted. Inferences
from the Interview surface are surfaced back to the user (not silently
committed). Gaps are asked once with verbatim phrasing. Genuinely-missing fields
at brief-time land in the `⚠️ Open items` callout at the TOP of the brief.

**YES when:** all four fields are either explicitly attested, correctly inferred
+ user-confirmed, or explicitly asked-and-answered; the skill does NOT re-ask
fields the user already provided; "just me" is accepted without probing.

**NO when:** a field is silently inferred without surfacing back; the skill
re-asks a field the user already attested; gap is fabricated rather than
flagged.

**Pass example (S11):** "Sounds like the goal is X, decision is Y, stakeholders
are Hassan + Priya, subjects are the 50 top merchants. Anything to correct?"

**Fail example (S01):** drafts a brief in one round with `subjects: designers
and PMs` and 5 other fields silently invented.

---

## D3 — Plain-language voice

**Definition:** User-facing output uses plain-language researcher voice. No
plumbing language: "the skill," "the workflow," "the sub-agent," "the gate,"
"the contract," "operating principle," "phase one," "stream four,"
"references," "the rubric." Verbatim-locked phrasings (opener, stakeholders
question, political-weaponization reframe, standing offer) preserved exactly.

**YES when:** plain-language researcher voice throughout; redirects quote
user-facing concerns, not the gate's name; fallbacks (sub-agent failure,
preferences file absent) are silent; verbatim phrasings are exact.

**NO when:** any banned term appears in user output; agent narrates internal
state ("invoking the brief-writer now"); verbatim phrasings are paraphrased.

**Pass example:** "Let me check your workspace for files matching skill-sharing
— sound good?"

**Fail example:** "Initiating Stream 1 workspace scan with research-brief-writer
sub-agent on deck for invocation after the confirmation pause."

---

## D4 — Methodology rubric application

**Definition:** Brief names a method explicitly. Method is tied to the research
question, decision intent (Pejman's 3 categories), audience, and constraints.
3-axis rubric direction is set by the main thread (`rubric-derived-with-confirm`);
6 tiebreakers applied by the drafter within that direction. Solo case skips
audience-evidence axis.

**YES when:** specific method named (not generic); rationale references ≥2 of
the rubric axes; AI-moderation-fit runs if method is interview-style; solo
case correctly skips audience-evidence axis.

**NO when:** method is generic; no rationale ties method to question; method
chosen before question refinement; solo case has audience-evidence applied
anyway.

**N/A when:** Exit A or Exit B fires and no method is drafted.

---

## D5 — Anti-pattern avoidance

**Definition:** Brief doesn't exhibit anti-patterns from `anti-patterns.md`:
method-first, validation framing, leading questions, synthetic-as-substitute,
no counterfactual, ranges with overlap, self-reported-future-behavior-as-
evidence, no real humans named in Who, stakeholders-as-role-categories,
generic-LLM-brief.

**YES when:** scan of the brief surfaces zero anti-patterns; input-borne
anti-patterns are caught and reframed; Stakeholders read relationally, not as
role categories.

**NO when:** any anti-pattern survives into the final brief; agent fails to
catch an anti-pattern in the input; Stakeholders read "PMs, Designers" instead
of "my team, Sarah from sales."

**N/A when:** Exit A or Exit B fires and no brief is drafted.

---

## D6 — Brief structure correctness

**Definition:** Brief uses the canonical 6-field structure from
`templates/default-brief.md`: **What / Why / How / Who / When and where / Next
steps**. All six fields populated with non-empty, non-trivial content.
Implementation handoff paragraph appended; Patterns-applied footer present.

**YES when:** all 6 fields present and named correctly; each has canonical
sub-content; handoff paragraph appended specific to chosen tool (see D11);
Patterns-applied footer present.

**NO when:** a field is missing; a field is a one-liner; handoff or footer
missing; fields reorganized.

**N/A when:** Exit A or Exit B fires and no brief is drafted.

---

## D7 — Stakeholders relational, not role-category

**Definition:** Stakeholders field captures specific people, teams, or
relationships ("my team," "my manager," "Sarah from sales") — not role-category
abstractions ("PMs," "Designers," "Engineers"). "Just me" accepted as valid.

**YES when:** Stakeholders read as relationships or specific names; solo
answers accepted as-is; research subjects and stakeholders named separately
when they diverge.

**NO when:** Stakeholders read as role categories; agent probes further on a
clean "just me"; stakeholders and subjects conflated.

**N/A when:** Exit A or Exit B fires and no brief is drafted.

---

## D8 — Sub-agent isolation surrogate (Operating Principles + ⚠️ callout)

**Definition:** Operating principles still bind drafter behavior — no inventing
beyond the contract, no Interview from the sub-agent, no exit firing from the
sub-agent. The `⚠️ Open items` callout fires at the TOP of the brief whenever
any foundational field's source is `inferred-not-confirmed` or `null`. Callout
lists each item with a confirm/correct ask.

**YES when:** if any field is inferred-not-confirmed or null, callout fires at
top of brief; each item listed with the inference and one-line ask; for Exit A
overrides, the user's acknowledgment is documented in the callout.

**NO when:** inferences are present but no callout fires; callout fires but is
below the brief content; callout fails to name the specific inferred field.

**N/A when:** all fields attested or user-confirmed-inference, AND no Exit A
override.

---

## D9 — Three-outcome exit discipline

**Definition:** Skill fires the correct exit (A / B / C) given inputs. Exit A
redirects carry honest alternatives. Exit B redirects include verbatim standing
offer AND concrete digging guidance. Political-weaponization reframe stays
verbatim. Pushback handled with explicit acknowledgment (Exit A) or
document-as-risk (Exit B). Sub-agent is NEVER invoked for Exit A or Exit B —
exits are main-thread-only.

**YES when:** correct exit fires; Exit A output names ≥1 alternative; Exit B
includes verbatim standing offer + concrete queries; political-weaponization
verbatim; pushback handled correctly; sub-agent not invoked for A/B.

**NO when:** wrong exit fires; Exit A is pure refusal; Exit B generic;
political-weaponization paraphrased; pushback accepted softly without
acknowledgment; sub-agent invoked for A/B.

**N/A when:** scenario doesn't test exit discipline.

---

## D10 — Phase fluidity (no narration of stage numbers)

**Definition:** Skill narrates pivots in plain language when post-research
information flips the working model. No phase numbers exposed in user-facing
text. Researcher-thinking-out-loud voice, not workflow-state-reporting.

**YES when:** pivots narrated in plain language ("Hold on — that changes the
picture..."); no phase numbers exposed; narration sounds like a researcher;
fluid boundaries honored (revisit foundational fields when research reveals a
gap).

**NO when:** pivot is silent (working model changes without narration); phase
numbers in user-facing text; narration is workflow-state-style.

**N/A when:** scenario involves no pivot.

---

## D11 — Tool-aware handoff

**Definition:** Implementation handoff paragraph matches the user's chosen
tool(s). Brief's Tools & logistics names the right tool(s) with rationale. No
tool fabrication. Multi-tool: 2-3 ranked options surfaced, user picks. Method-
tool mismatch surfaced explicitly.

**YES when:** handoff specific to chosen tool(s); Tools & logistics names the
choice with rationale; manual path used honestly when no tools; ranking
respects MCP-detected first → user-named second → manual third; mismatch
surfaced explicitly.

**NO when:** handoff generic when a tool was chosen; recommends a tool the user
doesn't have; silent substitution on method-tool mismatch; manual path
fabricated as "you could use Maze or similar."

**N/A when:** Exit A or Exit B fires and no brief is drafted.

---

## D12 — Three-tier confidence discipline (NEW for v0.6.0)

**Definition:** The skill correctly marks provenance for every foundational and
scope field: `user-attested` (user said it explicitly), `user-confirmed-
inference` (inferred + user explicitly confirmed when surfaced), `workspace-
with-user-confirm` / `rubric-derived-with-confirm` (inferred + pending user
confirm). MEDIUM/LOW-confidence fields are surfaced at the confirmation pause
and require explicit confirm-or-correct before contributing to the brief
contract. Acknowledgment-only is insufficient.

**YES when:** every contract field has the right provenance marker;
workspace/rubric-derived inferences are surfaced back before being used;
user confirmation promotes provenance to `user-confirmed-inference`; the skill
does NOT proceed to draft on a contract with `workspace-with-user-confirm` /
`rubric-derived-with-confirm` markers still pending; acknowledgment-only
("ok") is rejected as confirmation.

**NO when:** a field is silently committed at MEDIUM/LOW confidence; the skill
proceeds to draft with pending-confirm provenance still unresolved;
acknowledgment-only is treated as confirmation.

**Pass example (S03):** workspace finding surfaces back: "The retro says
rough onboarding; you're saying the new flow's been redesigned — which to
weight?" User resolution promotes provenance; conflict NOT silently averaged.

**Fail example (S03):** workspace finding silently committed as Subjects'
prior knowledge; conflict averaged into "the pilot had mixed results"; brief
drafts on the silent average.

---

## D13 — Confirmation pause discipline (NEW for v0.6.0)

**Definition:** Before the brief-writer is invoked (plugin) or main-thread
drafting starts (skill), the skill surfaces the gathered state with provenance
markers and pauses for explicit user confirm-or-correct. The user MUST engage
with the surfaced fields. Acknowledgment-only ("ok," "sounds good") is
insufficient. The skill does NOT slip into drafting on inferred fields without
the pause. Pause is structural — it fires whether the Interview was sparse or
dense.

**YES when:** confirmation pause fires before any brief drafting; gathered
state surfaced with provenance markers; user explicit confirm or correct
required; acknowledgment-only is rejected; brief-writer invoked only after
explicit confirmation; if the user corrects a field, working model updates and
re-pauses briefly with corrected picture.

**NO when:** brief drafted without a pause; pause is a post-hoc callout (the
v0.5.x model — too late); acknowledgment-only treated as confirmation;
brief-writer invoked while fields still hold `workspace-with-user-confirm` or
`rubric-derived-with-confirm` provenance.

**Pass example (S01):** after 3-5 Interview turns, agent surfaces: "Here's
what I have: Why: X *(you said)*; Decision: Y *(inferred from your prior
knowledge, confirm?)*; Stakeholders: Z *(you said)*… Confirm or correct before
I draft."

**Fail example (S01):** drafts a brief in one round with no pause — the v0.5.1
over-inference regression.

---

## D14 — Surface detection (plugin vs. skill) (NEW for v0.6.0)

**Definition:** The skill correctly detects which surface it's running on and
uses the right mechanism. **Plugin surface:** reads `~/.claude.json` for
`mcpServers` top-level keys ONLY (values discarded); invokes
`research-brief-writer` sub-agent via the Agent tool at the confirmation pause
with the state contract; runs the post-draft validation diff. **Skill
surface:** introspects own tool roster (no `~/.claude.json` read); drafts brief
inline in the main thread using the same state contract logic; runs the same
validation diff. **Sub-agent failure handling:** plugin retries once; on
second failure, falls back to inline drafting without exposing failure.

**YES when:** plugin surface uses sub-agent invocation; skill surface uses
inline drafting; sub-agent failure triggers retry and graceful fallback;
`~/.claude.json` is read securely (keys only, values discarded); validation
diff runs before the brief reaches the user; mechanism choice is silent (no
"I'll use the sub-agent because…" narration).

**NO when:** plugin surface drafts inline (loses sub-agent isolation); skill
surface attempts sub-agent invocation (which would fail); sub-agent failure
exposed to user; `~/.claude.json` values leak; validation diff skipped.

**Pass example (S04):** silently invokes `research-brief-writer` via Agent
tool; brief returns; relayed to user as-is.

**Fail example (S06):** sub-agent fails; agent surfaces "I had trouble
invoking the brief-writer, let me try again" — exposing plumbing.

---

## D15 — Preferences file lifecycle (NEW for v0.6.0)

**Definition:** `.claude/research-planning.local.md` lifecycle handled
correctly. **Read:** silent every invocation near the start of tool discovery
(plugin surface only); absent file is silent no-op; surfaced preferences
become tooling defaults during the tooling step. **Write:** ONE explicit
opt-in offer per session, at the confirmation pause, with verbatim prose ("Want
me to remember these as defaults for next time? I'll save the tool choices to
`.claude/research-planning.local.md` — you can edit or delete that file
anytime."). User says yes → `Write` is used; existing free-text notes
preserved. User says no or nothing → no write. **Skill surface:** entire
mechanism is silent no-op (no filesystem at this path).

**YES when:** plugin read silent when file present; absent file is silent;
opt-in offered at confirmation pause with verbatim prose; write happens only
on explicit yes; existing free-text notes preserved on write; no re-asking the
opt-in question; skill surface skips the mechanism entirely.

**NO when:** read narrated to the user ("I see you have a preferences
file…"); silent write without opt-in; opt-in re-asked after a no; existing
free-text notes overwritten; write attempted on skill surface; auto-capture of
methodology preferences (beyond confirmed tool choices).

**Pass example (S08):** at confirmation pause, agent offers opt-in. User
yes → `Write` creates the file with `preferred_tools` populated.

**Fail example (S09):** user says no → agent writes the file anyway.

---

## Scoring per scenario

```
Scenario S0X
| Dim                                            | Score        | Note |
|------------------------------------------------|--------------|------|
| D1  — pre-flight gate enforcement              | YES/NO/PART  | …    |
| D2  — foundational fields discipline           | YES/NO/PART  | …    |
| D3  — plain-language voice                     | YES/NO/PART  | …    |
| D4  — methodology rubric application           | YES/NO/PART/NA | …  |
| D5  — anti-pattern avoidance                   | YES/NO/PART/NA | …  |
| D6  — brief structure correctness              | YES/NO/PART/NA | …  |
| D7  — stakeholders relational                  | YES/NO/PART/NA | …  |
| D8  — sub-agent isolation surrogate + ⚠️       | YES/NO/PART/NA | …  |
| D9  — three-outcome exit discipline            | YES/NO/PART/NA | …  |
| D10 — phase fluidity                           | YES/NO/PART/NA | …  |
| D11 — tool-aware handoff                       | YES/NO/PART/NA | …  |
| D12 — three-tier confidence (NEW)              | YES/NO/PART  | …    |
| D13 — confirmation pause discipline (NEW)      | YES/NO/PART  | …    |
| D14 — surface detection (NEW)                  | YES/NO/PART  | …    |
| D15 — preferences file lifecycle (NEW)         | YES/NO/PART/NA | …  |
| Total                                          | X / 15       |      |
```

## Aggregate

For a run of N scenarios across 15 dimensions:

```
Total possible          : 15 × N (minus N/A)
Total YES               : sum of YES across all cells
Total PARTIAL           : sum of PARTIAL across all cells (count as 0)
Total NO                : sum of NO across all cells
Pass rate (strict)      : YES / applicable
Per-dim pass rate       : (scenarios where Dx = YES) / (scenarios where Dx applies)
```

A regression is any dimension whose YES rate drops between runs against the
same SKILL.md + sub-agent commit. **90% is the v0.6.0 release gate** —
anything below indicates the SKILL.md or sub-agent prose needs revision before
ship.

**Critical-pass requirement.** S01 (the grounding-research case from session
`b0bc14c7-852c-4f43-9743-9a18c5c00e80`) MUST score YES on D2, D12, AND D13.
These three are the explicit regression tests for the over-inference failure
that motivated v0.6.0. PARTIAL or NO on any of S01-D2 / S01-D12 / S01-D13
flags as a v0.6.1 blocker — the architecture exists specifically to prevent
that scenario from failing.
