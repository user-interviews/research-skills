# Method pattern: AI-moderation fit check

This is the decision rubric for whether an interview-style method should be human-moderated or AI-moderated. It is not a method pattern in its own right — it modifies whichever interview-style method has been selected (discovery interview, focus group, usability test, concept test, etc.).

**Default to human moderation.** The fit check exists to surface the conditions under which AI moderation is a credible alternative, not to push toward AI by default. Sources: NN/g, User Interviews' own AI Moderation Guide, Strella, Outset. UI's first-party position is the voice anchor.

## When this pattern applies

Apply this rubric whenever the methodology selection produces an interview-style method:

- Discovery interviews (1:1 generative)
- Focus groups
- Usability tests (moderated)
- Concept tests
- Customer feedback / journey interviews
- Ad or messaging testing interviews
- Competitive analysis interviews (blinded)

If the selected method is a survey, analytics review, A/B test, diary study, or anything else non-interview-shaped, this pattern does not apply — skip the fit check.

The sub-agent generating the brief MUST run this check before finalizing a brief for any interview-style method. The check has three outputs:

1. **Human-moderated** (default). Skip the AI-specific brief deltas; generate the standard brief.
2. **AI-moderated, conditions met.** Apply the brief deltas listed under "What it adds to the brief" below.
3. **Don't run this study yet** — the question fails the rubric (e.g., genuine unknown-unknowns, no pressure-tested guide, niche population). The fit check returns a redirect, not a method.

## The 5-step decision rubric

Run these in order. Any "→ human" answer settles the question — human moderation is the default and the check stops there. AI moderation requires all five conditions to favor it.

### Step 1 — Is the problem space well-mapped?

- **Unknown-unknowns / early discovery / new product space → human.** The whole point of discovery in a poorly-mapped space is that the moderator doesn't yet know what to probe. AI moderators can't follow surprising threads they weren't briefed on.
- **Predefined questions and outcomes → AI candidate.** When the team already knows the answer shape — usability success/failure, concept reaction, NPS driver categories — AI can run the conversation reliably.

UI's own framing: *"For unknown-unknowns stages, it might be better to use human moderators familiar with the market, industry, and product."*

### Step 2 — Can probing logic be predefined?

- **Variable follow-ups, where the best probe depends heavily on what each person reveals → human.** Discovery work especially. The follow-up to "tell me about the last time you onboarded a teammate" depends entirely on what story the participant tells.
- **Fixed "probe a little / probe more" per question is sufficient → AI.** When the team can write per-question probe instructions in advance — and the probe variance across participants is narrow — AI can execute them faithfully.

### Step 3 — Does the study need behavioral observation, deep jargon handling, or high-stakes judgment?

Any "yes" here → **human.**

- **Behavioral observation.** Watching what the participant does — screen-share, artifact walkthrough, hesitation, confusion, body language. AI moderators can't observe behavior; they receive text or voice and respond to it.
- **Deep jargon or domain language.** Specialized terminology (clinical, financial, legal, engineering) where missing a single term derails the conversation. NN/g: AI moderators "may miss important details" with specialized vocabulary. Add a glossary and AI can sometimes manage; without one, default human.
- **High-stakes judgment.** Sensitive topics where a moderator's read on the participant's emotional state matters; high-consequence decisions (regulatory, clinical, financial) where a missed nuance is a real cost. NN/g: AI is not suited to "high-stakes decisions."

### Step 4 — Does scale, reach, or sensitivity favor AI?

This is where AI's actual advantages live.

- **Scale.** Hundreds of interviews where human moderation isn't feasible.
- **Reach.** Multilingual coverage, time-zone coverage, hard-to-reach participants who can self-schedule any hour. UI: *"AI moderation puts customers in charge."*
- **Sensitivity.** Some sensitive topics (health behaviors, financial struggles, embarrassing usage patterns) get more honest responses with an AI moderator. Participants report feeling "less judged."
- **Qual researcher + quant stakeholder.** UI's framing: *"pairs nuance and texture with quantity."* When the stakeholder will only act on numbers, AI-moderated qual at scale can produce both.

### Step 5 — Have you pressure-tested the guide?

**Required before scaling.** No exceptions.

- Test the guide yourself first. Run through it as if you were a participant.
- Run it past a teammate.
- Optionally, run it against a synthetic user as a pre-flight check (acceptable use of synthetic users; see `references/ai-research-context.md`).
- Pilot with a few real participants before scaling to the full sample.

The risk this step mitigates: *"poor questions now scale across hundreds of participants automatically."* A bad guide on a human moderator returns 15 bad interviews. A bad guide on AI returns 500.

If the team can't or won't pressure-test the guide, AI moderation is not a fit regardless of what steps 1–4 said.

## The 7 validated AI use cases (Strella)

When all five steps favor AI, these are the use cases with the strongest track record:

1. **Concept tests** — predefined concept descriptions, predefined reaction categories.
2. **Customer purchase journey research** — well-mapped buying-cycle stages.
3. **Ad / messaging testing** — predefined creative variants, predefined response dimensions.
4. **Customer feedback** — NPS, satisfaction, recent-experience deep-dives where the response shape is known.
5. **Usability tests on wireframes, prototypes, or live products** — task scenarios with predefined success criteria.
6. **Blinded competitive analysis** — predefined comparison dimensions, no need for facilitator improvisation.
7. **General discovery at scale** — when the problem space is *well-mapped* (not genuine discovery) and the team wants breadth.

If the selected method doesn't match one of these, that's not a blocker, but it should raise the bar on the rubric. The use case should at least be structurally similar to one of the seven.

## What it adds to the brief (AI-moderated deltas)

When the fit check returns "AI-moderated, conditions met," apply these deltas on top of the standard brief for the selected method:

### Methodology section

- **Per-question probe instructions, explicit.** For each question in the guide, write the probe rule:
  - `probe: none` — single response, move on.
  - `probe: a little` — one follow-up if the response is thin or vague.
  - `probe: more` — up to two follow-ups, looking for the underlying reason or example.
  This is the AI moderator's improvisation budget — it must be written, not implied.
- **Shorter guide.** Cut ~2 questions vs. a human-moderated version of the same study. Fatigue management is harder when there's no moderator pacing the conversation. UI guidance.
- **Mixed-format prompts.** Mix open-ended with closed-ends and rich-media prompts (image reactions, video clips, screenshots). Diversifies the cognitive load and keeps engagement.
- **Explicit warm-up and wind-down.** The AI moderator needs them scripted; they don't emerge organically.
- **Glossary for jargon-bearing studies.** If the participant audience uses specialized terminology (clinical, financial, regulatory, engineering), include a glossary that grounds the AI moderator's interpretation of common terms. Without it, AI moderation in jargon-heavy studies is high-risk.

### Participants section

- **Pre-interview prep instructions.** "Before the session, make sure you have your [account settings / dashboard / inbox] page open." Pre-session setup that a human moderator would handle live becomes participant homework. Spell it out.
- **Tech requirements.** Browser, mic, stable connection. Stated upfront.
- **Recruit criteria sharpening.** AI moderation flattens recruit slop in a way human moderation can absorb — a misrecruited participant in an AI-moderated study returns useless data. Tighter screening matters more, not less.

### Schedule / logistics section

- **Variable interview length flag.** NN/g observed a 13–56 minute range on the same guide across participants in AI-moderated studies. Plan for the range, not the midpoint. Communicate the upper bound to participants honestly.
- **Active monitoring cadence.** Who is watching the live response stream, on what schedule. Pulse review (first 5 responses, then every 20 thereafter) is a reasonable default. Passive review at the end is not acceptable — at the end, the data is already in.
- **Re-fielding plan if quality issues surface.** A clear path to pause, fix the guide, and re-field. The cost of a bad AI-moderated batch is high, the cost of pausing is low.

### Optional: brand / credibility section

- A short paragraph at the start of the AI moderator's script: company name, what the research is for, why their input matters. Compensates for the loss of the human moderator's natural credibility-building. Doesn't need to be long; needs to be present.

### Mandatory: pressure-test step

Document it in the brief, dated, with named owner. The pressure test happens before recruitment opens, not in parallel with it.

The pressure-test ladder:

1. **Self-test.** The researcher runs through the AI-moderated guide as if they were a participant. Catches obvious wording problems, broken branching, and prompts that the AI handles poorly.
2. **Teammate test.** A colleague who didn't write the guide runs it. Catches assumptions the author baked in unconsciously.
3. **(Optional) synthetic-user pre-flight.** A small batch of synthetic-user runs. Acceptable use of synthetic users — pressure-testing the guide is one of the four narrow defensible uses. See `references/ai-research-context.md` for the position on synthetic users.
4. **Pilot with real participants.** 3–5 real participants before scaling. Reviewed by the named owner before recruitment opens further.

If recruitment opens before pressure-test sign-off, that's a process failure to surface in the brief's risk section. The cost of a bad AI-moderated batch is high; the cost of waiting two days for pressure-test sign-off is low.

### Active-monitoring plan

The brief must name:

- **Owner.** Who watches response quality.
- **Cadence.** First N responses (e.g., 5), then every M thereafter (e.g., 20). Pulse review, not end-of-batch.
- **Quality criteria.** What "quality" looks like — responses substantive, probes triggering correctly, no participants stuck on a question, no signs of misunderstanding the prompts.
- **Escalation path.** What happens if quality drops mid-field. Pause, fix the guide, re-field — and how that gets decided.

Passive review at end of batch is not active monitoring. By the time the batch is done, the data is already in. Active monitoring is the load-bearing quality control in an AI-moderated study.

## AI-specific anti-patterns

Things to flag in the brief — or refuse outright — when AI moderation is on the table:

- **AI-moderated early discovery / unknown-unknowns.** Step 1 of the rubric blocks this. Don't draft an AI-moderated brief for genuine discovery work — surface the redirect instead. *"For unknown-unknowns stages it might be better to use human moderators"* (UI).
- **AI moderation when behavioral observation matters.** Screen-share, artifact walkthrough, watching where the participant clicks. AI moderators receive transcripts of what participants say they did, not observations of what they actually did. Different evidence.
- **Specialized jargon without glossary support.** AI moderators "may miss important details" (NN/g) with specialized terminology. If the study can't ship with a glossary that grounds the AI moderator's interpretations, route to human moderation.
- **Treating AI as a full replacement.** UI: *"AI can't do it all. You'll still need to contextualize, clarify, and combine the results into something meaningful."* AI moderation handles facilitation; humans still own the goal, the guide, the synthesis, and the decision. If the team's plan is "AI runs the study and writes the report," that's not AI moderation — that's research theater.
- **Scaling unverified guides.** Step 5 of the rubric blocks this. A poor guide on a human moderator wastes 15 sessions; a poor guide on AI wastes 500 plus credibility.
- **AI-first research design.** Letting the LLM scope the question, define the audience, or generate the findings before any human contact. The methodology selection and decision framing belong to humans; AI moderates the conversation, not the project.
- **Synthetic users as primary evidence.** Synthetic users are an acceptable input to pressure-test a guide; they are not an acceptable output substitute for real-participant research. See `references/ai-research-context.md` for the full position. *"Synthetic Users without calibration are individually believable, but collectively wrong"* (Synthetic Users vendor's own concession).
- **Unlabeled synthesis.** Mixing AI-generated and real-participant data in a single readout without distinguishing them. Stakeholders can't weigh the evidence if they can't see which is which. Every AI-generated input must be labeled as such in the synthesis.
- **Hypothesis laundering.** Treating AI-generated hypotheses as findings without a real-user validation step. The hypothesis is the start of the research, not the end of it.
- **Convenience substitution.** Choosing AI moderation because recruiting feels slow, on a decision that warrants real human recruiting. The slowness of recruiting is sometimes a signal that the audience is hard to reach — which is a reason to recruit harder, not to substitute.
- **Niche-population synthetic users.** Using LLMs to simulate underrepresented populations. The training data underrepresents them too; the simulation is hollow.
- **AI without active monitoring.** Setting and forgetting. Passive review at the end of a batch. Step 4 of the brief deltas mandates active monitoring; if there's no named owner and no cadence, the brief isn't AI-ready.

## UI's first-party position (voice anchor)

Privilege UI's voice when generating the brief. The skill's tone should match UI's published stance — pro-AI when conditions are met, clear-eyed about the limits, not breathless.

UI explicitly recommends AI moderation when:

- The interview guide is **standardized or simple**.
- There is a **clearly-defined set of outcomes and questions** — usability tests are the canonical example.
- The study needs to **reach hard-to-reach participants** — geography, time zone, schedule constraints. *"AI moderation puts customers in charge."*
- The team is a **qualitative researcher partnering with quantitative stakeholders** — AI-moderated qual at scale "pairs nuance and texture with quantity."

UI's guardrails, quoted:

> "AI can't do it all. You'll still need to contextualize, clarify, and combine the results into something meaningful."

> "The AI moderator will dutifully run through a conversation or interview guide, but it won't know your company, stakeholders, and product like you do."

> For unknown-unknowns stages: *"it might be better to use human moderators familiar with the market, industry, and product."*

> "AI isn't going anywhere, so the UX professional who takes a curiosity-first approach is most likely to succeed in the ever-automated future."

These quotes are usable verbatim in the brief when the team is on the fence — they capture the position better than synthesized paraphrase.

## Examples

**Good fit (AI-moderated, conditions met):**

A SaaS team wants to test reactions to three new pricing-page concepts across 200 mid-market prospects in three time zones. The concepts are pre-defined; the response shape is known (which resonates, why, what they'd want to know next). The team has a draft guide and can pressure-test it on five teammates by end of week.

Rubric check: well-mapped (concepts predefined) → AI candidate. Probing logic predefinable (per-concept "probe a little" rules) → AI. No behavioral observation needed → AI. Scale and time-zone reach favor AI → AI advantage. Pressure test is on the schedule → ready.

Verdict: AI-moderated. Apply brief deltas, schedule pressure test, name an active-monitoring owner.

**Bad fit (redirect to human):**

A team wants to understand why enterprise admins resist adopting a new permissions model. The team doesn't yet know which dimensions of resistance matter — political, technical, workflow, cultural — and the participants are senior IT directors using specialized terminology.

Rubric check: unknown-unknowns (problem space not mapped) → human. Probing depends on what each participant reveals → human. Specialized jargon, possible high-stakes judgment → human.

Verdict: Human-moderated. AI moderation would flatten the texture this study needs.

**Bad fit (redirect to "don't run yet"):**

A team wants to scale to 500 AI-moderated discovery interviews next week. The guide is in draft. No teammate has reviewed it. No pilot is scheduled.

Rubric check: Step 5 fails — guide hasn't been pressure-tested. Other rubric questions are moot.

Verdict: Don't field. Pressure-test the guide first; revisit the rubric after pilot.

## What the fit check does NOT do

- It does not pick the method. Methodology selection happens upstream in `references/methodology-selection.md`. The fit check only decides moderator type, given that an interview-style method has already been selected.
- It does not authorize synthetic users as a primary evidence source. Synthetic users have narrow defensible uses (guide pressure-testing, desk research, post-hoc triangulation) and are covered in `references/ai-research-context.md`, not here.
- It does not eliminate the human researcher's role. AI-moderated studies still require human-led goal setting, guide authoring, pressure-testing, active monitoring, and synthesis.
- It does not modify the pre-flight gate. The 6-question + Ronsen-7 + Sbrocca-3 + Pejman-4 gates run first. If the study fails the gate, the fit check is moot — the study doesn't happen.

## Brief deltas summary

Quick checklist of what an AI-moderated brief must contain on top of the selected method's defaults:

- [ ] All 5 rubric steps run, with verdict documented.
- [ ] Per-question probe rules (`probe: none` / `probe: a little` / `probe: more`).
- [ ] Guide shortened by ~2 questions vs. human-moderated equivalent.
- [ ] Mixed-format prompts (open + closed + rich media).
- [ ] Explicit warm-up and wind-down scripts.
- [ ] Glossary included if specialized terminology is involved.
- [ ] Pre-interview prep instructions for participants.
- [ ] Tighter recruit criteria (AI moderation flattens slop).
- [ ] Variable interview length communicated (NN/g 13–56 min range).
- [ ] Pressure-test step dated and owned, completed before recruitment opens.
- [ ] Active-monitoring plan: owner + cadence + quality criteria + escalation path.
- [ ] Brand/credibility section at the start of the moderator's script.
- [ ] Re-fielding plan if quality issues surface.
- [ ] Synthesis section labels AI-generated inputs vs. real-participant data.

## Cross-references

- Methodology selection (upstream): `references/methodology-selection.md`
- Pre-flight gate (upstream, always runs first): `references/pre-flight-gate.md`
- AI research context (synthetic users, role-of-AI taxonomy): `references/ai-research-context.md`
- Discovery interview method (most-common downstream consumer): `references/patterns/methods/discovery-interview.md`
- Usability testing method (canonical AI-moderation fit): `references/patterns/methods/usability-testing.md`
- Survey (alternative method when AI moderation isn't a fit but scale is needed): `references/patterns/methods/survey.md`
- Anti-patterns library (full): `references/anti-patterns.md`
