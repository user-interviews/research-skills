# Methodology Selection

## Purpose

Pick the right method *after* the question is sharp, not before. UI's published guidance is unusually consistent: method-first thinking is the single most common research failure mode. This rubric is a **decision procedure**, not a checklist — three forcing axes narrow to a 1–3 method shortlist, then six tiebreakers pick among them.

> *"If you jump directly to methodology, you may end up stunting your study before it's even started."* (UI corpus)

## When to apply

After the pre-flight gate (`references/pre-flight-gate.md`) passes and question refinement (`references/question-writing.md`) is complete. Before drafting the brief's "How" section.

## How to use this rubric

Run the 3 forcing axes in order. Each axis narrows the shortlist:

1. **Generative or evaluative?** This is the bright-line check. Wrong answer here makes everything downstream wrong.
2. **Attitudinal or behavioral?** What's the question actually asking — what people say or what people do?
3. **Qual or quant?** Depth or breadth?

The intersection of these 3 narrows to a method shortlist (usually 1–3 candidates). If the shortlist is empty, one of the forcing-axis answers is wrong — go back and re-answer.

Then apply the 6 tiebreakers WITHIN the shortlist. The tiebreakers don't override the forcing axes; they pick among methods that pass them.

If the forcing axes are unclear (e.g., the question genuinely could be either generative or evaluative), state the ambiguity, surface it to the user, and re-pose the question more sharply. Don't proceed with method selection while the forcing axes are unresolved.

---

## Forcing Axis 1 — Generative vs. evaluative

> *"When used in the discovery phase, evaluative research methods ignore the full array of possibilities, and focus only on what's already in front of you, and what you think you already know."* (UI corpus)

The single sharpest check: **are you exploring or validating?**

- **Exploring** → generative methods only (interviews, ethnography, diary studies, focus groups, observational research).
- **Validating** → evaluative methods only (usability, A/B, preference, tree testing, accessibility).

This is the FIRST cut; everything downstream flows from this answer. Don't mix them in a single study unless the design is explicitly a generative-then-evaluative two-phase plan. Mixed-mode single studies produce shallow data on both fronts.

---

## Forcing Axis 2 — Attitudinal vs. behavioral

From NN/g via the UI Field Guide. **What people *say* vs. what people *do*?**

- **Attitudinal** → interviews, surveys, focus groups. Captures stated preference, recalled experience, articulated reasoning.
- **Behavioral** → usability tests, analytics, ethnography, clickstream. Captures observed action, task completion, actual usage.

This is the second cut and roughly halves the shortlist. Two methods that look similar on the surface (interviews vs. focus groups vs. usability) split cleanly here.

Context-of-use is a sub-question within this axis: behavioral data can be captured in *natural* context (diary, ethnography), *scripted* context (usability, intercept), or via *recalled* context (interviews about past behavior — note this is technically attitudinal, since you're capturing what people say about what they did).

---

## Forcing Axis 3 — Qual vs. quant

Small-n depth vs. large-n breadth?

- **Qual** → small n (5–15), depth, patterns. Interviews, ethnography, qual usability, diary.
- **Quant** → large n (≥20 for usability with stats; ≥100 for surveys with directional reads), statistics, distributions. Surveys, A/B, analytics, quant usability.

This narrows to one or two methods. See `references/sample-sizes.md` for the full N-by-method table.

---

## Forcing-axes output

The intersection of axes 1–3 produces a method shortlist of 1–3 candidates. Example shortlists:

- *Exploring + attitudinal + qual* → 1:1 interviews, focus groups, diary studies
- *Exploring + behavioral + qual* → ethnography, contextual inquiry, observational research
- *Validating + behavioral + qual* → qual usability testing (n=5–8)
- *Validating + attitudinal + quant* → preference testing, surveys
- *Validating + behavioral + quant* → A/B testing, quant usability (n≥20), tree testing

If the shortlist is empty, one of the three forcing-axis answers is wrong. Re-answer before proceeding.

---

## Tiebreakers (apply within the forcing-axes shortlist)

### T1 — Decision type

From UI's `when-to-do-ux-research`, adapting NN/g's 4-bucket framework. Use to confirm the shortlist fits the kind of decision being made:

| Decision type | Method shortlist |
|---|---|
| **Vision** | Observations, diary studies, literature reviews, focus groups, competitive analysis, card sorting, 1:1 interviews |
| **Strategy** | Surveys, continuous discovery interviews, analytics, clickstream analysis, focus groups, competitive analysis |
| **Definition** | Usability testing, preference testing, 1:1 interviews, A/B testing, card sorting, clickstream analysis |
| **Evaluation** | A/B testing, clickstream analysis, data analytics, preference testing |

Vision and Strategy lean generative; Definition and Evaluation lean evaluative. If the shortlist from the forcing axes doesn't intersect the decision-type shortlist, re-check Axis 1.

### T2 — Product-cycle stage

| Stage | Method category | Examples |
|---|---|---|
| **Discovery (pre-prototype)** | Generative | Interviews, ethnography, diary studies, focus groups, stakeholder interviews, task analysis |
| **Concept Validation / Testing** | Evaluative | Qual usability, A/B, first-click, card sort/tree testing, preference testing, accessibility testing |
| **Ongoing listening** | Continuous | Feedback surveys, analytics, support tickets, NPS, customer success notes |

If the team is mid-discovery, an evaluative method will lock them into what's already in front of them. If the team is mid-validation, a generative method will produce broad insights that don't answer the testing question.

### T3 — Field Guide question-type (sanity check against Axis 3)

| Question type | Method type |
|---|---|
| **"Why" / "How"** | Qualitative |
| **"How much" / "How many" / "How often"** | Quantitative |
| **"Who are our users" / "What should we build"** | Generative |
| **"Which design" / "Is this intuitive" / "What could be better"** | Evaluative |

If a single question spans multiple types ("Why do users churn AND how many do?"), it's two questions — split them and route each to its method. Use this as a sanity check against the qual/quant answer from Forcing Axis 3.

### T4 — Pejman's decision-intent

From `driving-action-from-research-insights-pejman-babaei`. Use when the team can name the decision intent precisely:

| Decision intent | Method orientation |
|---|---|
| **Exploratory ideation** | Generative qual: interviews, ethnography, diary, focus groups |
| **Alternative selection** | Comparative evaluative: A/B, preference testing, conjoint, side-by-side usability |
| **Design-intent assessment** | Targeted evaluative: usability, first-click, tree testing, accessibility |

### T5 — Budget / timeline floor

UI's published default for low-budget / fast research:

> *"a round of user interviews and a round of usability testing, each with about 5 participants."*

**n=5 is the floor** for both interviews and usability tests. Below 5, signal is too noisy to drive decisions. Above 5, you're in the standard zone — bump to 8 if the audience is heterogeneous or the decision is high-stakes. For quantitative work, see `references/sample-sizes.md`.

Timeline constraints bound the shortlist:

- **Express timelines (1–3 days)** bound to AI-moderated interview, unmoderated usability, in-product survey, and async-short-diary. Other methods are not viable on this timeline. Express also requires that the foundational fields (Why / What / Stakeholders / Research subjects) are already clear and the decision is binary or short-list. See `references/patterns/contexts/rapid-cadence.md`.
- **Rapid (1–2 weeks)** — applies the 15-day per-day cadence; methods bounded to the tactical shortlist (T6). See `references/patterns/contexts/rapid-cadence.md`.
- **Standard (3–6 weeks)** and **In-depth (6+ weeks)** — full method shortlist available.

If a team wants Express but the question is exploratory or the audience needs defensible quant anchors, fall back to Rapid or longer. Express produces directional signal only.

### T6 — Strategic vs. tactical

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

---

## Solo-stakeholder caveat

If the brief's *Stakeholders* field reads "just me" — the user is the sole consumer of the insights — skip the "what evidence will be compelling to the stakeholders" lens entirely. There's no downstream audience to convince; the user is the producer and the consumer of the work.

When this caveat applies:

- The qual vs. quant tradeoff collapses to: *what evidence do you need to make this call?* Often that's qual depth at a small n, because the goal isn't social proof.
- The readout / deliverable shape is whatever the user needs for their own thinking — notes, a one-page summary, a tagged transcript. The brief's *Deliverables* field should be sized accordingly, not inflated for an imagined audience.
- The audience-evidence-compelling axis is *skipped*. Don't substitute a synthetic audience ("my future self" / "a hypothetical reviewer") — if it's just the user, say so and move on.

Do not push the user away from "just me" by trying to surface stakeholders they didn't name. Many small, defensible studies have no downstream audience. The skill respects this shape.

---

## Worked example

**Question:** *"Do enterprise admins prefer the new role-based-access UI or the old one?"*

- **Axis 1 (generative or evaluative?):** Evaluative — we're picking between two alternatives, not exploring.
- **Axis 2 (attitudinal or behavioral?):** Could be either. Stated preference is attitudinal; observed task-completion is behavioral. **This is the genuine choice the team must make.**
  - If we want self-reported preference + stated reasons: surveys or preference tests.
  - If we want observed task-completion + success rates: usability tests.
  - Many teams want both; do them sequentially, not in one study.
- **Axis 3 (qual or quant?):** Depends on Axis 2 answer. If attitudinal/preference → quant (n≥30 for directional, ≥100 for confidence). If behavioral/usability → qual (n=5–8 catches 85% of issues per NN/g).

**Forcing axes result:** Either (a) quant preference test (n=30–100) for stated preference, or (b) qual usability test (n=5–8) for observed task-completion. The team has to pick one — they're different studies.

**Tiebreakers:**
- T1 (decision type): Evaluation. Both methods fit.
- T2 (stage): Validation. Both fit.
- T5 (budget): Qual usability is cheaper. Quant preference is faster.
- T6 (strategic/tactical): Tactical. Both fit.

**Recommendation:** Lead with qual usability (n=8) for the task-completion side; if attitudinal preference signal is also needed, follow with a quick survey to the broader admin base. The forcing axes made the genuine choice visible: stated-preference vs. observed-behavior is a real fork.

---

## Output

Method selection produces:

1. **One primary method** with a one-paragraph rationale tying it to the question + decision + stage.
2. **Sample size** with rationale (`references/sample-sizes.md` for the table).
3. **Role of AI** if AI is involved — input, pressure-test, or never substitute (see `references/anti-patterns.md`).
4. **Moderation type** — human, AI, or unmoderated.

These fill the "How" and "Who" sections of `assets/default-brief.md`.

---

## Trigger rule

**If the resulting method is interview-style** (1:1 interviews, generative interviews, customer discovery interviews, jobs-to-be-done interviews, or any moderated qualitative conversation), **also run the AI-moderation-fit check from `references/patterns/methods/ai-moderation-fit.md`.**

That check determines whether the interviews should be human-moderated, AI-moderated, or hybrid — and produces the additional brief sections (per-question probing instructions, pressure-test step, active-monitoring plan) that AI-moderated studies require.
