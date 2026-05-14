# Context: AI-augmented research

A *context* modifies a brief — it overlays whatever project type, method, and framework you've already picked. AI-augmented is the "AI is in the loop somewhere" overlay. It does **not** mean the research is AI-led; it means AI is doing something specific and the brief needs to name what, where, and how it's checked.

The central framing: AI is allowed as an **input** to research or a **pressure-test** of research artifacts. AI is **never** a substitute for real-user contact in primary research.

For the underlying decision rubric (when AI moderation fits, when it doesn't), see `patterns/methods/ai-moderation-fit.md`. For the longer-form sourcing and rationale, see `references/ai-research-context.md`.

## When this context applies

Apply this context whenever the user mentions AI in **any** non-substitute role. Common signals:

- "AI-moderated interviews" or "AI interviewer"
- "Synthetic users" / "AI personas" / "simulated participants"
- "Let's have AI analyze the transcripts"
- "Can AI draft the discussion guide?"
- "Use AI to pressure-test the guide"
- "Synthesize the existing research with AI"
- "Outset / Strella / Listen Labs / Synthetic Users" (vendor names)
- "ChatGPT can probably tell us..." (red flag — see anti-patterns)

If the user mentions AI in any capacity, apply this context. It doesn't add much weight to a brief, but it forces an explicit "Role of AI" line that protects against the most common failure modes.

## What it adds to the brief

### Role-of-AI taxonomy

The core addition is a forced classification. AI fills one of three roles in any given piece of research:

**Input** — AI produces material that *feeds* the research design or analysis:
- Drafting questions for the discussion guide (human reviews)
- Desk research and literature synthesis
- Summarizing prior internal work
- Generating hypotheses to test with real users
- Post-hoc triangulation ("did we miss anything from this transcript?")

**Pressure-test** — AI vets an artifact *before* it touches real users:
- Synthetic users walking a draft discussion guide to surface dead-ends
- Pilot dry-runs of an interview flow
- Reviewing a screener for leading or ambiguous wording

This is the pattern Outset and similar vendors specifically recommend: use the synthetic user as the *first* read-through, before real-user fielding.

**NEVER substitute** — AI does **not** replace real-user contact in primary research. No exceptions when the output will be used as evidence for a decision.

When the user proposes AI as the actual source of findings ("let's just ask AI what users would think"), block and reframe. See *Reframing scripts* below.

### Synthetic-users guardrails

Synthetic users are the highest-risk AI role because vendors actively market them as a primary-research substitute. The consensus from NN/g, IDEO, Erika Hall, and even the leading synthetic-users vendor's own admission is clear.

**OK for:**
- Desk research / literature synthesis
- Hypothesis generation (to be validated with real users)
- Discussion-guide pressure-testing before fielding
- Pilot / dry-runs of interview flow
- Post-hoc triangulation — "did we miss anything?" after real-user data is in

**NOT OK for:**
- Concept validation (will users like this?)
- Niche populations (training data is thin → high failure rate)
- Decision-gating research (anything ship/no-ship)
- Stakeholder-facing findings (anything presented as "what users think")

**Always:**
- **Label as synthetic.** In any artifact — transcripts, summaries, decks — synthetic content must be visually and verbally distinguished from real-user content.
- **Treat as hypotheses.** Anything synthetic generates is a hypothesis that needs real-user validation, never a finding.
- **Cite the vendor concession.** From the leading synthetic-users vendor itself: *"Synthetic Users without calibration are individually believable, but collectively wrong."* This is the cleanest one-line guardrail in the space.

Empirically demonstrated failure modes (NN/g, LSE studies):
- **Sycophancy** — synthetic users give confidently optimistic responses (NN/g's tree-testing study: synthetic users "claimed completion of all courses" while real users completed only 3 of 7)
- **Flattened priorities** — synthetic users generate engagement factors "with only limited understanding of their priority"
- **Training-data bias** — "Responses are based on training data that you can't control"
- **Missing edge cases** — "context clues" and "unexpected tangents" don't surface

### Reframing scripts

When a user proposes AI in a substitute role, do not just say no — reframe to the role AI *can* play. Two scripts that work:

**For "let's just ask AI to validate our product idea":**
> "AI can help draft the questions and pressure-test the guide — real people whose decisions you'll be designing for run the actual research."

**For "we don't have time to recruit; can we use synthetic users?":**
> "I can use AI to synthesize existing research on this audience; that gives us hypotheses. Then we test those hypotheses with real users."

Both keep AI in the picture (avoids the dynamic where the user feels their AI enthusiasm is being shut down) while moving it out of the substitute role.

A useful longer framing, voice-matched to UI's first-party guide on AI moderation:

> "AI can't do it all. You'll still need to contextualize, clarify, and combine the results into something meaningful. The AI moderator will dutifully run through a conversation or interview guide, but it won't know your company, stakeholders, and product like you do."

### Brief section additions when AI is in any role

When this context applies, add or modify these brief sections:

**Methodology — add a "Role of AI" line.**
- Format: `Role of AI: input | pressure-test | none`
- If multiple roles, list each with what's covered: `Role of AI: input (desk research synthesis), pressure-test (synthetic-user dry-run of guide)`
- "None" is a valid and common answer — saying so explicitly is the point of the line

**Risks & limitations — name failure modes being guarded against.**
- For AI moderation: name the pressure-test step, the active-monitoring plan, the variable interview-length range (NN/g observed 13–56 min)
- For synthetic users: name sycophancy, training-data bias, flattened priorities — say which ones apply and how the brief addresses them
- For AI-drafted guides: name how human review will catch leading or ambiguous questions

**Hypothesis flag on any AI-sourced content.**
- Mark any insight, persona detail, or claim that came from AI desk research / synthesis with: *"from desk research; needs validation."*
- This flag is non-optional. If a stakeholder sees a finding without it, they should be able to assume it's grounded in real-user data.

**For AI moderation specifically — add per the AI Moderation pattern:**
- Per-question probing instructions ("none / a little / more")
- Pressure-test step (test yourself, teammate, synthetic user, pilot real participants)
- Active-monitoring plan (who watches response quality, on what cadence)
- Brand / credibility touches in the moderator setup (company name, logo)

## Examples

### Example: AI-augmented brief done well

> **Method:** AI-moderated usability test on the new pricing page, 30 participants.
>
> **Role of AI:**
> - Input: synthesized prior pricing-page research from the team repo (4 studies, 2023–2025)
> - Pressure-test: synthetic-user walkthrough of the discussion guide before fielding
> - Moderation: AI moderator with per-question probing rules (none / a little / more)
> - **Not** substitute: 30 real Stage-3 trial users; all decisions gated on their data
>
> **Risks & limitations:**
> - AI moderation may underperform on jargon (NN/g) — Q3 has manual probe escalation if the user mentions "managed accounts" or "team plans"
> - Synthetic-user guide pressure-test will surface dead-ends but won't catch jargon issues — that requires a real-user pilot (n=2) before scaling to 30
> - Variable session length expected (NN/g range 13–56 min) — incentive set for 30 min target
>
> **Hypotheses flagged for validation:** From desk research synthesis: (a) trial users miss the "Compare plans" CTA; (b) "Per seat" pricing is read as "per organization"; needs validation in this study.

### Example: brief that triggers reframing

> **User's request:** "We want to validate the new onboarding concept. Let's use synthetic users to test the flow — we don't have time to recruit real ones."
>
> **Reframe:** "Synthetic users are not a fit for concept validation — this is exactly the case the literature warns against (sycophancy, flattened priorities, no real decision signal). What I can do:
> - Use AI to pressure-test the discussion guide before fielding (catches dead-ends fast)
> - Synthesize prior onboarding research to seed hypotheses for the study
> - Run a 5-participant rapid usability test on real Stage-1 users (Day 3–5 of a rapid cadence)
>
> The concept-validation question itself needs real users. Want me to draft the rapid brief?"

### Example: AI-drafted guide, human-reviewed

> **Method:** Generative interviews with 8 power users, 60-minute sessions.
>
> **Role of AI:**
> - Input: drafted the discussion guide (human reviewed Q-by-Q, rewrote 3 of 12 questions for leading or ambiguous wording)
> - Pressure-test: ran the revised guide through a synthetic-user dry-run; surfaced two questions where the synthetic answer pattern was uniform (likely too narrow); rewrote
> - **Not** present in moderation, analysis, or synthesis
>
> **Hypothesis flag:** None — no AI-sourced content carries through to findings.

## Anti-patterns

Specific failure modes to watch for and call out in review.

### AI-first research design

The LLM scopes the question, defines the audience, or generates findings *before any human contact*. This is the most insidious failure mode because the output looks complete and well-structured. The whole research stack inherits AI's hallucinations and training-data limits from the start.

Catch: any brief where the research question, hypotheses, or audience came from an LLM session and was not interrogated by a human stakeholder before recruiting.

### Synthetic users as primary evidence

Synthetic users propose concept validation, replace real recruiting, or stand in for niche populations. This is the **central** failure mode the synthetic-users guardrails block. Vendor's own concession: *"individually believable, collectively wrong."*

Catch: if findings will be presented as "what users think" and the data source is synthetic, block.

### Unlabeled mixing of synthetic and real-user data

A deck or doc presents quotes, themes, or stats without distinguishing which came from real users and which from synthetic. Stakeholders cannot tell what's grounded. This is reputation-damaging even when the underlying analysis is correct.

Catch: any artifact with AI-sourced content needs visual + verbal labels. No exceptions.

### Hypothesis laundering

AI-generated hypothesis is presented as a finding without a real-user validation step. Looks like: "Users prefer X over Y" with no recruit, no sample, no method — just an LLM session in the source.

Catch: every AI-generated claim in a finding needs a corresponding real-user validation step in the methodology.

### Convenience substitution

Synthetic users chosen because real recruiting feels slow, on a decision that warrants real recruiting. This is the most common rationalization — "we'll do real users next round." It's almost never followed up.

Catch: if recruiting friction is the reason for synthetic users (not the question type), block and offer rapid recruiting strategies instead.

### Niche-population synthetic users

Using LLMs to simulate populations underrepresented in training data — surgeons, security researchers, niche developers, low-resource-language speakers. Training data is thin → high failure rate, often without surfacing as obvious errors. The synthetic user sounds plausible because the LLM is good at sounding plausible.

Catch: any synthetic-user use on a non-mainstream population is a block.

### AI without pressure-test

Scaling an unverified discussion guide via AI moderation. "Poor questions now scale across hundreds of participants automatically" — the failure mode named directly in the AI moderation literature. The whole point of AI moderation's scale advantage is wasted if the guide hasn't been pressure-tested first.

Catch: AI-moderated study with no pressure-test step in the brief is incomplete.

### AI without active monitoring

Passive review instead of in-flight quality checks. AI moderation drifts in ways human moderation doesn't — repetitive probes, missing follow-ups, off-topic tangents. Someone needs to be watching response quality during the study, not just reviewing transcripts after.

Catch: AI-moderated brief without a named active-monitoring owner and cadence is incomplete.

## Related patterns

- **`patterns/methods/ai-moderation-fit.md`** — the 5-step rubric for whether AI moderation is a fit for a specific study. This context applies if AI is involved at all; the method pattern decides whether AI *moderation specifically* is the right call.
- **`references/ai-research-context.md`** — full sourcing, quotes, and rationale (NN/g, IDEO, Outset, Strella, Synthetic Users vendor, UI's first-party guide). Use as the reference when stakeholders push back on the guardrails.
- **Pre-flight gate** — the AI-augmented context does not bypass the pre-flight gate. It adds questions: *What role is AI playing? Substitute = block. Who are the real humans you'll learn from? Is the target population well-documented in public data, or niche? Will stakeholders see what's synthetic vs. real, clearly labeled?*
- **Rapid cadence** — frequently co-occurs with AI-augmented (both invoked under time pressure). The combination is fine if AI stays in its allowed roles; risk: AI gets pushed toward substitute when recruiting feels slow under rapid cadence. Hold the line.
