# Pre-Flight Gate: Should we even do this research?

## Purpose

Decide whether the research is worth running *before* drafting a brief. This is the highest-leverage check in the entire workflow — UI's own thought leadership says doing research when any of these checks fails is worse than not doing it at all.

Refuse-or-redirect when the gate fails. Don't draft a brief on top of a request that shouldn't exist.

> **Verbatim from the UI Field Guide:** *"If you're not already clear about the goals of your research, stop here. Do not pass go."*

## When to use

Run this gate **before** anything else. Before question refinement. Before methodology selection. Before pulling out the brief template.

If the request comes in as "we need to do research on X," your first job is the gate, not the brief.

## The Combined Gate

Seven sources converge here. Run all seven checks. Any single failure is a stop-or-redirect signal.

### 1. The 6-question gate (UI: `when-to-do-ux-research`)

> *"Ask yourself these questions before kicking off a new research project:*
> - *Has the decision already been made?*
> - *Does my team have agency to make the decision?*
> - *Can we answer this research question by doing a Google search?*
> - *Is the answer to this question 'yes' or 'no'?*
> - *Has this research been done before, either by myself or someone else?*
> - *Am I conducting research only to get political buy-in?*
>
> *If you answer 'yes' to any of these questions, you may not need to conduct any qualitative research."*

### 2. Michele Ronsen's 7 reasons not to do user research

Refuse or redirect if any of the following apply (H2 headings verbatim from `7-reasons-not-to-do-user-research`):

1. When you can answer your research question with analytics, secondary research, or by talking to your team.
2. When you don't know who you should be talking to.
3. When you don't know what you want to learn, or how you'll use those learnings.
4. When you don't have enough time to do qualitative user research.
5. When you're going through the motions to prove your solution is right.
6. When you don't have stakeholder buy-in.
7. When you haven't right-sized the question.

### 3. Maria Sbrocca's 3 pre-flight questions

From `create-long-term-ux-impact-with-stronger-stakeholder-relationships`:

- What questions do we need to answer?
- How will we use these research insights?
- **Do these insights have an expiration date?**

The "expiration date" check is the novel one — if the decision the research informs is happening before you can field, analyze, and read out, the work won't land in time to matter. Re-scope or redirect.

### 4. Pejman's 4 planning factors

From `driving-action-from-research-insights-pejman-babaei`:

- **Focus / specificity** — Is the question narrow enough to answer in this study?
- **Timeliness vs. sprint cycle** — Will findings land before the team needs them?
- **Cost / ROI** — Does the cost (time, money, attention) match the value of the decision?
- **Motivation / trust** — Will stakeholders trust the output? Will they act on it?

If any factor is weak, address it before fielding — or skip the study.

### 5. Generative vs. evaluative test

From `getting-started-with-discovery-research`:

> *"When used in the discovery phase, evaluative research methods ignore the full array of possibilities, and focus only on what's already in front of you, and what you think you already know. This research tends to be geared more toward validating decisions you've already made, rather than generating new solutions."*

Ask: **Are you exploring or validating a pre-formed decision?**

- Exploring → generative methods are in scope (interviews, ethnography, diary studies).
- Validating an already-made decision → don't dress it up as discovery. Either run honest evaluative research (usability, A/B, preference) or recognize the decision is made and skip the study.

### 6. AI-first sanity check

From the AI-research context (Part 3 of the source memo):

- **Are real humans named?** Recruit criteria, sample size, sourcing — these must not be blank regardless of how much AI is assisting. Synthetic users are not participants.
- **What role is AI playing?** Pick one: **input** (drafts the guide, surfaces assumptions), **pressure-test** (simulates pilot responses before fielding), or **substitute**. Substitute is a block, not a tradeoff.
- **Is the target population well-documented in public data, or niche?** Niche populations underrepresented in training data → no synthetic users, full stop.

### 7. UI Field Guide STOP language

When the goal isn't clear, hold the line:

> *"If you're not already clear about the goals of your research, stop here. Do not pass go."*

Use this as a literal forcing function. If after one round of clarifying questions the goal is still vague ("get to know our customers," "understand the user better," "see what people think"), the gate fails. The research has no decision attached and won't produce action.

## Refusal-or-redirect responses

Sample language for each failure mode. Stay direct and friendly. Don't lecture.

**Decision already made →**
"It sounds like the decision is already locked in. Research run after the fact rarely changes the outcome. Two options: (a) skip this study and document the decision rationale, or (b) reframe as evaluative research that tests the *implementation*, not the decision."

**Team has no agency →**
"If your team can't actually make the decision this research would inform, the findings won't drive action. Who owns the decision? Worth pulling them in before scoping the study."

**Can Google it →**
"This looks like it can be answered with desk research or secondary sources. Want to start there? Cheaper, faster, and if it's not enough we can scope a primary study with sharper questions."

**Yes/no question →**
"As written, this is a yes/no question. Yes/no answers usually mean A/B testing, analytics, or a single survey question — not qualitative research. Either re-scope to 'how' or 'why' (which opens up qualitative), or run the quick quant version first."

**Already been done →**
"Looks like there's prior work in this area. Pull the prior research before scoping new work. If gaps remain, scope around the gaps."

**Political buy-in only →**
"Research run to win an argument rarely wins the argument. If the goal is alignment, a stakeholder workshop is more honest and faster. Want help framing one?"

**Don't know who to talk to →**
"Before scoping the study, name the recruit. If you can't describe the participant in one sentence, the question may be too broad or too early."

**Don't know how you'll use the learnings →**
"Name the decision this informs. If we can't name a decision, this isn't decision-driven research and we should stop here. See `references/decision-driven-research.md`."

**No time to do it well →**
"What's the actual deadline? If the decision lands before the study can field + analyze + read out, the work won't matter. Either move the deadline, scope smaller (a 5-person rapid round may fit), or skip the study."

**Going through the motions to prove solution is right →**
Michele Ronsen, verbatim: *"research as a weapon... they're conducting user research or wanting to conduct user research, to mask it as a way to prove a point or to validate, you know, one direction or another is just wrong."* Don't field this study. Either run it as honest evaluative research (which means accepting it may invalidate the solution) or skip it.

**No stakeholder buy-in →**
"Without stakeholder buy-in, the findings won't drive action — even if the research is rigorous. Spend time aligning stakeholders first, then scope the study."

**Question not right-sized →**
"This question is [too big / too small]. See `references/question-writing.md` for the rubric. Want to question-storm and prioritize down to 3–5 sharper questions?"

**Insights have an expiration date →**
"The decision lands before this study can produce findings. Either move the decision, scope smaller (rapid round), or skip the study and document the decision rationale."

**AI-substitute framing →**
"Synthetic users / AI-only research isn't a substitute for primary research with real users. AI is fine as input (drafting the guide, surfacing assumptions) or pressure-test (simulating pilots), but you still need real humans to learn from. Want help re-scoping with real recruits?"

**Niche population + synthetic users →**
"This population is underrepresented in LLM training data — synthetic users will hallucinate confidently. Real recruits only. Recruiting may be harder; budget accordingly."

## After the gate

If the request passes all seven checks, proceed to question refinement (`references/question-writing.md`) → methodology selection (`references/methodology-selection.md`) → draft brief (`assets/default-brief.md`).

If the request fails, refuse-or-redirect with the specific language above. Don't soften. The gate exists because soft refusals produce bad briefs.
