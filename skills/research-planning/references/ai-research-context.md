# AI in Research — the skill's defensible position

## Purpose

State the position this skill takes on AI in research: where AI helps, where it doesn't, and what the brief should make explicit. Voice-matched with User Interviews' own AI Moderation Guide, then cross-checked against the convergent professional view from NN/g, IDEO, Erika Hall, and the Synthetic Users vendor's own concessions.

The skill is not anti-AI. It is anti-substitution. AI is narrow and legitimate around the edges of a research project. Real people whose decisions you're designing for run the actual research.

## When to apply

- A user proposes "let's just ask AI to interview some synthetic users" instead of recruiting.
- A user asks whether AI moderation is right for their study.
- A user wants to know what the brief should say about AI assistance.
- A stakeholder pressures the user to "use AI to move faster" on a study where real participants are warranted.
- A brief is silent on the role of AI and needs an explicit statement.

## UI's first-party position (voice-matched)

User Interviews publishes an AI Moderation guide. The skill privileges this content — it's first-party, voice-matched, and unusually thoughtful for vendor-published material. The following quotes are verbatim from UI's AI Moderation Guide.

### The framing

> "AI isn't going anywhere, so the UX professional who takes a curiosity-first approach is most likely to succeed in the ever-automated future."

The right posture is curious, not defensive. AI changes the shape of research; it does not eliminate research.

### When UI recommends AI moderation

UI explicitly recommends AI moderation when:

- **The interview guide is standardized.** Predefined questions, predefined probes, minimal need for in-the-moment improvisation.
- **Outcomes are clearly defined.** Usability tests, concept tests, ad/messaging tests, NPS-style satisfaction work — studies where you know what you're measuring before you start.
- **Participants are hard to reach.** AI moderation lets participants self-schedule and complete on their own time. UI's framing: "AI moderation puts customers in charge."
- **Qual researchers have quant stakeholders.** AI moderation "pairs nuance and texture with quantity" — you get qualitative depth at quantitative scale, which is the format quant-oriented stakeholders trust.

### UI's guardrails (verbatim)

> "AI can't do it all. You'll still need to contextualize, clarify, and combine the results into something meaningful."

> "The AI moderator will dutifully run through a conversation or interview guide, but it won't know your company, stakeholders, and product like you do."

For unknown-unknowns research stages:

> "it might be better to use human moderators familiar with the market, industry, and product."

The pattern: AI is good at running the guide. It is not good at knowing whether the guide is the right guide, whether the answers are surprising, or what the answers mean in your specific context.

## Convergent professional view on synthetic users

Synthetic users (LLMs simulating research participants) are a different question than AI moderation. UI's guide is largely silent on synthetic users. Other sources are not.

Four independent sources converge: NN/g, IDEO, Erika Hall via Smashing, and — notably — the Synthetic Users vendor itself.

### The vendor's own concession

The Synthetic Users company published this admission:

> "Synthetic Users without calibration are individually believable, but collectively wrong."

Read that twice. The vendor is saying their product produces output that sounds right but, in aggregate, is not. That is the convergent finding from every critical source.

### NN/g's empirical study

NN/g ran a tree-testing study comparing synthetic users to real users. Synthetic users systematically over-reported completion: they claimed completion of all 7 courses while real users actually completed only 3. The synthetic responses sounded confident and competent. They were also wrong.

### IDEO's framing

IDEO published this widely-shared line about replacing fieldwork with AI-generated research:

> "three weeks of swimming in a lukewarm sea of AI-generated information, all we needed was one hour with one real flesh-and-blood patient."

The point: synthetic research feels productive but produces nothing actionable. Real contact, even briefly, produces more.

### Failure modes (empirically demonstrated)

The cross-source view converges on these failure modes:

- **Sycophancy.** LLMs default to confidently optimistic responses. They tell you the thing succeeded.
- **Flattened priorities.** Synthetic users generate engagement factors, but with no real sense of which factors matter most to which users. Everything reads as moderately important.
- **Missing edge cases.** Context clues, unexpected tangents, the "wait, that's not what I meant" moments — these don't surface.
- **Training-data bias.** Responses reflect the training data, not your target population. Niche or specialized populations are especially poorly represented.
- **False confidence.** Output reads as definitive. Real research surfaces uncertainty. Synthetic research suppresses it.

## Role-of-AI taxonomy

The skill uses three role categories. Place AI in one of them — explicitly — in the brief.

### Input

AI helps generate material a human will then verify, refine, and ground in real data. Legitimate.

Examples:
- Drafting initial discussion-guide questions.
- Desk research / literature synthesis on a topic.
- Generating hypotheses for a human to test with real participants.
- Suggesting screener criteria.

### Pressure-test

AI runs a dry-run or stress-test on artifacts before they hit real participants. Legitimate.

Examples:
- Synthetic users vetting a discussion guide before fielding (do the questions produce coherent responses? Are any leading?).
- AI playing the role of a difficult participant to test moderator preparedness.
- AI reviewing a brief for unstated assumptions.

### Never substitute

AI does not replace real-user contact for primary research. Hard line.

Examples of what NEVER substitute means:
- No "we asked 50 synthetic users and here's what they said" as findings.
- No skipping recruiting because AI can "stand in" for the population.
- No reporting AI-generated quotes as participant quotes.
- No treating AI output as evidence in a stakeholder readout.

## The position the skill holds

Research commits to learning from real humans. AI is a narrow and legitimate assistant around the edges. The brief should make that boundary explicit — what AI is doing, what AI is not doing, and how anyone reading the findings will know which is which.

When a brief includes AI assistance, it should answer:

- What role is AI playing — input, pressure-test, or neither?
- Where does AI output get verified by a human?
- How are AI-generated artifacts (questions, hypotheses, summaries) labeled when shown to stakeholders?
- For AI moderation specifically: who's pressure-tested the guide? Who's actively monitoring response quality during fielding?

A brief that names AI's role explicitly is defensible. A brief that quietly leans on AI without saying so is not.

## Narrow defensible uses of synthetic users

Where critics and defenders converge: synthetic users have a small set of uses that don't put research credibility at risk. All five of these uses share one property — they precede or accompany real-user research, they never replace it.

1. **Desk research / literature synthesis.** Use AI to consolidate published findings on a topic. Verify before relying.

2. **Pressure-testing discussion guides before fielding.** Run a synthetic participant through the guide. Watch for confusing wording, leading questions, gaps in probing. Fix before recruiting real participants.

3. **Hypothesis generation to validate with real users.** Use AI to surface what the team thinks might be true. Then go test those hypotheses with people whose responses you can't predict.

4. **Pilot / dry-run interview flow.** Same as #2 but for the interaction shape — is the flow paced right? Are the transitions natural? Treat as rehearsal, not evidence.

5. **Post-hoc triangulation ("did we miss anything?").** After completing real research, run synthetic users on the same guide to see if they surface angles you didn't explore. Use as a prompt for further investigation, not as additional findings.

Anything outside this list — using synthetic users to validate a concept, replace recruiting, simulate niche populations, or generate findings — is the substitution failure mode.

## Reframing scripts

When a user (or a stakeholder pressuring them) suggests "let's just ask AI," the skill should reframe rather than refuse. The reframe is consistent: split the request into what AI can legitimately do and what only real participants can do.

### "Let's just ask AI what users want."

Reframe: "AI can help draft the questions and pressure-test the guide — real people whose decisions you'll be designing for run the actual research. Want to start with AI-drafted questions and then recruit 5–8 real participants to answer them?"

### "Can we use synthetic users instead of recruiting?"

Reframe: "Synthetic users are useful for pressure-testing the discussion guide before we field it — they catch confusing questions and leading wording. They're not reliable as a substitute for real participants; the vendor itself flags that synthetic users are 'individually believable, but collectively wrong.' Let's use them to vet the guide, then recruit real participants for the actual study."

### "AI moderation could let us scale this."

Reframe: "AI moderation is a strong fit when the guide is standardized and the outcomes are well-defined — concept tests, usability, ad/messaging. Is that the shape of this study, or is it more exploratory? If exploratory, human moderation is the better call; if standardized, let's plan for AI moderation with a pressure-test step before scaling and active monitoring during fielding."

### "Just have AI summarize the existing customer interviews."

Reframe: "AI can help draft the synthesis — but a human needs to verify the patterns and surface the surprises. AI tends to smooth over the edge cases that are usually the most actionable findings. Let's use AI for the first pass and have you review for what got flattened."

## Anti-patterns

- **AI-first research design.** Letting an LLM scope the question, define the audience, or generate "findings" before any human contact. The brief is built backward from AI output instead of from a real question.

- **Synthetic users as primary evidence.** Proposing synthetic users to validate concepts, replace recruiting, or stand in for niche populations. The convergent professional view treats this as not-research.

- **Unlabeled synthesis.** Mixing AI-generated and real-user data in a stakeholder readout without distinguishing them. Readers cannot tell which is which; the credibility of the real data drops to match the credibility of the synthetic.

- **Hypothesis laundering.** Treating AI-generated hypotheses as findings. AI says "users probably want X," team writes "users want X" in the brief, decision gets made on "evidence" that was an LLM completion.

- **Convenience substitution.** Choosing synthetic users because real recruiting feels slow, on a decision that warrants real recruiting. The convenience savings are real; the credibility cost is larger.

- **Niche-population synthetic users.** Using LLMs to simulate populations the training data underrepresents — specialists, regulated industries, vulnerable populations, non-English-speaking users. The model has the least to draw on exactly where you need the most accuracy.

- **AI moderation without pressure-test.** Scaling an unverified discussion guide. UI's framing: "poor questions now scale across hundreds of participants automatically." The pressure-test is mandatory, not optional.

- **AI moderation without active monitoring.** Setting up AI-moderated sessions and reviewing transcripts after the fact. AI moderation produces variable response quality (NN/g observed 13–56 min interview length range); someone needs to be watching during fielding, not just after.

- **AI-generated quotes presented as participant quotes.** Any quote in a stakeholder readout should trace to a real participant. AI-paraphrased real quotes are a gray area — label them clearly. AI-generated quotes from synthetic users are not quotes; they are completions.

## What goes in the brief

If the brief involves AI assistance at any step, the brief should state:

- **Method, including the role of AI.** Not just "interviews" — "interviews, with AI-drafted discussion guide pressure-tested via synthetic users before fielding."
- **Pressure-test step.** For AI moderation: who's vetting the guide, with how many real or synthetic test runs, before scaling?
- **Active monitoring plan.** For AI moderation: who's watching response quality during fielding, on what cadence?
- **Labeling convention.** How will the final readout distinguish AI-generated material (drafts, hypotheses, syntheses) from real-participant material (quotes, observations, behavioral evidence)?

A brief that names the role of AI explicitly is one a reviewer can trust. A brief silent on AI in a world where AI is everywhere is one a reviewer has to interrogate before they can trust.
