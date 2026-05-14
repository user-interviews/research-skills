# Methodology Selection

## Purpose

Pick the right method *after* the question is sharp, not before. UI's published guidance is unusually consistent: method-first thinking is the single most common research failure mode. This rubric is multi-axis — run all axes, narrow to a shortlist, pick the one that fits the question + decision + budget + timeline + role of AI.

> *"If you jump directly to methodology, you may end up stunting your study before it's even started."* (UI corpus)

## When to apply

After the pre-flight gate (`references/pre-flight-gate.md`) passes and question refinement (`references/question-writing.md`) is complete. Before drafting the brief's "How" section.

## How to use this rubric

Method selection is a narrowing exercise. Walk every axis, intersect the shortlists, then pick from the intersection. If no method fits all axes, something earlier is wrong — usually the question is still too broad or the constraints are unrealistic.

---

## Axis 1 — Decision type → method shortlist

From UI's `when-to-do-ux-research`. Map the decision to one of four buckets, then pull the shortlist:

| Decision type | Method shortlist |
|---|---|
| **Vision** | Observations, diary studies, literature reviews, focus groups, competitive analysis, card sorting, 1:1 interviews, A/B testing |
| **Strategy** | Surveys, continuous discovery interviews, analytics, clickstream analysis, focus groups, competitive analysis |
| **Definition** | Usability testing, preference testing, 1:1 interviews, A/B testing, card sorting, clickstream analysis |
| **Evaluation** | A/B testing, clickstream analysis, data analytics |

This is the NN/g 4-bucket framework UI adapted. Vision and Strategy lean generative; Definition and Evaluation lean evaluative.

---

## Axis 2 — Product-cycle stage → method category

| Stage | Method category | Examples |
|---|---|---|
| **Discovery (pre-prototype)** | Generative | Interviews, ethnography, diary studies, focus groups, stakeholder interviews, task analysis |
| **Concept Validation / Testing** | Evaluative | Qual usability, A/B, first-click, card sort/tree testing, preference testing, accessibility testing |
| **Ongoing listening** | Continuous | Feedback surveys, analytics, support tickets, NPS, customer success notes |

If the team is mid-discovery, an evaluative method will lock them into what's already in front of them. If the team is mid-validation, a generative method will produce broad insights that don't answer the testing question. Match the stage.

---

## Axis 3 — Field Guide question-type → method-type

From the UI Field Guide. The most useful first cut when the team isn't sure where they are:

| Question type | Method type |
|---|---|
| **"Why" / "How"** | Qualitative |
| **"How much" / "How many" / "How often"** | Quantitative |
| **"Who are our users" / "What should we build"** | Generative |
| **"Which design" / "Is this intuitive" / "What could be better"** | Evaluative |

If a single question spans multiple types ("Why do users churn AND how many do?"), it's two questions — split them and route each to its method.

---

## Axis 4 — Pejman's 3 decision-intent categories

From `driving-action-from-research-insights-pejman-babaei`. A sharper cut than the Vision/Strategy/Definition/Evaluation framework when the decision intent is clear:

| Decision intent | Method orientation |
|---|---|
| **Exploratory ideation** | Generative qual: interviews, ethnography, diary, focus groups |
| **Alternative selection** | Comparative evaluative: A/B, preference testing, conjoint, side-by-side usability |
| **Design-intent assessment** | Targeted evaluative: usability, first-click, tree testing, accessibility |

Use Pejman's framework when the team can name the decision intent precisely. Fall back to Axis 1 or Axis 3 when intent is ambiguous.

---

## Axis 5 — Generative vs. evaluative (the bright-line check)

> *"When used in the discovery phase, evaluative research methods ignore the full array of possibilities, and focus only on what's already in front of you, and what you think you already know."* (UI corpus)

The single sharpest check: **are you exploring or validating?**

- **Exploring** → generative methods only (interviews, ethnography, diary studies, focus groups, observational research).
- **Validating** → evaluative methods only (usability, A/B, preference, tree testing, accessibility).

Don't mix them in a single study unless the design is explicitly a generative-then-evaluative two-phase plan. Mixed-mode single studies produce shallow data on both fronts.

---

## Axis 6 — Budget floor

UI's published default for low-budget / fast research:

> *"a round of user interviews and a round of usability testing, each with about 5 participants."*

**n=5 is the floor** for both interviews and usability tests. Below 5, signal is too noisy to drive decisions. Above 5, you're in the standard zone — bump to 8 if the audience is heterogeneous or the decision is high-stakes.

For quantitative work, see `references/sample-sizes.md` for the full table. Floor for surveys is typically ≥100 for meaningful directional read.

---

## Axis 7 — Strategic vs. tactical

Rapid research is **tactical only**. From the corpus:

| Tactical (rapid OK) | Strategic (rapid NOT OK) |
|---|---|
| Intercepts | Foundational discovery |
| Light usability | Vision research |
| Concept testing | Multi-quarter strategy work |
| Surveys | Net-new product spaces |
| Literature reviews | Org-level investment decisions |
| Competitive analysis | Longitudinal behavior tracking |

If the decision is strategic and the team is asking for rapid research, refuse-or-redirect. Either re-scope the decision to something tactical, or commission proper foundational work.

### Budget / timeline floor

Timeline constraints bound the method shortlist:

- **Express timelines (1-3 days)** bound the method shortlist to AI-moderated interview, unmoderated usability, in-product survey, and async-short-diary. Other methods are not viable on this timeline — recruiting, scheduling, and live moderation all need more runway. Express also requires that the foundational fields (Why / What / Who) are already clear and the decision is binary or short-list. See the **Express variant** section of `references/patterns/contexts/rapid-cadence.md`.
- **Rapid (1-2 weeks)** — applies the 15-day per-day cadence; methods bounded to the tactical shortlist above. See `references/patterns/contexts/rapid-cadence.md`.
- **Standard (3-6 weeks)** and **In-depth (6+ weeks)** — full method shortlist available.

If a team wants Express but the question is exploratory or the audience needs defensible quant anchors, fall back to Rapid or longer. Express produces directional signal only.

---

## Axis 8 — Analytics-first sequencing

Michele Ronsen, verbatim:

> *"if you can answer a question better with analytics, use analytics, or at least start there."*

Sequencing rule:

1. **Analytics first.** Can existing dashboards / event data / cohort analyses answer the question? If yes, start there.
2. **Secondary research second.** Existing internal research, competitor research, industry reports, prior surveys.
3. **Primary research third.** Only after analytics and secondary research have surfaced the gaps that need primary work.

Skipping straight to primary research is the most expensive way to answer a question. Reserve it for the gaps analytics and secondary can't close.

---

## Axis 9 — NN/g 3-axis framework

From NN/g via the Field Guide. Use this when the team is unsure between two close methods:

- **Attitudinal vs. behavioral** — what people *say* (interviews, surveys, focus groups) vs. what people *do* (usability, analytics, clickstream).
- **Qualitative vs. quantitative** — small-n depth (interviews, ethnography, usability) vs. large-n breadth (surveys, analytics, A/B).
- **Context of use** — natural (diary, ethnography), scripted (usability, intercept), not using (interviews, surveys), or hybrid.

This is the most general cut. Two methods that look similar (interviews vs. focus groups) split cleanly on the attitudinal / behavioral and context-of-use axes.

---

## Worked example

**Question:** *"How do millennials choose a restaurant for a night out with friends?"*

- **Axis 1 (decision type):** Vision-shaped. Shortlist: observations, diary, focus groups, 1:1 interviews.
- **Axis 2 (product-cycle stage):** Discovery → generative methods.
- **Axis 3 (question-type):** "How" → qualitative; "What should we build / who are our users" → generative.
- **Axis 4 (Pejman):** Exploratory ideation.
- **Axis 5 (generative/evaluative):** Exploring → generative.
- **Axis 6 (budget floor):** n=5–8 interviews if budget is tight.
- **Axis 7 (strategic/tactical):** Strategic if this is foundational; tactical if this informs a specific menu redesign.
- **Axis 8 (analytics-first):** Is there existing data? Reservation data, app analytics, third-party industry reports? If yes, start there.
- **Axis 9 (NN/g 3-axis):** Attitudinal + qualitative + context-of-use (natural — observing or recalling actual restaurant choices).

**Intersection:** 1:1 interviews (n=5–8) or diary studies, in the natural context of recent restaurant decisions, with optional follow-up observation if budget allows.

---

## Output

Method selection produces:

1. **One primary method** with a one-paragraph rationale tying it to the question + decision + stage.
2. **Sample size** with rationale (`references/sample-sizes.md` for the table).
3. **Role of AI** if AI is involved — input, pressure-test, or never substitute (see `references/anti-patterns.md`).
4. **Moderation type** — human, AI, or unmoderated.

These fill the "How" and "Who" sections of `templates/default-brief.md`.

---

## Trigger rule

**If the resulting method is interview-style** (1:1 interviews, generative interviews, customer discovery interviews, jobs-to-be-done interviews, or any moderated qualitative conversation), **also run the AI-moderation-fit check from `references/patterns/methods/ai-moderation-fit.md`.**

That check determines whether the interviews should be human-moderated, AI-moderated, or hybrid — and produces the additional brief sections (per-question probing instructions, pressure-test step, active-monitoring plan) that AI-moderated studies require.
