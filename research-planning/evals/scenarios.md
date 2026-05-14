# Research Planner Sub-Agent — Eval Scenarios

A re-runnable scenario suite for the `research-planner` sub-agent
(`research-planning/agents/research-planner.md`). Each scenario probes a specific axis
of the 11-step workflow. Scoring lives in [`rubric.md`](./rubric.md); run-execution
guidance lives in [`README.md`](./README.md); the runner prompt template lives in
[`runner-template.md`](./runner-template.md).

The original 7 hand-crafted scenarios (S01–S07) are preserved as the regression
baseline. S08–S24 expand coverage across project types, pre-flight failure modes,
methodology selection, AI involvement, audience types, constraints, and blended
multi-pattern asks.

---

## Scenarios

### S01 — Well-formed usability-test question

**Input:** "Do users find the checkout flow confusing on our new prototype?"

**Dimensions tested:** methodology=usability-test, pattern=usability-testing, well-formed-question

**Expected behavior:**
- Pre-flight passes (clear decision, real users implied, no AI substitution)
- Asks for Why/What/Who one at a time (does not infer)
- Methodology: usability test selected with explicit rationale
- Pattern recognition fires `usability-testing.md`
- Brief drafts with default 6-field structure; sample size defaults n=5
- Handoff appendix included

**Pass criteria:** asks for Why/What/Who before drafting; method = usability test with rationale; pattern `usability-testing.md` named in footer; 6-field brief complete; no plumbing language leaks.

---

### S02 — Malformed / vague question

**Input:** "Let's just talk to some users about our product"

**Dimensions tested:** question-refinement, pre-flight=no-decision, method-first-anti-pattern

**Expected behavior:**
- Pre-flight likely fails on "no clear decision" + "method-first framing"
- Sub-agent does NOT draft a brief
- Asks for the decision this would unblock; surfaces 2–3 candidate rewrites that pass specific/actionable/practical
- Returns to Step 2 (Why/What/Who) once a decision is named

**Pass criteria:** no brief drafted; rewrites surfaced; question refinement loop entered.

---

### S03 — Pre-flight gate failure (decision already made)

**Input:** "Should we add dark mode? The CEO already decided yes, but I want to validate the decision with research."

**Dimensions tested:** pre-flight=decision-made, pre-flight=political, anti-pattern=validation-framing

**Expected behavior:**
- Pre-flight fails on "decision already made" + "research-as-weapon / validation framing"
- Refuses to draft a brief
- Quotes the specific gate concern in user-facing language (without naming "the gate")
- Recommends alternative: scope to evaluative implementation testing OR post-launch measurement

**Pass criteria:** no validation brief produced; refusal cites the concern in plain language; redirect offered; no plumbing language ("the gate," "pre-flight check") leaks.

---

### S04 — AI-moderation toward AI

**Input:** "We want to test 5 ad variants with our existing customer panel, 200+ participants across 4 languages."

**Dimensions tested:** methodology=concept-test, ai-moderation=AI, scale, multilingual

**Expected behavior:**
- Pre-flight passes
- Methodology: ad/messaging testing (concept-test variant)
- AI-moderation-fit check fires (interview-style); rubric favors AI (standardized guide, predefined probing, scale, multilingual)
- Recommends AI moderation
- Brief deltas: probe instructions, pre-interview prep, variable-length flag, mandatory pressure-test step

**Pass criteria:** AI moderation recommended; rubric reasons cited; pressure-test step appears in brief.

---

### S05 — AI-moderation toward human

**Input:** "We need to understand how rare-disease patients navigate complex insurance decisions for treatments they can't easily access."

**Dimensions tested:** methodology=discovery-interview, ai-moderation=human, niche-population, sensitive-topic

**Expected behavior:**
- Pre-flight passes
- Methodology: discovery interviews
- AI-moderation-fit rubric favors human: unknown-unknowns, behavioral observation needed, deep jargon, high-stakes judgment, sensitivity, niche population
- Recommends HUMAN moderation; cites ≥3 of 5 rubric checks

**Pass criteria:** human moderation recommended; rubric reasons cited; sensitivity flagged in Who section.

---

### S06 — Blended rapid + survey

**Input:** "We need a quick read on whether our pricing page is confusing — within 2 weeks."

**Dimensions tested:** context=rapid-cadence, methodology=survey, multi-pattern

**Expected behavior:**
- Pre-flight passes
- Methodology: survey OR unmoderated usability test
- Patterns fire: `rapid-cadence.md` + `survey.md` (or `usability-testing.md`)
- Brief shows per-day timeline (rapid-cadence pattern) + method specifics
- Methods bounded to tactical (no longitudinal, no in-depth in-person)

**Pass criteria:** multi-pattern footer; 2-week timeline structure; tactical methods only.

---

### S07 — AI-misuse reframing

**Input:** "Let's just use synthetic users to validate our new product concept before we recruit real participants."

**Dimensions tested:** pre-flight=ai-substitute, anti-pattern=synthetic-primary-evidence, reframing

**Expected behavior:**
- Pre-flight catches "AI as substitute"
- Sub-agent reframes (does NOT refuse outright)
- Surfaces split: synthetic for guide pressure-test, real participants for concept-test findings
- Brief (if drafted) has Role-of-AI = "pressure-test" not "substitute"

**Pass criteria:** reframes rather than complies; offers split; Role-of-AI labeled correctly.

---

### S08 — PMF discovery (early-stage founder)

**Input:** "I'm pre-launch on a B2B tool for ops teams. I want to know if anyone actually feels the pain I think they feel."

**Dimensions tested:** project-type=PMF, methodology=discovery-interview, audience=founder

**Expected behavior:**
- Pre-flight passes
- Asks Why/What/Who; Who = ops leaders at SMB or mid-market companies
- Methodology: generative discovery interviews (n=8–10 per `sample-sizes.md`)
- Pattern `discovery-interview.md` fires; consider AI-moderation-fit (likely human for first PMF round)
- Brief calls out: anti-leading-question, signal of pain ≠ signal of willingness to pay

**Pass criteria:** discovery interviews recommended; brief surfaces pain-vs-WTP distinction; counterfactual ("what if we don't talk to ops leaders") is named.

---

### S09 — Existing-product redesign (evaluative)

**Input:** "We're redesigning our analytics dashboard. Want to figure out which of two information architectures works better for power users."

**Dimensions tested:** project-type=redesign, methodology=card-sort-or-tree-test, audience=designers

**Expected behavior:**
- Pre-flight passes
- Methodology: tree test or first-click test or comparative usability (evaluative, alternative-selection per Pejman)
- Possibly card-sort as upstream input
- Pattern `usability-testing.md` fires
- Sample size: n=15–30 for tree test (quant signal), or n=5–8 per IA for comparative usability

**Pass criteria:** comparative method recommended with rationale tied to alternative-selection decision-intent; appropriate sample size cited.

---

### S10 — Ongoing discovery cadence

**Input:** "I want to set up a continuous discovery program for my PM team — weekly conversations with customers."

**Dimensions tested:** project-type=continuous, methodology=discovery-interview, cadence

**Expected behavior:**
- Pre-flight passes
- Sub-agent asks Why/What/Who; surfaces that "continuous discovery" is a cadence, not a single study — what's the decision the first month will unblock?
- Methodology: discovery interviews, recurring 2–3/week
- Brief recommends Teresa Torres' opportunity-solution-tree framing OR equivalent ongoing-cadence scaffold
- Pattern `discovery-interview.md` + (potentially) a continuous-cadence context pattern

**Pass criteria:** asks for first-month decision; doesn't draft a one-off brief; cadence + sourcing handled.

---

### S11 — Exploratory ethnographic

**Input:** "We want to understand how warehouse workers actually use our handheld scanners on the floor — not what they tell us in surveys."

**Dimensions tested:** project-type=exploratory, methodology=contextual-inquiry/ethnographic, audience=mixed

**Expected behavior:**
- Pre-flight passes
- Methodology: contextual inquiry / on-site observation (generative, exploratory)
- Pattern `discovery-interview.md` adapted for in-context observation
- Brief surfaces: stated-vs-revealed-behavior gap, observation protocols, consent for floor recording
- Human moderation (behavioral observation = AI-mod-fit fails)

**Pass criteria:** observational method recommended; stated-vs-revealed-behavior gap surfaced; human moderation cited via AI-mod-fit rubric.

---

### S12 — Evaluative concept test

**Input:** "We have three rough concepts for a new onboarding flow. Which one resonates most with new signups?"

**Dimensions tested:** project-type=evaluative, methodology=concept-test, decision=alternative-selection

**Expected behavior:**
- Pre-flight passes
- Methodology: concept test (evaluative, alternative-selection)
- Sample size n=15–20 for qual concept test; or quant survey-based test at higher n
- AI-mod-fit: standardized stimulus + predefined probing — likely AI moderation viable
- Brief warns against treating self-reported preference as predictive of behavior

**Pass criteria:** concept test recommended; preference-vs-behavior caveat surfaced; AI-mod-fit consulted.

---

### S13 — Longitudinal diary study

**Input:** "We want to understand how new managers adopt our coaching app over their first 30 days."

**Dimensions tested:** project-type=longitudinal, methodology=diary-study, timeline=long

**Expected behavior:**
- Pre-flight passes
- Methodology: diary study with bookend interviews
- Sample n=8–12; high attrition buffer
- Pattern `discovery-interview.md` partially applies; longitudinal cadence emphasized
- Brief includes attrition handling, prompt cadence, incentive structure for sustained engagement

**Pass criteria:** diary study recommended; attrition buffer + incentive structure surfaced; human moderation for bookends.

---

### S14 — Early-adopter recruit (niche population)

**Input:** "I need to talk to people who've used 3+ AI coding agents in the last 6 months — what makes them switch?"

**Dimensions tested:** project-type=discovery, recruit-criteria=niche, methodology=discovery-interview

**Expected behavior:**
- Pre-flight passes
- Methodology: discovery interviews
- Sample n=6–8 (niche population, smaller floor acceptable per `sample-sizes.md`)
- Brief surfaces: explicit recruit criteria, screener questions to verify 3+ tools, no-overlapping-range warning for "6 months"
- Human moderation (jargon + judgment about tradeoffs)

**Pass criteria:** explicit recruit criteria stated; screener no-overlap-warning surfaced; smaller n justified by niche population.

---

### S15 — Pre-flight: Google-answerable

**Input:** "Should our SaaS pricing be monthly or annual? What's the industry standard?"

**Dimensions tested:** pre-flight=secondary-research-available, refuse-or-redirect

**Expected behavior:**
- Pre-flight fails on "can analytics, secondary research, or existing data answer this?"
- Sub-agent does NOT draft a brief
- Redirects: do desk research first (industry benchmarks, competitor pricing) before talking to users
- Offers: if AFTER desk research a user-research question remains (e.g., "which billing cycle reduces churn for our segment"), come back

**Pass criteria:** no brief produced; secondary research recommended; future-state user-research question scoped IF they come back.

---

### S16 — Pre-flight: yes/no question

**Input:** "Will users like our new color scheme?"

**Dimensions tested:** pre-flight=yes-no-question, question-refinement

**Expected behavior:**
- Pre-flight flags "yes/no question"
- Sub-agent surfaces rewrites: "How do users describe their first impression of the new color scheme?" / "What associations do users form with the new palette in 5 seconds?"
- Question-refinement loop; no brief on the malformed question

**Pass criteria:** rewrites offered; no brief drafted on yes/no input.

---

### S17 — Pre-flight: been-done

**Input:** "I want to research what makes a great onboarding experience for SaaS products."

**Dimensions tested:** pre-flight=been-done-before, secondary-research-redirect

**Expected behavior:**
- Pre-flight flags "this has been researched extensively in published literature"
- Sub-agent redirects: read NN/g, Pendo benchmarks, Reforge — then come back with a specific question about YOUR onboarding
- If user pushes back ("but for my product"), proceeds to scope a study around the specific app's gaps

**Pass criteria:** desk-research redirect offered first; if user persists, narrows scope to their product-specific question.

---

### S18 — Pre-flight: no agency to act

**Input:** "My manager wants me to research mobile checkout, but the mobile team won't change anything until next year."

**Dimensions tested:** pre-flight=no-agency, expiration-date

**Expected behavior:**
- Pre-flight flags "team lacks agency to act on findings" + "insights have an expiration date by next year"
- Sub-agent surfaces both concerns; recommends:
  - Either: defer research to align with mobile team's actual planning window
  - Or: scope research to insights that survive a year (deep generative work on mobile-checkout behavior, not specific design feedback)
- Does NOT draft a brief without acknowledging the agency gap

**Pass criteria:** no-agency + expiration concerns surfaced; redirect or scoped alternative offered; if drafted, brief acknowledges the constraint.

---

### S19 — Pre-flight: political weaponization

**Input:** "I need data to convince leadership my project is worth funding. Can you help me design research?"

**Dimensions tested:** pre-flight=political, anti-pattern=validation-framing

**Expected behavior:**
- Pre-flight flags "research weaponized for political buy-in"
- Sub-agent reframes: research can only honestly tell you whether the project is worth funding — not pre-determined to support that conclusion
- Asks: are you genuinely uncertain whether this project should be funded? Or is the decision made and you want evidence?
- If genuinely uncertain → proceeds; if pre-committed → refuses

**Pass criteria:** reframes from "convince" to "investigate"; refuses if pre-committed; proceeds if genuine uncertainty.

---

### S20 — Pre-flight: rapid expiration date (Sbrocca)

**Input:** "We're launching the campaign in 3 days. Can we do quick user research before launch?"

**Dimensions tested:** pre-flight=expiration-date, context=rapid-cadence

**Expected behavior:**
- Pre-flight flags Sbrocca's expiration-date concern: 3 days is too short for even rapid research with meaningful insight
- Sub-agent redirects: post-launch measurement + iterate; or if a single high-confidence question, 1–2 user calls for sanity-check
- Does NOT draft a 3-day rapid research brief

**Pass criteria:** refuses 3-day timeline; offers post-launch alternative or scoped sanity-check.

---

### S21 — Survey with sample-size-determined-by-decision

**Input:** "We need to quantify what % of our enterprise customers care about SSO before we prioritize building it."

**Dimensions tested:** methodology=survey, audience=PMs, decision=prioritization

**Expected behavior:**
- Pre-flight passes (clear decision: build SSO or not)
- Methodology: survey of enterprise customers
- Sample size: large enough for statistical signal (n=100+ depending on population); per `sample-sizes.md` survey norms
- Brief surfaces: response bias risk, screener for actual enterprise vs. self-identification, possibly pair with 3–5 qual interviews on the "why" behind the %

**Pass criteria:** survey + qual-pairing surfaced; statistical-power sample size recommended; response-bias caveat in brief.

---

### S22 — A/B test scoping (evaluative, quant)

**Input:** "We want to A/B test two homepage hero variants. Which version drives more signups?"

**Dimensions tested:** methodology=ab-test, decision=evaluative-quant, analytics-first

**Expected behavior:**
- Pre-flight passes BUT sub-agent flags: A/B tests are analytics work, not user research per se
- Methodology: A/B test with appropriate power calculation
- Sub-agent surfaces: this is product analytics; user research can answer "why one wins" but not "which wins"
- If user wants qual layer, recommends post-test interviews with both arms

**Pass criteria:** routes to analytics-first; if user-research brief drafted, scoped to "why," not "which"; no brief masquerading as A/B test design.

---

### S23 — Card sort + tree test (information architecture)

**Input:** "We're reorganizing our help center. Want to figure out how users mentally group our 200 articles."

**Dimensions tested:** methodology=card-sort, project-type=IA-redesign, audience=designers

**Expected behavior:**
- Pre-flight passes
- Methodology: open card sort (generative) → closed card sort or tree test (evaluative) as a 2-phase study
- Sample: n=15–30 for card sort (per `sample-sizes.md`)
- Pattern `usability-testing.md` partially applies; consider a card-sort-specific pattern
- Brief surfaces: card-sort tooling (Optimal Workshop, Maze), 200 articles needs grouping pre-sort

**Pass criteria:** 2-phase IA method recommended; sample size cited; tooling named.

---

### S24 — Executive audience (insight consumer)

**Input:** "Our CEO wants to know if we should expand into the German market. What research should we do?"

**Dimensions tested:** audience=executive, decision=strategic, methodology=mixed

**Expected behavior:**
- Pre-flight passes
- Methodology: mixed — market sizing (secondary) + 8–12 generative interviews with target buyers in Germany + competitor analysis
- Brief surfaces: Who-audience = CEO/exec, so evidence shape matters (numbers + 2–3 vivid customer quotes, not 40 pages of synthesis)
- Recommends executive read-out format (1-pager + appendix)

**Pass criteria:** mixed-method recommended; brief tailored to exec evidence preferences; deliverable format named (1-pager).

---

### S25 — Multi-pattern: PMF + AI-pressure-test

**Input:** "I'm doing PMF discovery interviews for a B2B AI product. I want to use synthetic users to pressure-test my guide first, then talk to 10 real ops leaders."

**Dimensions tested:** project-type=PMF, methodology=discovery-interview, ai-involvement=pressure-test, multi-pattern

**Expected behavior:**
- Pre-flight passes (AI used correctly as pressure-test, not substitute)
- Methodology: generative discovery interviews, n=10
- Pattern `discovery-interview.md` + `ai-augmented-research.md` (pressure-test role)
- Brief: explicit Role-of-AI = "pressure-test the guide" (with mechanics); real participants for findings
- Surfaces: separate synthetic results from real-user findings (no mixing)

**Pass criteria:** AI used as pressure-test (not substitute); brief labels Role-of-AI correctly; separation between synthetic + real surfaced; multi-pattern footer.

---

## Per-scenario dimension map

| ID  | Project type      | Pre-flight        | Method                 | AI involvement     | Audience      | Constraint        |
|-----|-------------------|-------------------|------------------------|--------------------|---------------|-------------------|
| S01 | redesign          | pass              | usability-test         | none               | mixed         | —                 |
| S02 | unspecified       | fail-no-decision  | (refinement loop)      | none               | unclear       | —                 |
| S03 | redesign          | fail-decision-made| (refused)              | none               | mixed         | —                 |
| S04 | evaluative        | pass              | concept-test           | AI moderation      | mixed         | multilingual,scale|
| S05 | discovery         | pass              | discovery-interview    | human moderation   | mixed         | niche,sensitive   |
| S06 | evaluative        | pass              | survey                 | none               | PM            | rapid             |
| S07 | exploratory       | fail-ai-substitute| (reframed)             | reframe-to-pressure| mixed         | —                 |
| S08 | PMF               | pass              | discovery-interview    | none               | founder       | —                 |
| S09 | redesign          | pass              | tree-test/comparative  | none               | designer      | —                 |
| S10 | continuous        | pass              | discovery-interview    | none               | PM            | cadence           |
| S11 | exploratory       | pass              | ethnographic           | human (behavioral) | mixed         | on-site           |
| S12 | evaluative        | pass              | concept-test           | AI viable          | designer/PM   | —                 |
| S13 | longitudinal      | pass              | diary-study            | human bookends     | PM            | long-timeline     |
| S14 | discovery         | pass              | discovery-interview    | human              | PM            | niche             |
| S15 | strategy          | fail-secondary    | (refused/redirected)   | none               | exec          | —                 |
| S16 | evaluative        | fail-yes-no       | (refinement loop)      | none               | designer      | —                 |
| S17 | discovery         | fail-been-done    | (refused/redirected)   | none               | PM            | —                 |
| S18 | discovery         | fail-no-agency    | (redirected)           | none               | PM            | —                 |
| S19 | varies            | fail-political    | (reframed/refused)     | none               | PM            | —                 |
| S20 | evaluative        | fail-expiration   | (refused)              | none               | PM            | hyper-rapid       |
| S21 | strategy          | pass              | survey+qual            | none               | PM            | regulated-adj     |
| S22 | evaluative        | pass-w-flag       | A/B+qual               | none               | PM            | analytics-first   |
| S23 | redesign-IA       | pass              | card-sort+tree-test    | none               | designer      | —                 |
| S24 | strategy          | pass              | mixed-method           | none               | executive     | strategic         |
| S25 | PMF               | pass              | discovery-interview    | pressure-test      | founder       | —                 |

---

## Maintenance

When the sub-agent gains a new responsibility, add a scenario that targets it. Keep
S01–S07 as the regression baseline — they predate this expansion. Tag each new
scenario with its dimensions so coverage gaps are easy to spot.
