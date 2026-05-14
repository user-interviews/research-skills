# Sample Sizes — UI's canonical table by method

## Purpose

Reference the canonical sample-size cheat sheet from User Interviews' Field Guide. Use this when the brief needs a participant count and you want a defensible default rather than an arbitrary number.

## When to apply

- The participants section of the brief asks "how many?"
- A stakeholder pushes back on the proposed sample size and you need published justification.
- A user is treating sample size as a budget input rather than a methodology decision.
- A study is moderated and you need to recommend an over-recruiting buffer for no-shows.

## The Table

UI's Field Guide publishes the following baseline sample sizes by method. Use these as defaults; deviate only with explicit reasoning written into the brief.

| Method | Sample size |
|---|---|
| Interviews | 3–10 |
| A/B tests | 5–8 |
| Focus groups | 5–10 per group |
| Diary studies | 10–15 |
| Card sorting | ≥15 per group |
| Quantitative studies | ≥20 |
| Surveys | ≥100 |

### How to read the table

- **Ranges (3–10, 5–8, 5–10, 10–15)** give a small/medium/large band. Pick toward the low end for tightly-scoped questions and homogeneous audiences; pick toward the high end when you expect variance across segments.
- **Floors (≥15, ≥20, ≥100)** are minimums for the method to do what it's designed to do. Below the floor, you're running the method but you can't trust the output.
- **"Per group"** for focus groups and card sorting means each segment or condition gets the listed N — not the total study.

## The 11% no-show buffer

For moderated studies, over-recruit by 11% to account for no-shows. This is the Nielsen Norman Group cited figure, surfaced in UI's Field Guide.

### How to apply it

- Take the target completed-session count.
- Multiply by 1.11.
- Round up.
- Recruit and schedule that many.

Example: target 10 completed interviews → recruit 11.1 → recruit 12. Schedule 12. Expect 10–11 to show.

### When the buffer is not enough

- **Hard-to-reach populations** (specialists, executives, niche segments): use a 20–25% buffer or recruit in waves.
- **Same-day or next-day sessions:** higher no-show risk; 15–20% buffer.
- **Unincentivized or low-incentive studies:** higher no-show; consider the buffer or raising the incentive.
- **Unmoderated studies:** no-shows look different — incomplete sessions, not missed appointments. Plan for a 20–30% completion-rate drop instead of an attendance buffer.

## Goldilocks vs. numbers game

Two distinct mental models drive sample size. Recognize which one applies and the right N falls out.

### Goldilocks — small sample, deep

Used when:
- You're after rich, qualitative understanding of why or how.
- The method is generative (interviews, diary studies, ethnography, qualitative usability).
- You want patterns to emerge, not statistics to confirm.
- 5–8 participants per segment is the sweet spot for most qualitative work.

Goldilocks-mode sample sizes:
- Interviews: 5–8 (toward low end of UI's 3–10 range)
- Diary studies: 10–15
- Qualitative usability: 5–8 per segment (NN/g's classic "5 users find 85% of problems" finding lives here)

Risk of going too small in Goldilocks mode: missing variance across user types. Risk of going too big: diminishing returns, budget blown.

### Numbers game — large sample, generalize

Used when:
- You need a statistic you can put in front of stakeholders ("72% of users…").
- The method is evaluative or quantitative (A/B tests, surveys, analytics, tree testing, preference tests).
- You're choosing between alternatives or measuring a baseline.
- The output gets aggregated and reported as a rate, ratio, or distribution.

Numbers-game sample sizes:
- Surveys: ≥100 (floor; for sub-group analysis, 100 per group)
- Quantitative usability or behavior studies: ≥20 (floor; more for confidence)
- Card sorting (analyzed quantitatively): ≥15 per group

Risk of going too small in numbers-game mode: your statistic is noise. Risk of going too big: cost balloons and you've passed the point of diminishing precision.

### Choose your mode before you choose your N

If a brief says "we want to interview 50 customers and run statistical analysis," the user has mixed modes. Interviews are Goldilocks-shaped; 50 of them is wasteful. If they want statistics, use a survey. If they want depth, use 5–10 interviews. The skill should catch the mode mismatch.

## Pitfalls

### Over-recruiting demographics

Symptom: brief lists 8 demographic constraints (age, geography, role, company size, industry, tenure, household income, device). The recruit becomes impossible or the timeline triples.

Cause: confusing demographics (who they are) with behaviors (what they do). Most research questions are answered by behavior-based recruiting. Demographics are screening signals, not the criteria themselves.

Fix: collapse demographics to the 1–2 that actually predict the behavior under study. Push the rest into the discussion guide as questions instead of screener constraints.

### Under-recruiting for the variance you need

Symptom: brief recruits 5 interviews for a study spanning 3 product personas and 2 maturity stages.

Cause: treating sample size as a single number instead of N-per-segment.

Fix: identify segments first, then apply the per-segment sample size. If the study truly needs 3 personas × 2 maturity stages × 5 each, that's 30, not 5. Either find the budget or narrow the segments.

### Treating sample size as a budget number

Symptom: brief says "we have $5K for incentives at $100 each, so 50 participants."

Cause: methodology decisions made by accounting.

Fix: name the method first based on the question, derive the sample size from the method, then check whether the budget covers it. If not, the conversation is about scope cuts or budget asks — not silently shrinking the sample below the floor.

### Below-floor sample sizes

Symptom: brief proposes a survey with N=40, or quantitative usability with N=8.

Cause: stretching qual sample sizes onto quant methods.

Fix: refuse to call the study quantitative. Either raise N to the floor (≥100 surveys, ≥20 quant) or reframe as qualitative and adjust the analysis plan to match.

### Same-N across heterogeneous segments

Symptom: "We'll interview 5 customers and 5 prospects."

Cause: treating "5 each" as a default without checking that 5 is enough per segment.

Fix: ask whether the segments are expected to converge or diverge. If they're expected to diverge meaningfully, each segment needs its own qualitative floor (5–8 per segment), so 5+5=10 is fine. If they're expected to be similar, you may be running two underpowered studies — consolidate.
