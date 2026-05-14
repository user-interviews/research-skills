# Research Planner Sub-Agent — Scoring Rubric

Each scenario in [`scenarios.md`](./scenarios.md) is scored against the 8 binary
dimensions below. Total per scenario: **0–8**. Aggregate score across N scenarios:
**0 – (8 × N)**.

A dimension is **1 (pass)** only if the sub-agent's output (or its written behavior
in a static simulation) fully satisfies the dimension. If the dimension is partially
satisfied, score **0** and note why in the run report. This is intentionally strict
— partial credit makes regressions invisible.

Some dimensions are **N/A** for some scenarios (e.g., "Question refinement applied"
is N/A when the input question is already well-formed and refusal is the right move).
N/A counts as automatic pass for aggregate purposes, but flag it explicitly in the
run report.

---

## D1 — Pre-flight gate honored

**Definition:** The sub-agent correctly refused-or-redirected when the input fails a
pre-flight check, and proceeded when it passes. The gate is neither over-applied
(refusing well-formed asks) nor under-applied (drafting briefs on inputs that should
have been refused).

**Score 1 when:**
- The gate's verdict matches the scenario's "Dimensions tested" pre-flight tag.
- If the gate fails, the redirect quotes the specific concern in user-facing language.
- If the gate passes, the sub-agent moves into Steps 2–8 cleanly.

**Score 0 when:**
- A "fail" scenario gets a brief drafted anyway.
- A "pass" scenario gets spuriously refused.
- The gate's reasoning is generic rather than tied to the specific failure mode.

**Pass example (S03):** "Sounds like the decision to ship dark mode is already made
— a research project that tests it now would be testing whether the team made the
right call, not whether to ship. Two alternatives that might be more useful: (1)
post-launch measurement of adoption + complaints, (2) scoping a study around
implementation problems (which dark-mode surfaces are confusing) rather than the
ship decision itself."

**Fail example (S03):** Drafts a brief titled "Validating Dark Mode" with research
questions like "Do users prefer dark mode?"

---

## D2 — Why / What / Who asked, not inferred (Fix-B verification)

**Definition:** The sub-agent asks the user for Why, What (decision), and Who
(audience) one at a time before drafting. It does not silently infer foundational
fields, even under a "work without stopping" parent directive.

**Score 1 when:**
- All three foundational fields (Why, What, Who) are either explicitly provided in
  the input OR explicitly asked for by the sub-agent before drafting.
- Questions come one at a time (not as a batch).
- If the sub-agent inferred any field as a last resort (rare), it placed an
  "⚠️ Open items to confirm before reviewing this brief" callout at the **top** of
  the brief.

**Score 0 when:**
- The sub-agent drafts a brief with inferred Why / What / Who silently filled in.
- Inferences are present but the callout is buried at the bottom or absent.
- Questions are batched (3 at once) rather than serial.

**Pass example (S08):** First turn: "Before I draft anything — what's the business
goal behind this? You mentioned ops teams feeling pain; what would change at your
company if you confirmed (or disconfirmed) that pain?" (Waits for answer.)

**Fail example (S08):** Drafts a brief assuming Why = "find PMF," What = "decide
whether to keep building," Who = "ops leaders" without asking.

---

## D3 — Question refinement applied

**Definition:** Vague, yes/no, or method-first questions get rewritten and confirmed
before drafting. Question passes specific/actionable/practical and SMART-for-research.

**Score 1 when:**
- A vague input triggers 2–3 candidate rewrites surfaced for user confirmation.
- A yes/no question gets reformulated into an open-ended frame.
- A well-formed question is acknowledged as such and moved through without
  spurious rewriting.

**Score 0 when:**
- A vague input is drafted against without refinement.
- A yes/no question becomes "Do users like X?" verbatim in the brief.
- A well-formed question gets rewritten unnecessarily (over-application).

**N/A when:** Input is a pre-flight failure that gets refused before Step 3
(e.g., S03, S15, S17, S20).

**Pass example (S16):** "Will users like our new color scheme?" → "That's a yes/no
question, which is hard to act on. A few open-ended rewrites that would be more
useful: (1) 'What associations do users form with the new palette in 5 seconds?'
(2) 'How do users describe their first impression?' (3) 'Where does the new scheme
help or hurt readability in real flows?' Which one matches the decision you're
trying to make?"

---

## D4 — Methodology selected with rationale

**Definition:** The brief names a method explicitly. The method is tied to the
research question, the decision intent (Pejman's 3 categories), the audience (Who),
and the constraints. Multi-axis rubric from `methodology-selection.md` is applied.

**Score 1 when:**
- A specific method is named (not "interviews" generically — "generative discovery
  interviews, 1:1, 60-min" specific).
- Rationale references at least 2 of: decision type, product-cycle stage, generative-
  vs-evaluative, budget/timeline, evidence-Who-finds-compelling.
- If method is interview-style, AI-moderation-fit check is run.

**Score 0 when:**
- Method is generic ("user research").
- No rationale ties the method to the question.
- Method is picked before question refinement (method-first anti-pattern).

**N/A when:** Pre-flight refusal scenarios where no method is drafted.

---

## D5 — Pattern recognition correct

**Definition:** The patterns applied match the scenario's dimensions. The "Patterns
applied" footer in the brief names the correct method + context pattern files.

**Score 1 when:**
- The pattern files named match the scenario's dimensions (e.g., S06 should name
  `survey.md` + `rapid-cadence.md`).
- Multi-pattern scenarios compose correctly (both patterns named, not one).
- Pattern application visibly shapes brief content (rapid scenarios have per-day
  timelines, etc.).

**Score 0 when:**
- The wrong pattern fires (e.g., `usability-testing.md` for a discovery question).
- A multi-pattern scenario only names one pattern.
- The footer is missing or generic.

**N/A when:** Pre-flight refusal scenarios.

---

## D6 — 6-field brief structure complete

**Definition:** The brief uses the canonical 6-field structure from
`templates/default-brief.md`: **What / Why / How / Who / When and where / Next steps**.
All six fields are populated with non-empty, non-trivial content.

**Score 1 when:**
- All 6 fields are present and named correctly.
- Each field has at least the canonical sub-content (e.g., What has research questions
  + decision + assumptions; Who has criteria + sourcing + sample size).
- Handoff appendix ("Ready to launch this study?") is appended.

**Score 0 when:**
- A field is missing.
- A field is a one-liner with no real content.
- Handoff appendix is missing.
- Fields are reorganized (e.g., "Approach / Audience / Logistics" instead of canonical).

**N/A when:** Pre-flight refusal scenarios.

---

## D7 — Anti-patterns caught

**Definition:** The brief doesn't exhibit any of the anti-patterns from
`anti-patterns.md`: method-first, validation framing, leading questions, synthetic-as-
substitute, no counterfactual, ranges with overlap, self-reported-future-behavior-as-
evidence, no real humans named, generic-LLM-brief, etc.

**Score 1 when:**
- Scan of the brief surfaces zero anti-patterns.
- For scenarios where the input contains an anti-pattern (S07, S19), the sub-agent
  catches it and reframes rather than carrying it through.

**Score 0 when:**
- Any anti-pattern survives into the final brief.
- The sub-agent fails to catch an anti-pattern present in the input.

**N/A when:** Pre-flight refusal scenarios where no brief is drafted.

---

## D8 — No plumbing leakage (Fix-C verification)

**Definition:** The sub-agent's user-facing output does not mention internal
implementation language: "directive," "playbook," "system reminder," "no-stop
directive," "references," "the workflow," "the gate," "pre-flight check," "session
directive," "reference file," etc. The sub-agent speaks like a focused researcher,
not an LLM with self-aware plumbing.

**Score 1 when:**
- Output reads as plain-language researcher voice.
- Refusals quote the user-facing concern, not the gate's name.
- Fallbacks (e.g., a reference file failing to load) are silent — no "I'll proceed
  without the reference file" announcements.

**Score 0 when:**
- Any of the banned terms appears in user-facing output.
- The sub-agent narrates its own workflow ("Now I'll move to Step 4...").
- Fallback announcements ("I couldn't load X, so I'll use Y") surface.

**Pass example:** "Before drafting, I want to understand the decision this would
unblock — what would change at your company if you learned ops leaders don't feel
the pain you're describing?"

**Fail example:** "Per my pre-flight gate, I need to first establish the decision
this research will unblock. Let me move through Step 2 of the workflow..."

---

## Scoring per scenario

```
Scenario S0X
| Dim | Score | Note |
|-----|-------|------|
| D1 — pre-flight gate honored          | 0 or 1 | …    |
| D2 — Why/What/Who asked, not inferred | 0 or 1 | …    |
| D3 — question refinement applied      | 0 / 1 / N/A | … |
| D4 — methodology selected w/ rationale| 0 / 1 / N/A | … |
| D5 — pattern recognition correct      | 0 / 1 / N/A | … |
| D6 — 6-field brief complete           | 0 / 1 / N/A | … |
| D7 — anti-patterns caught             | 0 / 1 / N/A | … |
| D8 — no plumbing leakage              | 0 or 1 | …    |
| Total                                 | X / 8  |      |
```

## Aggregate

For a run of N scenarios:

```
Total possible        : 8 × N (minus N/A)
Total achieved        : sum of all scenario totals
Pass rate             : achieved / possible
Per-dimension pass rate: (scenarios where Dx = 1) / (scenarios where Dx applies)
```

A regression is any dimension whose pass rate drops between runs against the same
sub-agent prompt SHA (or whose drop correlates with a known prompt edit).
