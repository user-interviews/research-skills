# Decision-Driven Research

## Purpose

The default framing for every brief this skill produces. Decision-driven research is the most-cited framework in UI's thought leadership corpus and the easiest one for non-researchers to apply — it forces the brief to name a real downstream decision before fielding anything.

## Core principle (verbatim)

From `a-framework-for-decision-driven-research`:

> *"Decision-driven research is information collected through research that is used to inform company-decisions."*

That single sentence is the gate. If the brief can't name the decision the research informs, it's not decision-driven — and probably shouldn't be running. See `references/pre-flight-gate.md`.

## When to apply

**Default for all briefs.** Unless the user explicitly invokes another framing (HCD's three-question framing, MVR for speed-constrained work, Rumelt's strategy framing for research strategy docs), apply Decision-Driven Research.

Why default: it's the most prevalent framework in UI's corpus, the easiest to apply without research training, and it makes the brief's "Why" and "What we'll do if we don't do this research" sections fill themselves in.

## The 5 phases

### Phase 1: Decision Trigger

Name the decision. Be specific. *"We will decide whether to ___"* or *"We will choose between ___ and ___"* or *"We will set the priority of ___ on the next quarter's roadmap."*

Inputs to capture:
- The decision in one sentence.
- Who owns the decision (the decision-maker, not the requester).
- The deadline by which the decision needs to be made.
- What's already known about the decision space (prior research, analytics, stakeholder opinions).

Anti-pattern at this phase: *"We want to learn about [topic]."* That's a topic, not a decision. Push back until a decision surfaces — or kick to the pre-flight gate.

### Phase 2: Scope Evidence

Inventory what evidence already exists before scoping new research.

Inputs to capture:
- Prior research (your own team's repository, sister teams', external published research).
- Analytics that could partially answer the question.
- Stakeholder knowledge — *"talking to your team"* is Ronsen's first stop before commissioning new research.
- Secondary sources (industry reports, competitor analyses, public data).

Output: a one-paragraph "what we know already" that scopes the *new* research down to the gaps.

This phase is also where Michele Ronsen's analytics-first rule applies: *"if you can answer a question better with analytics, use analytics, or at least start there."*

### Phase 3: Define Approach

Now — and only now — scope the research approach.

Inputs to capture:
- Research questions (3–5, per `references/question-writing.md`).
- Methodology (per `references/methodology-selection.md`).
- Participants (recruit criteria, sample size, sourcing).
- Timeline, budget, tools.
- Role of AI (input / pressure-test / never substitute).

The brief's 6-field structure (`assets/default-brief.md`) is the natural output of this phase.

### Phase 4: Exploration

Field the study.

Inputs to capture:
- Schedule for fielding (kickoff, fielding window, mid-study check).
- Active monitoring plan, especially for AI-moderated work.
- Mid-study adjustments allowed? Define the boundary — scope creep is an anti-pattern; clarifying probe questions is fine.
- Recording / transcription / data-management logistics.

Output: tagged transcripts, recordings, raw notes, survey data — whatever the method produces.

### Phase 5: Reflect & Decide

Close the loop. The decision named in Phase 1 either gets made or gets re-scoped based on the findings.

Inputs to capture:
- Synthesis approach (themes, frameworks, statistical analysis).
- Deliverables (readout, written summary, executive summary, prototype directions).
- Activation plan — *"Delivering an insight report is not enough."*
- Follow-up: open questions, future studies, longitudinal tracking.

The "Next steps" section of the brief covers this phase.

## How this maps to the brief

The brief's 6 fields aren't arranged by phase — they're arranged for readability. But they cover all 5 phases:

- **What** (research question, decision, hypotheses) → Phase 1 + the question-refinement output.
- **Why** (business goal, counterfactual) → Phase 1's "why this decision matters" + Phase 2's scoping.
- **How** (method, role of AI, moderation) → Phase 3.
- **Who** (participants, sample size, audience) → Phase 3.
- **When and where** (timeline, budget, tools) → Phase 3 + Phase 4 fielding plan.
- **Next steps** (deliverables, activation, follow-up) → Phase 5.

If any phase is empty in the brief, the brief isn't ready.

## Edge cases

**The decision is "should we invest in this area at all?"**
That's a legitimate decision — strategic in nature. Decision-Driven Research still applies. The "Why" field captures the strategic stakes; the "What we'll do if we don't do this research" field forces honesty about whether the answer changes the investment.

**Multiple decisions across stakeholders.**
Common in larger orgs. Pick one primary decision the research is gated on. Secondary decisions can be informed by the same research but shouldn't drive the scope. If you can't pick a primary, the request is two studies dressed as one.

**Continuous / ongoing research (e.g., monthly customer interviews).**
The "decision" in Phase 1 becomes a recurring decision — *"we will adjust the roadmap each month based on what we learn."* The framework still applies; the cadence changes.

**Exploratory / no clear decision yet.**
This is where the gate matters most. If there's truly no decision attached, run a smaller exploratory study (low-cost, narrow recruit) with the explicit goal of *generating decisions to make*. Don't dress it up as decision-driven research when it isn't.

## Alternative framings (for reference)

Use only when the user explicitly invokes them or the work obviously fits:

- **HCD's three-question framing** (Marianne Berkovich) — *What should we build? / How should we build it? / Did we build it right?* Maps to product-cycle stage. Useful for teams whose work is product-cycle-shaped.
- **Minimum Viable Research (MVR)** — speed-constrained variant. Same decision-first discipline, smaller scope. *"What an MVR should not be is an excuse for cutting corners."*
- **Diagnosis / Vision / Coherent Actions (Rumelt)** — for research *strategy* docs, not project briefs. Skip unless the user is writing a research strategy.

For v1 of this skill, Decision-Driven Research is the only framing the default brief assumes. The alternatives live in reference files for users who want them.
