# Method pattern: discovery interview

Discovery interviews are generative qualitative research — open-ended 1:1 conversations that surface user problems, behaviors, motivations, and context-of-use. The question is exploratory ("what's going on?"), not evaluative ("does this design work?"). See `references/patterns/methodology-selection.md` for how this method gets picked; this file shapes the brief once it has been selected.

## When this pattern applies

Apply this pattern when the research question matches one or more of these shapes:

- "How do users currently [accomplish job / handle situation / make decision]?"
- "Why do users [behavior pattern]?"
- "What problems do users have with [domain / workflow]?"
- "What does a typical [week / project / handoff] look like for [audience]?"
- "What triggers [audience] to start looking for [solution category]?"

Triggers for routing to this pattern:

- The team is pre-design or pre-prototype — there is no artifact to test.
- The product cycle stage is discovery, not validation.
- The team needs to understand the problem space before scoping a solution.
- The decision being informed is strategic ("should we build in this space at all?") or definitional ("what should we build?").
- The audience and their context are not yet well-understood by the team.

Do NOT route to discovery interviews when:

- A specific artifact exists and the question is evaluative — use usability-testing instead.
- The question needs quantitative scale (n>=100) — use a survey, possibly preceded by a small round of discovery interviews to inform survey design.
- The team has already decided what to build and wants research to "validate" — that's the validation anti-pattern; redirect to either usability testing or a kill-the-research conversation.
- The team wants to know what users *would* do in a hypothetical scenario — discovery interviews surface past behavior, not future predictions.

## What it adds to the brief

The default brief sections stay; the methodology and participants sections get discovery-specific content. Add these to the brief:

- **Topic areas (3–6), not a question list.** Discovery interviews use a discussion guide structured around themes, not a script of questions. The moderator drives toward each theme but follows the participant's path through it.
- **"Tell me about a time when..." prompts.** For each topic, draft at least one concrete past-experience prompt. These anchor the conversation in actual behavior rather than self-reported opinion or future speculation.
- **Probing techniques explicitly listed.** "Tell me more about that." Repeat-back. "And then what happened?" "What were you thinking right then?" Naming the probing techniques in the brief reminds the moderator that the *follow-up* is where the data lives.
- **Warm-up (2–3 minutes).** Light context-setting question to settle the participant in. Usually a low-stakes question about their role or recent work.
- **Wind-down (3–5 minutes).** "Is there anything I didn't ask about that I should have?" "What would you want me to know if I were stepping into your role tomorrow?" Captures the loose ends the structured guide misses.
- **Recording + note-taking plan.** Audio (with consent) is the default; transcripts unlock analysis. A second note-taker is high-value when affordable — the moderator should be present in the conversation, not transcribing. If a note-taker isn't available, capture timestamps of moments worth re-listening to.

Also surface in the brief:

- The research goal in plain language ("learn how product teams currently triage support escalations").
- The decision the research will inform (per `references/decision-driven-research.md`).
- Recruit criteria — be specific about *behaviors*, not just *demographics*. "PMs who shipped a feature in the last 90 days" is sharper than "PMs at SaaS companies."

## Defaults

**Sample size:** N=6–8 participants per audience segment. UI's Field Guide cites 3–10 for interviews; 6–8 is the sweet spot — enough to see patterns repeat without overspending. If the brief covers multiple distinct segments, run 6–8 per segment. Add an 11% no-show buffer (NN/g) when scheduling.

**Session length:** 45–60 minutes. Shorter (30 minutes) is acceptable for narrowly-scoped studies but tends to surface less unexpected texture. Longer than 60 minutes risks fatigue on both sides.

**Cadence:** Schedule sessions across at least 2–3 days, not all in one block. The moderator's pattern recognition compounds across sessions — analyzing after 2–3 sessions and adjusting the guide is a feature, not a deviation.

**Discussion guide length:** 3–6 topic areas, each with one anchor "tell me about a time when..." prompt and 2–4 follow-up probes. Total guide length: 1–2 pages. Longer guides telegraph that the moderator will rush through, which kills the probing depth.

**Moderation type:** Default is human-moderated. AI moderation can work for discovery at scale (per Strella's validated use cases) but requires a well-mapped problem space, pre-defined probing logic, and a pressure-tested guide. If the team is pushing for AI moderation here, route the brief through `references/patterns/methods/ai-moderation-fit.md` — discovery interviews are the highest-stakes AI-moderation decision because unknown-unknowns are the whole point.

**Recording:** Audio always (with explicit consent). Video when the participant is comfortable and screen-share or artifact-walkthrough is part of the study. Transcripts unlock thematic analysis and quote-pulling.

**Synthesis cadence:** Schedule a synthesis block after every 2–3 sessions. Don't wait until all sessions are done — early themes inform later probing.

**Incentive:** Typical ranges: $75–150 for 45–60 minute consumer interviews; $150–300 for professional audiences; $300+ for senior or specialist roles. State the incentive in the brief.

**Stimuli or artifacts the participant brings:** Some discovery studies ask participants to bring an artifact from their work (a document, a workflow tool, a recent project). State this in the recruit invite and in the brief — it changes both screening and session prep.

**Note-taking strategy:** If a dedicated note-taker is available, the moderator stays present in the conversation while the note-taker captures verbatim quotes, behavioral moments, and timestamped tags for later review. If no note-taker, the moderator should resist the urge to write during the conversation — eye contact and active listening produce better probes than thorough notes. Capture timestamps of moments worth re-listening to (e.g., "27:30 — surprising frustration with handoff doc") and rely on the recording for verbatim recovery.

**Consent and recording:** State at the start of the session that audio (and video, if applicable) is being recorded, what it'll be used for, and who will see it. Get verbal confirmation. If the participant declines recording, take handwritten notes and flag the limitation in the synthesis.

**Discussion guide as scaffold, not script:** The discussion guide lists topics and anchor prompts; it does not script the conversation. The moderator's job is to drive toward each topic across the session while letting the participant's story shape the path through it. A session that hits every topic in order and never deviates is a session that probably missed the texture.

**Recruit screener strategy:** Pair the recruit criteria with a short screener survey (5–8 questions) to validate behavior before scheduling. See `references/patterns/methods/survey.md` on screener funnel order.

## Examples

**Good prompts (anchored in past behavior):**

- "Tell me about the last time you had to onboard a new teammate. Walk me through how that went."
- "Can you describe the most recent time you ran into a problem with [workflow]? What happened?"
- "Think about the last project where this came up — start from the beginning and tell me what you did."

**Bad prompts (hypothetical or leading):**

- "Would you use a tool that does X?" (Asks about future behavior. People misreport.)
- "Do you think it's important to have [feature]?" (Asks for opinion, not behavior. Everyone says yes to importance.)
- "If we built X, would you pay for it?" (Future hypothetical + commercial framing. Worst of both.)
- "Wouldn't it be helpful if [solution]?" (Leading. Telegraphs the answer.)
- "How often do you struggle with [problem]?" (Frames the answer as a problem before the participant confirms it is one.)

**Good recruit criterion vs. bad recruit criterion:**

Good (behavioral): "Has run at least one user interview in the last 90 days as part of their job."

Bad (demographic): "Works as a UX researcher at a B2B SaaS company with 100–500 employees."

The good criterion filters on the behavior the study is about. The bad criterion filters on a coarse proxy that includes participants who don't do the behavior at all.

**Good probing techniques:**

- **"Tell me more about that."** The most reliable probe in the kit. Almost always returns useful material.
- **Repeat-back.** "So you said the handoff doc was useless — what made it useless?" Forces precision without putting words in the participant's mouth.
- **"And then what happened?"** Pushes the timeline forward. Surfaces the steps the participant glossed over.
- **"What were you thinking right then?"** Surfaces the cognitive layer behind the action.
- **Silence.** Counting to three before filling a pause. Participants often add the most valuable detail after the first answer feels complete.
- **"Walk me through that step by step."** When the participant skips ahead, this resets to the granular layer.
- **"What was that like for you?"** Open enough to surface emotional and contextual texture without leading.

**Good wind-down prompts:**

- "Is there anything I didn't ask about that I should have?"
- "What would you want me to know if I were stepping into your role tomorrow?"
- "Anything that's come up in the conversation that you'd want to come back to?"

The wind-down regularly returns the most-cited quote of the session — participants give themselves permission to share what they were thinking about that didn't fit the structured topics.

## Analysis and synthesis defaults

The brief should name how findings get from session recordings to a shared artifact. For discovery interviews, the synthesis pattern is thematic:

- **Theme extraction.** Cluster observations across sessions into 4–8 themes. Themes name the pattern, not the symptom — "handoff docs are written for compliance, not for the recipient" is a theme; "PMs are frustrated with handoff docs" is a symptom.
- **Behavior anchors per theme.** For each theme, name the behaviors that produced it — concrete past actions or moments from sessions. Themes without behavior anchors drift into opinion.
- **Verbatim quotes per theme.** 2–3 strong quotes per theme. Quotes are the difference between a synthesis that lands and one that gets challenged in the readout.
- **Open questions per theme.** What the team still doesn't know. Discovery surfaces new questions; naming them keeps the team honest about what's been learned vs. assumed.
- **Implications, not recommendations.** Discovery interviews surface user reality; they don't directly produce design recommendations. The synthesis names implications ("this suggests the team should investigate X further" or "this changes how we think about Y") rather than prescriptions.

Name a synthesis owner and a target readout date in the brief. Schedule synthesis blocks during the field period, not after — early themes inform later probing.

## Anti-patterns

- **Asking about future behavior.** "Would you use this?" "How often would you do that?" People are bad at predicting their own future behavior; the answers feel concrete but aren't. Reframe as past behavior: "Tell me about the last time you tried to do this."
- **Leading questions.** "Don't you think X is frustrating?" The participant takes the cue and confirms. Reframe as open: "How do you feel about X?" — or better, "Tell me about the last time you dealt with X."
- **Asking if users would like an idea.** "Would you like a feature that...?" surfaces opinions, not behaviors. UI's published rule: *"Don't validate; instead investigate."* For idea-testing, route to concept testing or usability testing on a low-fi prototype, not a discovery interview.
- **Validating instead of investigating.** Subtle version of the above. The team has a hypothesis and the questions are shaped to confirm it. Sign: every probe is closed-ended ("Did you find that frustrating?"). Reframe with open-ended structure ("What was that like?").
- **"Crash test dummy" anti-pattern.** Treating participants as automatons forced through a script, with no room for their actual experience to shape the conversation. The participant becomes a question-answering machine; the texture that makes discovery valuable disappears. Symptoms: moderator never deviates from the guide, never probes a surprising answer, never asks "tell me more." The discussion guide is a scaffold, not a script. See `references/anti-patterns.md`.
- **People-pleaser bias.** Participants want to be helpful and will tell you what they think you want to hear. Mitigations: emphasize at the start that critical feedback is more useful than positive feedback; ask about past behavior (harder to fake than opinion); cross-check claims against observed behavior when possible.
- **Confusing discovery with sales.** Asking about the company's product, pricing, or competitors in the middle of a discovery interview signals that the conversation is actually a pitch. Keep discovery interviews about the participant's world, not about the product.
- **Demographic-heavy recruiting.** Recruiting by job title, company size, or industry without behavioral filters often surfaces participants who don't actually do the thing you're studying. Behavioral recruit criteria ("has run an A/B test in the last 90 days") consistently outperforms demographic recruit criteria.
- **No second pass on the guide.** First-draft discussion guides almost always have leading or compound questions. Pressure-test the guide on a teammate before the first real session — usually finds 2–3 questions worth rewriting.

## Brief deltas summary

Quick checklist of what the discovery-interview pattern adds to the default brief. The agent generating the brief should confirm each item is present:

- [ ] 3–6 topic areas, each with one anchor "tell me about a time when..." prompt.
- [ ] 2–4 follow-up probes per topic.
- [ ] Probing techniques explicitly listed (tell me more / repeat-back / and then what happened / silence).
- [ ] 2–3 minute warm-up question.
- [ ] 3–5 minute wind-down with "is there anything I didn't ask about" prompt.
- [ ] Sample size: 6–8 participants per audience segment + 11% no-show buffer.
- [ ] Session length: 45–60 minutes.
- [ ] Cadence spans 2–3 days, not a single block.
- [ ] Recording plan (audio default, video optional, consent language).
- [ ] Note-taker named if available, or recording-tagging plan if not.
- [ ] Recruit criteria are behavioral, not demographic.
- [ ] Screener survey paired with recruit criteria.
- [ ] Synthesis cadence scheduled after every 2–3 sessions.
- [ ] AI-moderation fit check run if AI moderation is being considered.

## Cross-references

- Methodology selection: `references/patterns/methodology-selection.md`
- AI moderation fit (run this check if AI moderation is being considered): `references/patterns/methods/ai-moderation-fit.md`
- Question writing (specific / actionable / practical filter): `references/question-writing.md`
- Anti-patterns library (full): `references/anti-patterns.md`
- Sample sizes (authoritative table): `references/sample-sizes.md`
- Survey (paired upstream for recruiting via screener, or downstream for quantitative validation): `references/patterns/methods/survey.md`
