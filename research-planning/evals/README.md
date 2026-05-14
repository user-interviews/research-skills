# Research Planner Eval Harness

A re-runnable evaluation harness for the `research-planner` sub-agent
(`research-planning/agents/research-planner.md`). Run it whenever the sub-agent
prompt or any of its referenced files change. The goal is to catch regressions
in foundational behaviors — pre-flight gating, foundational-field asking,
methodology rationale, anti-pattern resistance, no-plumbing-leak — before they
ship.

## Contents

| File | Purpose |
|------|---------|
| [`scenarios.md`](./scenarios.md) | 25 scenarios covering project types, pre-flight failure modes, methodologies, AI involvement, audiences, constraints, multi-pattern blends |
| [`rubric.md`](./rubric.md) | 8 binary scoring dimensions; 0–8 per scenario |
| [`runner-template.md`](./runner-template.md) | Copy-paste prompt for a harness runner sub-agent |
| [`runs/YYYY-MM-DD-name.md`](./runs/) | Dated run reports (one per execution) |

## What the harness is for

- Catching regressions when the sub-agent prompt or referenced files change.
- Stress-testing override resistance: does the sub-agent still ask foundational
  questions one at a time even when a parent context says "don't stop for
  clarification"?
- Verifying that fixes (e.g., the no-plumbing-leak Fix-C, the inferences-at-top
  Fix-B) hold under varied input shapes.
- Surfacing prompt weaknesses systematically rather than incidentally.

## How to run

There are three ways to execute the harness, in order of fidelity:

### 1. Static analysis (fastest; what the baseline run does)

Read the sub-agent prompt + the referenced files (pre-flight gate, methodology
selection, anti-patterns, AI-moderation-fit, patterns, templates). For each
scenario in `scenarios.md`, walk through the 11-step workflow as the prompt
specifies, and reason about what the sub-agent **would** produce. Score against
[`rubric.md`](./rubric.md). Write the run report to `runs/`.

This is brittle (you're simulating the LLM) but catches structural prompt
problems that a live run would mask with general LLM competence.

### 2. Live invocation (per-scenario)

For each scenario, open a fresh Claude Code session, invoke the plugin
(`/plan-research` or natural-language trigger), paste the scenario input
verbatim, and capture the full transcript including any clarifying-question
turns. Score the transcript against `rubric.md`.

This is high-fidelity but slow (~10–15 min per scenario × 25 = ~5 hours).
Use for major prompt revisions or pre-release verification.

### 3. Runner-template dispatch (semi-automated)

Use [`runner-template.md`](./runner-template.md) to dispatch a harness-runner
sub-agent that walks the scenarios programmatically. The runner can do either
static analysis or simulated invocation across a configurable subset of
scenarios. It writes the run report.

This is the recommended mode for routine regression checks.

## What a run produces

Each run produces one dated report in `runs/YYYY-MM-DD-name.md` with:

- **Header**: run date, sub-agent commit SHA, run type (static / live /
  runner-dispatched), scenario subset, scorer identity.
- **Per-scenario score table**: 8 rows (one per rubric dimension), 0/1/N/A.
- **Aggregate**: total achieved / total possible; per-dimension pass rate;
  common failure modes.
- **Recommended fixes**: prompt edits, reference-file edits, or scenario
  revisions that would address the failures.
- **Linear issues to file**: if a systemic regression appears, list the
  proposed issue titles for triage.

## Interpreting results

- **Per-scenario score**: 8/8 = clean pass. 5–7/8 = minor issues, document them.
  ≤4/8 = systemic failure on that scenario.
- **Per-dimension pass rate**: shows which behaviors are weak across the suite.
  If D2 (Why/What/Who asked) drops below 90%, the override-resistance language
  in Operating Principle #1 needs strengthening.
- **Common failure modes**: cluster failures by dimension AND by scenario
  family. If all pre-flight failure scenarios (S03, S15, S17, S18, S19, S20)
  drop on D1, the gate logic needs revision. If all PMF/discovery scenarios
  drop on D5, pattern recognition needs work.
- **Regression vs. design intent**: not every failure is a regression. Some
  scenarios may legitimately become harder when the workflow gets more careful
  (e.g., a brief that previously passed D6 because it skipped Step 2 now fails
  D2 because it tries to draft without asking). Trace each failure back to
  the prompt change that caused it.

## Versioning

Tie each run to the sub-agent prompt's commit SHA at the time of execution.
Record this in the run header. When prompts change:

1. Note the SHA being tested.
2. Read the diff against the previous tested SHA.
3. Predict which dimensions are affected.
4. Run the harness.
5. Compare actual vs. predicted impact.

If a fix targeted D2 (Why/What/Who asked) and D2 didn't improve, the fix
probably didn't land — or the rubric needs sharpening.

## Adding a new scenario

When the sub-agent gains a new responsibility or a new bug class is discovered:

1. Add a scenario to `scenarios.md` following the existing format:
   ```
   ### SXX — Short descriptive title

   **Input:** "..."

   **Dimensions tested:** tag1, tag2, tag3

   **Expected behavior:**
   - Bullet 1
   - Bullet 2

   **Pass criteria:** ...
   ```

2. Tag the dimensions so coverage maps update.

3. Add a row to the "Per-scenario dimension map" at the bottom of
   `scenarios.md`.

4. Commit message convention:
   ```
   research-planning evals: add SXX — [topic]

   Covers: [dimension tags]
   Motivated by: [bug, customer feedback, prompt change, etc.]
   ```

5. On the next run, the new scenario gets scored and rolled into the aggregate.

## Failure → fix loop

When a scenario fails:

1. **Localize**: which rubric dimension(s) failed? Which step of the workflow
   produced the failure?
2. **Reproduce**: can you reproduce with a live invocation? (Static analysis
   sometimes flags issues that don't manifest live, and vice versa.)
3. **Fix**: edit the sub-agent prompt or the relevant reference file. Prefer
   prompt edits to reference-file edits for foundational behaviors — the
   prompt is always loaded; references are loaded on-demand.
4. **Re-run**: re-run the failing scenario(s) only. If they pass, run the full
   suite to check for regressions elsewhere.
5. **Record**: note the fix in the run report and link the commit.

## Conventions

- Run report filenames: `YYYY-MM-DD-short-name.md` (e.g.,
  `2026-05-14-baseline.md`, `2026-06-01-post-rubric-revision.md`).
- All times in EST/EDT (run author's local time unless flagged).
- N/A in the rubric counts as automatic pass; never as a zero.
- Don't game the rubric — if a scenario passes the letter but fails the
  spirit, score it 0 and document the gap.

## Related

- Sub-agent prompt: `research-planning/agents/research-planner.md`
- Live eval scenarios (older, in repo): `research-planning/evals/scenarios.md`
- Plugin root: `${CLAUDE_PLUGIN_ROOT}` = the installed plugin directory
