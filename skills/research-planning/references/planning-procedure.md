# Planning Procedure — UI Field Guide canonical 7 steps

## Purpose

Reference the canonical procedure User Interviews' Field Guide teaches for planning a research project. The skill's sub-agent workflow follows the same meta-shape; this file makes the underlying structure explicit so users can map the brief they're producing back to a recognized methodology.

## When to apply

- A user wants to understand why the skill asks for the information it asks for, in the order it asks for it.
- A user pushes back on a step ("do we really need to gather existing data?") and you need the canonical justification.
- A user wants to plan research outside the skill, longhand, and needs the procedure as a checklist.
- A reviewer wants to verify the brief covers everything UI's published methodology covers.

## The 7 Steps

These are the canonical steps, verbatim from UI's Field Guide (`create-user-research-plan`).

### Step 1 — Identify research goals

Start with what you're trying to learn and why it matters. Goals come before questions, methods, participants, and timelines. If you can't name the goal, do not pass go — work the goal-identification questions below until you can.

### Step 2 — Develop research question(s)

Convert the goal into one or more research questions. Each question should be specific, actionable, and practical — specific enough that you'll know when you've answered it, actionable enough that the answer changes what you do next, practical enough that you can answer it inside this project's scope.

### Step 3 — Gather available data and existing insights

Before fielding new research, check what you already know. Past studies. Analytics. Support tickets. Team knowledge. Public research. If the answer is already sitting somewhere, you don't need to run the project — you need to find and synthesize it.

### Step 4 — Choose research method(s)

Method is a derived decision. It follows from the question, the decision the research informs, the product-cycle stage, and the constraints. Do not start here. Method-first planning is a documented anti-pattern across UI's corpus.

### Step 5 — Design study

Build the artifacts the method needs. For interviews, a discussion guide. For usability tests, tasks and a prototype. For surveys, the questionnaire. The study is where the question gets operationalized into something real participants can respond to.

### Step 6 — Have a recruiting strategy

Specify who you're talking to, how many, and how you'll source them. Screening criteria. Incentives. Customer pool vs. external panel. No-show buffer. The brief is not complete without a recruiting plan.

### Step 7 — Be ready to share findings

Decide before you start how findings will move through the org. Who's the audience. What format. What decisions the findings feed. How impact gets measured. UI's repeated refrain: delivering an insight report is not enough.

## The goal-identification questions

When working Step 1, run the user through this exact question set from the Field Guide, verbatim:

> "What do I want to know? What don't I know? How will I know when I've learned it? What company goals will this work support? Where am I in the product development process? **What decision will this research enable?** What are the anticipated outcomes of this research?"

### The gating question

**"What decision will this research enable?"** is the sharpest single framing in UI's playbook. Treat it as the gate.

If the user cannot name the decision the research enables:
- Do not move on to Step 2.
- Surface the gap explicitly.
- Offer to help them name the decision — what choice is pending, who's making it, when, and what evidence would change the choice.
- If after that exercise no decision exists, this is a strong signal the research should not run. Route to the pre-flight gate reference.

A research project without a downstream decision is research as theater. UI is unusually firm on this point — every planning-related post in the corpus restates some version of it.

## How this maps to the sub-agent workflow

The skill's sub-agent workflow operationalizes this procedure but does not surface the step numbers to the user. The mapping:

| Field Guide step | Sub-agent workflow phase |
|---|---|
| 1. Identify research goals | Pre-flight gate + decision framing |
| 2. Develop research question(s) | Question refinement (specific / actionable / practical filter) |
| 3. Gather available data | Existing-evidence check (analytics, prior research, secondary sources) |
| 4. Choose research method(s) | Methodology selection (multi-axis rubric) |
| 5. Design study | Study design section of the brief |
| 6. Have a recruiting strategy | Participants section of the brief |
| 7. Be ready to share findings | Next steps / activation plan section |

The workflow front-loads Steps 1–3 because that's where most research projects fail. A user who arrives with "we should interview some customers about pricing" has skipped Steps 1–3 and started at Step 4. The skill walks them backward to the goal.

## Why this procedure

The Field Guide procedure is the most authoritative published version of how to plan research. It is:

- **First-party from UI.** Other reference files in this skill pull from blog posts; this one pulls from UI's polished, structured educational content.
- **Goal-first, not method-first.** Method is Step 4, not Step 1. This ordering is the single most important thing the skill enforces.
- **Decision-anchored.** "What decision will this research enable?" is the gating question, not an afterthought.
- **Operational.** Each step produces an artifact that feeds the next step.

Refer users to this reference when they ask why the skill operates the way it operates, or when they want to plan research without the skill and need the canonical checklist.

## Examples

### Example: user starts at Step 4

User: "I want to run usability tests on our new checkout flow."

The user has named a method (usability tests) and a target (checkout flow) but skipped Steps 1–3. The skill should:

1. Ask: what decision will the usability tests enable? (Step 1)
2. If they say "we want to know if it's good" — push for the actual decision. Ship? Don't ship? Iterate? Which version goes live? (Still Step 1.)
3. Convert the decision into a research question. "Does the new checkout flow let users complete a purchase without help?" (Step 2)
4. Check existing data. Have they instrumented the current flow? Are there support tickets? (Step 3)
5. Only then validate that usability testing is the right method given the question and decision. (Step 4)

### Example: user has the goal but no question

User: "We need to understand why customers are churning."

Goal is clear, question is not. The skill should:

1. Confirm the decision: what would they do differently if they understood churn drivers? (Step 1 gating question.)
2. Develop specific, actionable, practical questions: "Which feature gaps do customers cite when canceling?" "Which customer segments churn fastest in the first 60 days?" (Step 2)
3. Check existing data first — cancellation surveys, support transcripts, NPS comments — before designing new research. (Step 3)

## Anti-patterns

- **Skipping Step 1 because "we already know the goal."** If you can't write the goal in one sentence, you don't know it.
- **Treating Step 3 as optional.** Existing data is the cheapest research you'll ever do. Skipping it wastes the new project's budget answering questions you already had answers to.
- **Starting at Step 4 (method).** Method-first is the most common failure mode. The skill must catch it.
- **Skipping Step 7 until after fielding.** Activation planning before the study, not after, is what separates research that drives decisions from research that lives in a slide deck.
