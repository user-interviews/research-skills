# Research Planner Sub-Agent — Internal Eval Scenarios

## Purpose

A re-runnable eval suite for catching regressions in the `research-planner` sub-agent
(`research-planning/agents/research-planner.md`). Each scenario probes a specific axis of
the 11-step workflow: pre-flight gating, question refinement, methodology selection,
pattern recognition, AI-moderation fit, and anti-pattern resistance.

These scenarios are inputs the sub-agent should handle correctly. Failures here mean
the sub-agent prompt — or the references it loads — need revision.

## How to re-run

1. Read the sub-agent's system prompt at `research-planning/agents/research-planner.md`.
2. Load the referenced files (pre-flight gate, methodology selection, ai-moderation-fit,
   anti-patterns) so you have the full decision logic in context.
3. For each scenario below, simulate the sub-agent's response by walking the 11-step
   workflow as the prompt specifies. Do NOT short-circuit; the eval is testing whether
   the *written* workflow produces the *expected* behavior.
4. Score each scenario PASS or FAIL against the pass criteria. Be honest — if the
   workflow as written would not produce the expected behavior, that is a FAIL and
   indicates a prompt fix is needed.
5. Update the pass rate at the bottom of this doc and note any drift since last run.

## Scenarios

### Scenario 1 — Well-formed usability-test question

**Input:** "Do users find the checkout flow confusing on our new prototype?"

**Expected behavior:**
- Pre-flight passes (clear decision, real users implied, no AI substitution)
- Why/What/Who: business goal = ship a usable checkout; What = decision to ship/iterate; Who = users of the product
- Question refinement: passes specific/actionable/practical
- Methodology: usability test selected (per methodology-selection rubric)
- Pattern recognition: `usability-testing.md` triggers
- Brief drafted with default 6-field + usability-testing additions (N=5, task scenarios)
- Handoff appendix included

**Pass criteria:** sub-agent produces a brief; method = usability test; pattern recognition correctly fires usability-testing

### Scenario 2 — Malformed/vague question

**Input:** "Let's just talk to some users about our product"

**Expected behavior:**
- Pre-flight likely fails initial check (no clear decision, "talk to users" is method-first without question)
- Sub-agent asks: what decision will this enable? What are you trying to learn?
- Surfaces 2–3 candidate rewrites that pass specific/actionable/practical
- Does not draft a brief on the malformed input

**Pass criteria:** sub-agent does NOT just draft a brief; asks clarifying questions or surfaces rewrite candidates

### Scenario 3 — Pre-flight gate failure (decision already made)

**Input:** "Should we add dark mode? The CEO already decided yes, but I want to validate the decision with research."

**Expected behavior:**
- Pre-flight fails on "Has the decision already been made?" and on "research-as-weapon / validation framing" anti-pattern
- Sub-agent refuses to draft a brief
- Surfaces the specific gate that failed (quoting verbatim where possible)
- Recommends alternative: do nothing / measure post-launch instead / scope to discovering implementation problems rather than validating the decision

**Pass criteria:** sub-agent does NOT produce a brief drafting research to validate the CEO's decision; refuses and redirects

### Scenario 4 — AI-moderation toward AI

**Input:** "We want to test 5 ad variants with our existing customer panel, 200+ participants across 4 languages"

**Expected behavior:**
- Pre-flight passes
- Methodology selection picks ad/messaging testing (concept test variant)
- AI-moderation-fit check triggers because: standardized guide ✓, predefined probing ✓, no behavioral observation ✓, scale (200+) + reach (4 languages) + structured method all favor AI
- Recommends AI moderation
- Brief includes probe instructions, pre-interview prep, variable-length flag, mandatory pressure-test step

**Pass criteria:** sub-agent recommends AI moderation, cites the rubric, includes pressure-test step

### Scenario 5 — AI-moderation toward human

**Input:** "We need to understand how rare-disease patients navigate complex insurance decisions for treatments they can't easily access"

**Expected behavior:**
- Pre-flight passes
- Methodology selection picks discovery interviews
- AI-moderation-fit check triggers because method is interview-style
- Rubric: problem space NOT well-mapped (unknown-unknowns), behavioral observation likely needed, deep jargon (medical + insurance), high-stakes judgment, sensitivity (medical/financial), niche population (rare disease)
- Recommends HUMAN moderation
- Surfaces why: at least 3 of the 5 rubric checks favor human

**Pass criteria:** sub-agent recommends human moderation and cites specific rubric reasons

### Scenario 6 — Blended rapid + survey

**Input:** "We need a quick read on whether our pricing page is confusing — within 2 weeks"

**Expected behavior:**
- Pre-flight passes
- Methodology selection: survey (broad, fast signal); could also be a quick unmoderated usability test
- Pattern recognition fires BOTH `survey.md` (or `usability-testing.md` if unmoderated test chosen) AND `rapid-cadence.md`
- Brief shows per-day timeline (rapid-cadence pattern) + survey method specifics
- Methods bounded to tactical

**Pass criteria:** sub-agent applies rapid-cadence + survey (or unmoderated usability); brief shows 15-day timeline structure

### Scenario 7 — AI-misuse reframing

**Input:** "Let's just use synthetic users to validate our new product concept before we recruit real participants"

**Expected behavior:**
- Pre-flight catches "AI as substitute" check
- Sub-agent does NOT refuse outright; reframes per reframing scripts in ai-research-context.md
- Surfaces the convergent professional view: synthetic users are useful for guide pressure-testing and hypothesis generation, NOT for concept validation
- Offers: "use synthetic users to pressure-test the discussion guide, then recruit real participants for the actual concept test"
- Brief, if drafted, has explicit Role-of-AI = "pressure-test" not "substitute"

**Pass criteria:** sub-agent reframes (doesn't comply with "validate via synthetic users"), offers split: synthetic for guide, real for findings

## Current pass rate

**Run date:** 2026-05-14
**Pass rate:** 6 / 7

### Per-scenario results

| # | Scenario | Result | Notes |
|---|---|---|---|
| 1 | Well-formed usability-test question | PASS | Workflow cleanly produces a usability-test brief; pattern recognition fires `usability-testing.md`; sample-size guidance defaults to n=5. |
| 2 | Malformed/vague question | PASS | Pre-flight gate (`don't know how you'll use the learnings`, `question not right-sized`) plus Step 3 question-refinement combine to stop drafting and surface 2–3 rewrites. |
| 3 | Decision-already-made | PASS | Pre-flight gate explicitly enumerates "decision already made" + "research-as-weapon"; sub-agent refuses, quotes verbatim, redirects to evaluative implementation testing or post-launch measurement. |
| 4 | AI-moderation toward AI | PASS | Methodology selection routes to ad/messaging testing; the trigger rule in `methodology-selection.md` forces the ai-moderation-fit check; all 5 steps favor AI; brief deltas include probe instructions and pressure-test. |
| 5 | AI-moderation toward human | PASS | Rubric Steps 1–3 each independently favor human (unknown-unknowns, variable probing, jargon + high-stakes judgment); sub-agent recommends human moderation and cites the rubric. |
| 6 | Blended rapid + survey | FAIL | Step 6 of the workflow names `rapid-cadence.md` as a context pattern when timeline < 2 weeks, and `survey.md` as a method pattern. The workflow lists both, so multi-pattern composition is supported in principle. However, the sub-agent prompt does NOT name a concrete "15-day timeline structure" or per-day cadence convention — that lives only inside `rapid-cadence.md`, which the eval can't verify exists or specifies a 15-day shape without loading it. Without that pattern file present, the sub-agent would produce a 2-week timeline but might not produce the per-day structure the pass criteria require. Flagged as FAIL pending verification that `rapid-cadence.md` exists and specifies per-day timeline output. |
| 7 | AI-misuse reframing | PASS | Pre-flight gate's "AI-substitute framing" entry has explicit reframing language: "AI is fine as input (drafting the guide, surfacing assumptions) or pressure-test (simulating pilots), but you still need real humans to learn from." Sub-agent reframes and offers the split. Anti-patterns reinforce ("synthetic users as primary evidence"). |

### Failure notes & recommended fixes

**Scenario 6 (FAIL):**
- The sub-agent prompt mentions `rapid-cadence.md` by filename but does not assert what it contains. The eval requires "per-day timeline (rapid-cadence pattern)" — this only passes if the pattern file actually specifies a per-day cadence shape.
- **Recommended fix:** verify `research-planning/references/patterns/contexts/rapid-cadence.md` exists and includes a per-day timeline scaffold (e.g., "Day 1–2: scope, Day 3–5: recruit, Day 6–10: field, Day 11–13: synthesize, Day 14–15: read out"). If it does not, add the scaffold to that pattern file. Alternatively, soften the eval's pass criteria from "15-day timeline structure" to "tactical-only method + 2-week-bounded timeline".
- **Sub-agent prompt itself:** consider adding to Step 6 a concrete example of multi-pattern composition (e.g., "rapid-cadence + survey → use the rapid-cadence per-day timeline as the When-and-where structure; layer the survey method specifics inside"). This would make the composition behavior testable from the prompt alone.

## Notes for future runs

- The eval is deliberately simulation-based: it walks the *written* prompt and checks
  whether the prompt's instructions would produce the expected output. This is more
  brittle than running the sub-agent live, but it catches prompt regressions that a
  live run might paper over with general LLM competence.
- When the pass rate drops, prioritize fixes that strengthen the sub-agent prompt
  itself (Step 1–11) over fixes that add more references. The references are loaded
  on-demand; the prompt is always the spine.
- Add new scenarios as the sub-agent gains responsibilities. Keep the existing 7 as
  the regression baseline.
