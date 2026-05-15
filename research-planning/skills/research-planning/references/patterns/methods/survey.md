# Method pattern: survey

Surveys collect structured responses at scale — quantitative measurement, qualitative feedback at volume, or both. The right method when you need numbers, breadth, or open-ended input from more participants than interviews can support. See `references/methodology-selection.md` for how this method gets picked; this file shapes the brief once it has been selected.

## When this pattern applies

Apply this pattern when the research question matches one or more of these shapes:

- "How many users [behavior / experience / opinion]?"
- "What share of our customers [outcome]?"
- "How does [metric] compare across [segments]?"
- "What do customers think about [feature / change / experience] — across enough people to see the distribution?"
- "Which of these options resonates most, and by how much?"

Triggers for routing to this pattern:

- The question needs scale to be credible (n≥100 typically; minimum n≥20 for qualitative signal).
- The question is about measurement, prevalence, or distribution.
- The stakeholder will only act on numeric evidence.
- The audience is too broad to interview adequately.
- The team needs to screen a larger pool before deeper qualitative work (screener survey).

Do NOT route to a survey when:

- The question is "why" or "how" — surveys can hint, but interviews uncover. Pair the survey with discovery interviews if you need both.
- The sample size will be n<20 — too small to draw quantitative conclusions, and a 20-minute interview returns more signal than a 20-person survey at that scale.
- The team needs to observe behavior — surveys collect self-report, which diverges from actual behavior. Pair with analytics or usability if behavior matters.
- The question is about a future hypothetical — people are bad at predicting their own future behavior, regardless of how many you ask.

## What it adds to the brief

The default brief sections stay; the methodology and participants sections get survey-specific content. Add these to the brief:

- **Survey type and intent.** Screener (filtering for downstream qualitative), full survey (insight collection), pulse (ongoing measurement), or hybrid. Each has different defaults.
- **Question inventory with types.** List every question with its type (open-ended / single-select / multi-select / Likert or scaled / ranking). Total question count should be visible in the brief — drift past the target length is the #1 reason completion rates collapse.
- **Sample size and confidence target.** State the target n. For quantitative validation: n≥100 minimum, more if you need segment-level breakdowns. For qualitative signal: n=20–50 with mostly open-ended questions.
- **Audience and source.** Recruited panel, customer list, intercept, social. Note any sampling bias risk in the brief — opt-in surveys to customer lists over-represent engaged users.
- **Estimated completion time.** Test the survey end-to-end; the completion estimate goes in the recruiting copy. Surveys that overrun their estimate get abandoned.
- **Open-response handling plan.** If open-ended questions are included, name who will read and code them — open responses without an analysis plan become a 200-row spreadsheet nobody opens.
- **Incentive.** Tied to length and audience. Listed in the brief so logistics can plan.

Also surface in the brief:

- A pilot step before fielding — pressure-test 3–5 people. Wording issues, broken logic, and confusing answer options surface fast.
- Branching/skip logic, if any. Surveys with complex branching benefit from a flow diagram.

## Defaults

**Sample size sliding scale:**

| Goal | n | Question mix |
|---|---|---|
| Qualitative signal | 20–50 | Mostly open-ended, light closed |
| Quantitative validation | 100+ | Mostly closed/scaled, sparse open |
| Segment comparison | 100+ per segment | Closed/scaled with segment-level breakouts |
| Screener (for downstream interviews) | As many as it takes to find ~10 qualified | Mostly closed, disqualify early |

UI's Field Guide lists ≥100 as the floor for survey-as-quantitative-method.

**Length targets:**

- **Screener:** Fewer than 10 questions, ideally 5–8. Funnel order — disqualify early. Don't pile up questions before the disqualifying ones; you'll lose participants.
- **Full survey:** Target 5–10 minutes to complete. Test end-to-end before fielding.
- **Pulse / NPS:** 1–5 questions. Add one open-ended "tell us more" for texture.

**Question types and when to use them:**

- **Open-ended.** Use sparingly. High-value but low-completion. Reserve for 1–3 questions where verbatim language matters. Place near the end.
- **Single-select.** When categories are mutually exclusive. Always include "other" with a write-in OR "none of the above," depending on the question.
- **Multi-select.** When the participant might choose several. Cap the option count (~7) — beyond that, satisficing kicks in (participants stop reading and pick the top ones).
- **Likert / scaled.** 5- or 7-point scales for attitudes and agreement. Always label both endpoints in the question stem (see Examples below). 10-point scales are common for NPS but invite anchoring bias — define the endpoints explicitly.
- **Ranking.** When relative priority matters. Cap at 5 items — ranking 10 things is cognitively expensive and the bottom of the rank is noise.

**Sampling and recruitment:**

- Customer-list surveys over-represent the most engaged users. State this caveat in the brief.
- Panel-recruited surveys give broader audiences but require sharper screening.
- Intercept surveys (in-product) capture real-context responses but skew toward power users by definition.
- For segment comparison, target the smaller segment's quota first — the larger segment fills naturally.

**Pilot before fielding:** 3–5 colleagues or near-target participants. Always. Almost every first-draft survey has at least one broken question. Pilot is cheap insurance.

**Recurring vs. one-shot:** If the survey is intended to track a metric over time, decide at brief-time how often it will run and how it will be re-fielded. One-shot surveys frequently become accidental pulse surveys with no methodology consistency.

**Scale anchoring:** When using Likert or numeric scales, anchor both endpoints in the question stem itself ("1 being 'I hate it' and 10 being 'I love it'"). Don't rely on label-only scales — different participants interpret unlabeled scales differently.

**Question order effects:** Earlier questions prime later ones. Place sensitive or biasing questions (NPS, satisfaction) before topical detail questions that might lead the participant toward justifying their score. Conversely, place demographics last to avoid early-attrition risk.

## Screener vs. full-survey distinction

Treat these as separate tools with different jobs.

- **Screeners filter.** Their job is to qualify participants for downstream interviews, usability tests, or focus groups. They are short (<10 questions, ideally 5–8), behavior-focused, and structured as a disqualification funnel — fail fast, save the participant's time, save the recruiting budget. Screeners are not insight collection devices; resist the temptation to add "while we have them, let's ask..." questions.
- **Full surveys collect insights.** Their job is to produce data the team will analyze. They are longer (5–10 minutes target), include a mix of question types, and are structured around the research question. Full surveys never disqualify participants partway through.

Mixing the two — a long survey that pretends to be a screener, or a tight screener that's secretly an insight survey — corrupts both. Decide which tool you're building before drafting the questions.

## Examples

**Bad / good leading-question pair (verbatim from the corpus):**

Bad: *"On a scale of 1-10 how much do you love User Interviews?"*

The word "love" anchors positive. The participant is already committed to a positive frame before they pick a number.

Better: *"On a scale of 1-10, 1 being 'I hate it' and 10 being 'I love it', how do you feel about User Interviews?"*

Both endpoints are labeled. The participant sees the full range before answering. The frame is neutral.

**Bad / good answer-range pair:**

Bad:
- 0–3 sessions per month
- 3–7 sessions per month
- 7–10 sessions per month

The ranges overlap at 3 and 7. A participant who runs exactly 3 sessions doesn't know which bucket to pick.

Better:
- 0–2 sessions per month
- 3–6 sessions per month
- 7–10 sessions per month
- More than 10

Mutually exclusive, exhaustive, and includes an upper-bound catch-all.

**Bad / good multi-select handling:**

Bad: "Which of the following do you use? (Select all that apply.) [12 options, no 'none of the above']"

A participant who uses none of them has no valid answer. They'll either skip the question (losing the data) or pick something random (corrupting the data).

Better: 7–8 most-likely options + "Other (please specify)" + "None of these." Cap option count; provide an escape valve.

**Good screener funnel order:**

1. Demographic disqualifiers (region, role) — disqualify here, before any time investment.
2. Behavioral qualifiers (what they actually do) — the main qualification.
3. Recency check (when they last did it) — exclude stale participants.
4. Logistical (availability, willingness, contact preference) — last, after they're qualified.

**Good Likert-stem example:**

> On a scale of 1 to 7, where 1 means "strongly disagree" and 7 means "strongly agree," how do you feel about this statement: "The dashboard makes it easy to find the metrics I care about."

Endpoints labeled in the stem. Statement is a single proposition (not a compound). Scale is odd-numbered, allowing a neutral midpoint.

**Good open-ended placement:**

Put 1–2 open-ended questions near the end of the survey, after closed questions have given the participant context. The first 3–5 minutes of a survey is when participants are most engaged; spend that budget on closed questions that get analyzed. Open-ended responses skew toward the end-of-survey moment when participants are wrapping up.

## Analysis and synthesis defaults

The brief should name how survey data gets analyzed. The most common survey failure mode is collecting data without an analysis plan and ending up with a 200-row spreadsheet nobody opens.

- **Closed-question analysis plan.** State which segments will be cut, which comparisons will be made, and what thresholds matter. "We'll compare NPS by company size" is a plan; "We'll look at the data" is not.
- **Open-response coding plan.** If open-ended questions are included, name the coding scheme (or a placeholder for one developed after pilot review). Open responses without a coding scheme become an unsorted text dump.
- **Statistical handling.** For quant studies (n≥100), state how confidence intervals will be reported. Single-percentage callouts without confidence intervals overstate certainty.
- **Visualization defaults.** Bar charts for categorical comparisons; histograms for distribution; tables for cross-segment comparison. Avoid pie charts past 4 slices.
- **Reporting cadence.** Pulse surveys need a recurring report; one-shot surveys need a single readout with a named date. Mixing the two corrupts both.

Name a synthesis owner and a target readout date in the brief.

## Anti-patterns

- **Leading questions.** "How much do you love X?" anchors positive. "How frustrating is X?" anchors negative. Neutralize by labeling both endpoints or rewriting as behavior ("How often did you use X this month?").
- **Multi-part questions.** "How easy was it to find and complete the setup process?" combines two separate experiences (find + complete) into one answer. Split into two questions.
- **Overlapping answer ranges.** "0–3 / 3–7 / 7–10" — must be mutually exclusive. Always check ranges for double-coverage and gaps.
- **No "other" or "none of the above" option.** Forces participants into wrong answers when the option list doesn't cover their case. Always include an escape valve unless the option list is genuinely exhaustive.
- **Demographic-heavy targeting when behavior is what matters.** "PMs at SaaS companies" is weaker than "PMs who ran a customer interview in the last 90 days." Recruit on behavior; demographics are a coarse proxy.
- **Asking about future behavior.** "Would you pay for X?" "How often would you use Y?" People misreport. Reframe as past behavior or willingness-to-pay anchored to a current alternative.
- **Open-ended questions without an analysis plan.** "Any other feedback?" at the end of a 500-respondent survey generates a wall of text that nobody reads. Either commit to coding open responses or remove them.
- **Loaded language.** "How concerned are you about [issue]?" presupposes concern. Reframe as "What's your reaction to [issue]?" with neutral scale labels.
- **Sensitive questions placed early.** Income, age, identity questions early in the survey raise the dropout rate. Place demographics at the end (after the participant is invested), unless they're disqualifying screeners (in which case they go first by necessity).
- **Confusing screeners with surveys.** Screeners filter — their job is to find qualified participants for downstream qualitative work. Don't pile insight questions into a screener; the participants who fail it won't answer them and the participants who pass are then over-surveyed before the real interview. Screeners are for filtering, full surveys are for insights.
- **No pilot.** Skipping the 3–5-person pilot is the most common preventable mistake. Almost every first-draft survey has a broken question.
- **Drift past the target length.** Every additional question reduces completion rate. If the brief targets 5–10 minutes and the draft hits 18, cut questions; don't add a "we'll just deal with the dropout" line to the brief.
- **Survey as a substitute for interviews.** When the question is "why" or "how," a survey returns brittle answers. Surveys answer "what" and "how many" — interviews answer the rest.

## Brief deltas summary

Quick checklist of what the survey pattern adds to the default brief. The agent generating the brief should confirm each item is present:

- [ ] Survey type named (screener / full survey / pulse / hybrid).
- [ ] Sample size target with confidence rationale.
- [ ] Audience and source named (panel / customer list / intercept / social), with sampling-bias caveats.
- [ ] Question inventory with type per question (open / single-select / multi-select / Likert / ranking).
- [ ] Total question count and estimated completion time stated.
- [ ] Likert scales label both endpoints in the question stem.
- [ ] Multi-select questions include "other" or "none of the above" where applicable.
- [ ] Answer ranges checked for mutual exclusivity.
- [ ] Open-ended questions limited to 1–3, placed near the end.
- [ ] Open-response analysis plan named.
- [ ] Branching/skip logic mapped if present.
- [ ] Pilot scheduled with 3–5 testers before fielding.
- [ ] Incentive named.
- [ ] If recurring: cadence and re-fielding methodology consistency rules.

## Cross-references

- Methodology selection: `references/methodology-selection.md`
- Question writing (specific / actionable / practical filter): `references/question-writing.md`
- Anti-patterns library (full): `references/anti-patterns.md`
- Sample sizes (authoritative table): `references/sample-sizes.md`
- Screener rules (full procedure): `references/screener-rules.md`
- Discovery interview (paired upstream when survey insights need qualitative texture): `references/patterns/methods/discovery-interview.md`
