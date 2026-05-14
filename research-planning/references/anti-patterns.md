# Anti-Patterns Checklist

## Purpose

A pre-flight scan over the brief draft. Catch the common ways research goes wrong *before* fielding. Three categories: universal (apply to all research), AI-specific (apply when AI is involved in any role), and Field Guide additions (UI's own polished warnings).

## When to use

After drafting the brief, before handing it off. Walk the checklist top-to-bottom. Each anti-pattern is named, explained in one line, and quoted from the source where applicable. If the brief trips any anti-pattern, fix it or call it out explicitly in the brief.

---

## Universal anti-patterns

### Method-first thinking

Picking the method before sharpening the question. Method is a derived output of the question, not a starting point.

> *"If you jump directly to methodology, you may end up stunting your study before it's even started."* (UI corpus)

### Validation framing

Running research to confirm a pre-formed conclusion. The findings will be biased toward agreement.

> *"Don't validate; instead investigate."* (Raluca Budiu via UI strategy guide)

### Leading questions

Wording that signals the desired answer.

> *"Telling people what you want them to say increases the likelihood that they'll say it (whether or not it's true)."* (UI corpus)

### Throwaway research

Fielding a study with no plan to act on the findings. The readout deck becomes the artifact; nothing changes downstream.

> *"Too many teams treat the readout deck like the final step in a research project, but the deck is only useful if it helps someone do something."* (Nikki Anderson)

### "Get to know our customers" too vague

A topic, not a research question. No decision attached, no actionable scope. Always rewrite to a specific question tied to a decision.

### Research-as-weapon

Running research to prove a point or win an argument.

> *"research as a weapon... they're conducting user research or wanting to conduct user research, to mask it as a way to prove a point or to validate, you know, one direction or another is just wrong."* (Michele Ronsen)

### Method-familiarity bias

Picking the method you know best instead of the method the question calls for. Symptom: every study from this team is an interview study, regardless of whether the question is generative or evaluative.

### Scope creep mid-flight

Adding research questions, expanding the recruit, or extending the timeline once fielding has started. Either the original scope was wrong (pause and re-scope) or the additions belong in a follow-up study.

---

## AI-specific anti-patterns

### AI-first scoping

Letting an LLM scope the question, define the audience, or generate findings before any human contact. Every brief should be rooted in a real decision and real users — AI is a tool for sharpening, not a substitute for thinking.

### Synthetic users as primary evidence

Treating LLM-generated personas as the data the brief produces. Synthetic users are individually believable but collectively wrong.

> *"Synthetic Users without calibration are individually believable, but collectively wrong."* (Synthetic Users vendor, in their own concession)

Empirically demonstrated failure mode: NN/g's tree-testing study found synthetic users *"claimed completion of all courses"* while real users completed only 3 of 7.

### Unlabeled AI/real mixing

Combining AI-generated and real-user data in a single readout without labeling which is which. Stakeholders read it as one corpus. The synthetic half contaminates the real half.

### Hypothesis laundering

Treating AI-generated hypotheses as findings without a real-user validation step. The hypothesis was a guess; calling it a finding doesn't make it one.

### Convenience substitution

Choosing synthetic users (or AI moderation, or analytics-only) because real recruiting feels slow, when the decision actually warrants real recruiting. Symptom: *"we don't have time to recruit"* on a decision the team will live with for the next 18 months.

### Niche-population synthetic users

Using LLMs to simulate populations underrepresented in training data — accessibility users, specialized professional roles, narrow demographic segments. The model will confidently hallucinate. Real recruits only for niche populations.

### AI without pressure-test

Scaling an AI-moderated study without first piloting the discussion guide.

> *"poor questions now scale across hundreds of participants automatically."* (UI AI Moderation Guide framing)

Pressure-test on yourself, a teammate, and a synthetic user, then pilot with a few real participants before scaling.

### AI without active monitoring

Treating AI moderation as set-it-and-forget-it. Quality drift, off-topic conversations, and hallucinated probes happen in flight. Name an owner who reviews response quality on a defined cadence.

---

## Field Guide additions

### Validation vs. learn

Field Guide framing: doing research to *validate* what you already believe is a different (lower-value) move than doing research to *learn*. Discovery-phase work with evaluative methods locks you into what's already in front of you.

> *"When used in the discovery phase, evaluative research methods ignore the full array of possibilities, and focus only on what's already in front of you, and what you think you already know."* (UI Field Guide / `getting-started-with-discovery-research`)

### "Set-it-and-forget-it" stakeholder communication

Telling stakeholders once at kickoff what the study will do and then disappearing until the readout. By the time you read out, the question they care about has shifted and the findings land on stale ground. Build a communication cadence into the brief.

### Overlapping numeric ranges in screeners

Screener question with ranges like "0–5 years experience / 5–10 years / 10+ years" — a participant with exactly 5 years can pick either bucket. Always use mutually exclusive ranges ("0–4 / 5–9 / 10+"). Field Guide flags this as a top screener failure mode.

### "Get to know our customers" framed as sufficient

Field Guide explicitly calls out: this isn't a goal, it's a gesture. Push for the decision the research enables before drafting a brief.

### Method-familiarity bias (Field Guide framing)

Field Guide names this as a top failure mode for teams that have run mostly one method type. The fix: re-read `references/methodology-selection.md` and let the question + decision type determine the method, not team habits.

### Over-specifying demographics when behaviors suffice

Recruiting on demographics (age, income, gender) when the relevant variable is a behavior (uses product X weekly, has churned in the last 90 days, has tried but abandoned a competitor). Behaviors recruit better participants for product research.

### Self-reporting future behavior as evidence

*"Would you pay $20/month for this?"* is a famously poor signal. People are bad at predicting their own future behavior. Use revealed-preference signals (past purchases, current use of substitutes) or run a real pricing test instead.

---

## How to use this checklist

After drafting the brief:

1. Walk the universal anti-patterns. Any hit → rewrite the brief or explicitly note the tradeoff.
2. If AI is involved in any role, walk the AI-specific anti-patterns. Any hit → either remove the AI piece or add the required safeguard (labeling, pressure-test, monitoring plan).
3. Walk the Field Guide additions. These tend to flag subtle issues that won't kill the study but will dilute findings — fix them if cheap, note them if not.
4. If multiple anti-patterns hit and they're load-bearing (validation framing + leading questions + no decision named), kick back to the pre-flight gate. The brief isn't ready.

The checklist is a discipline, not a gate — but it should reshape the brief before fielding, not just sit at the bottom of the doc.
