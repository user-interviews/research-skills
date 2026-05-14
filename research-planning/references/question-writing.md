# Question-Writing Rubric

## Purpose

Turn a vague research request into 3–5 sharp questions that drive a study. UI's thought leadership is unusually consistent on what a good research question looks like — apply the rubric, surface failures, offer rewrites. Don't draft a brief on top of a malformed question.

## When to use

After the pre-flight gate passes (see `references/pre-flight-gate.md`) and before methodology selection (see `references/methodology-selection.md`).

The workflow is:

1. Capture the user's raw question.
2. Run it through the **specific / actionable / practical** filter.
3. If it fails, offer rewrites and pick one.
4. Question-storm around it (generate 8–15 candidates).
5. Prioritize to 3–5 questions that drive the study.

## The universal UI filter: specific / actionable / practical

Verbatim from UI (`how-to-create-a-ux-research-plan`):

> *"The best way to set specific study goals is to ask them in the form of research questions that are specific, actionable, and practical. It should be specific enough that you will know when you have found an answer, practical in that you could reasonably find answers to it in the scope of a research project, and actionable, so you can act on the answer that you find."*

- **Specific** — narrow enough that you'll know when you've answered it.
- **Actionable** — the answer changes what you do next.
- **Practical** — answerable within the scope of this project (time, budget, recruit, method).

If any of the three fails, the question needs a rewrite.

## SMART-for-research-questions (adapted)

From `how-to-lead-an-impactful-research-team`. A complementary rubric — useful when the specific/actionable/practical filter flags a problem but you need a more granular diagnosis:

- **Specific** — narrow scope, clear topic, defined population.
- **Measurable** — there's some way to recognize a complete answer (qualitative themes counted; quantitative threshold met).
- **Achievable** — realistic given time, budget, and recruit constraints.
- **Relevant** — tied to a real business or product goal; if not, see `references/pre-flight-gate.md`.
- **Timely** — fielded and answered before the decision it informs.

The Field Guide's companion checklist:

> *"How will the answer be used? Is there a specific metric or feature we are trying to develop better? How does this question build off what we already know?"*

## The assumption-surfacing prompt

From `how-to-facilitate-user-research-in-any-team-with-nicola-rushton`:

> *"If we're wrong that ___, this will fail."*

Fill in the blank for each assumption baked into the current plan. Then rank assumptions by risk × confidence:

> *"Nicola has the team order their assumptions from least to most risky and lowest to highest confidence. Push on the riskiest areas where you have the least certainty."*

The riskiest, lowest-confidence assumptions become research questions. The high-confidence ones are deprioritized (or covered briefly).

This is the single sharpest move for turning a vague request into testable questions.

## The workflow: question-storming → prioritize to 3–5

1. **Question-storm.** Generate 8–15 candidate questions around the topic. Don't filter yet. Mix scopes (big → small) and stances (descriptive, comparative, evaluative). The goal is breadth.
2. **Apply the filter.** Drop questions that fail specific / actionable / practical. Rewrite borderline ones.
3. **Prioritize to 3–5.** Pick the questions that:
   - Map directly to the decision the research enables.
   - Cover the riskiest, lowest-confidence assumptions (from the prompt above).
   - Together can be answered with a single method + recruit.
4. **Sequence.** Order them in the moderator guide from broad / context-setting → narrow / specific. Good interview guides funnel in.

## Good-question examples (UI corpus, verbatim)

Drop these in front of the user when they need a model:

- *"How do millennials choose a restaurant for a night out with friends?"*
- *"Does our new pricing page accurately communicate which features are available to new users?"*
- *"Are our customers able to successfully navigate to the support page on our site?"*
- *"How do 40–50 year olds choose vacation destinations?"*
- *"What tools do millennials use to learn how to manage their finances?"*

Why these work: each one is specific (named population, named domain), practical (answerable with one round of interviews or one usability test), and actionable (the answer changes a design, a copy decision, a feature priority).

## Failure modes

### Too big

> *"What do our customers want from their real estate providers?"* (Michele Ronsen's example.)

Can't answer in a single project. Rewrite into 2–3 narrower questions, each scoped to a specific decision: *"How do first-time homebuyers in Atlanta evaluate which agent to work with?"* / *"What features of our agent-matching tool do new buyers actually use in their first 30 days?"*

### Too small

> *"Can users find the sign-on button?"*

This is A/B test territory, not qualitative research. Either run the A/B test, or widen the question: *"How do users navigate to sign-on in our current flow, and where do they hesitate?"*

### Yes/no answer

The 6-question gate explicitly flags these:

> *"Is the answer to this question 'yes' or 'no'?"*

Examples: "Do our users like the new dashboard?" / "Will customers pay $20/month for this feature?" / "Is our onboarding flow good?"

Yes/no questions either need a quant treatment (survey with a threshold) or need to be re-scoped to "how" / "why": *"How do users describe their first experience with the new dashboard, and what specifically do they find useful or frustrating?"*

### Leading

> *"On a scale of 1-10 how much do you love User Interviews?"*

UI explicitly flags: *"Telling people what you want them to say increases the likelihood that they'll say it (whether or not it's true)."*

Neutralize: *"What's been your experience using User Interviews so far?"* or *"Walk me through the last time you used User Interviews — what worked, what didn't?"*

### Vague stand-in for "we don't know what we want"

> *"Get to know our customers."*

This is not a research question — it's a placeholder. From the pre-flight gate: if you don't know what you want to learn or how you'll use it, stop. Push back to the decision the research enables (see `references/decision-driven-research.md`) and re-scope from there.

### Method-pre-loaded

> *"We want to do a survey to find out why users churn."*

The method ("survey") has been chosen before the question is sharp. Strip the method and re-ask: *"Why do users churn within the first 30 days?"* — then let methodology selection (see `references/methodology-selection.md`) recommend the method. Survey may or may not be right.

## Anti-patterns

- **Drafting a brief on a malformed question.** Don't. Refuse-or-rewrite first.
- **Stacking 8+ questions into the brief.** 3–5 is the ceiling. More means the study is unfocused; you'll get shallow answers to everything.
- **Question that re-states the hypothesis.** *"Do users prefer the new design because of its modern aesthetic?"* — leading and pre-loaded. Strip the hypothesis from the question and let the data speak.
- **Question that requires the participant to be a designer / researcher / strategist.** *"What features should we build next?"* puts the design burden on the participant. Better: *"What jobs are you trying to get done that our product doesn't currently support?"*

## Output

After running the rubric, the brief's "Research question(s)" section should hold 3–5 questions, each passing specific / actionable / practical. The "Hypotheses / assumptions to test" section should hold the risk-ranked assumptions from the surfacing prompt — these are the questions' implicit bets, made explicit.

If after one rewrite the question still fails the rubric, stop and ask the user what decision the research informs. The question is often vague because the decision is vague.
