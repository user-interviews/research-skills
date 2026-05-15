# Context: Continuous cadence

A *context* modifies a brief — it overlays whatever project type, method, and framework you've already picked. Continuous cadence is the "this is a practice, not a study" overlay. It changes what the brief produces. Instead of scoping a one-shot project, you scope a *rhythm* — a recurring research practice the team runs week after week as part of how they make decisions.

This is the cadence Teresa Torres popularized as "continuous discovery." Whatever the team calls it (weekly customer conversations, ongoing learning cadence, continuous discovery, embedded discovery), the shape is the same: regular contact with users, recurring synthesis, evolving questions, and integration with how the team decides what to build.

## When this context applies

Apply continuous cadence when **all three** are true:

- **The user describes a practice, not a study.** Trigger language: "continuous discovery," "weekly customer conversations," "ongoing learning cadence," "always-on research," "regular customer touch-points," "discovery rhythm."
- **The team wants the rhythm to persist.** Not "we'll do this for the next sprint" — they're building a habit that outlasts any single decision.
- **The team has — or will build — recurring synthesis and decision integration.** Continuous cadence without synthesis is just lots of calls. Without decision integration, it's research theater. Both have to be in scope.

Trigger phrases to watch for:

- "Continuous discovery"
- "Weekly customer conversations"
- "Ongoing learning cadence"
- "Always-on research"
- "Discovery rhythm"
- "Embedded discovery"
- "Regular check-ins with customers"
- "Build a discovery practice"

If the user describes a single fixed-scope study with a defined end date, this is *not* continuous cadence — even if it's research-heavy. Use the relevant method pattern (`discovery-interview.md`, `usability-testing.md`, etc.) without this overlay.

If the user describes a practice but doesn't yet have decision integration mapped, do not refuse — surface the gap and bake it into the cadence's first-month scope. The integration is buildable; refusing here would leave the team without a starting point.

## What it adds to the brief

Continuous cadence changes the brief's shape from one-shot to recurring. The 6-field canonical brief structure still applies, but the contents differ on five dimensions.

### 1. The brief scopes a rhythm, not a study

Replace the typical "research period" timeline with a recurring cadence. The brief names:

- **Cadence rhythm.** How often the team talks to users. Weekly is the most common default; bi-weekly works for smaller teams; daily is rare and usually a signal that the team is conflating support tickets with discovery.
- **Cadence duration per touch-point.** Typically 30–45 minute conversations. Longer than that is hard to sustain weekly without burning out the moderator.
- **Cadence horizon.** The brief covers an initial commitment (typically 12 weeks or one quarter) with an explicit review checkpoint at the end. Continuous cadence is *renewed*, not *open-ended* — review and recommit forces honesty about whether the practice is producing value.

### 2. Research questions are recurring and evolving

Replace the typical "3–5 prioritized research questions" with a *register* of recurring themes the team is investigating. The register is alive:

- **Core themes** the team is exploring across the quarter (e.g., "what triggers customers to evaluate alternatives?" / "where does our onboarding lose people?").
- **Active sub-questions** under each theme, refined session to session as the team learns.
- **Closed-out questions** archived once enough evidence has accumulated to make a call.
- **New questions** added as discovery surfaces them.

The discussion guide evolves week to week, not week zero to week N. The brief names this explicitly. Each session's prep includes a brief "what are we trying to learn this week?" framing tied to the active sub-questions.

### 3. Opportunity solution tree integration

Continuous cadence pairs naturally with an opportunity solution tree (Torres's model — outcome at the top, opportunities below, solutions below that, experiments below that). The brief should name:

- **The outcome** the team is working toward (the business or product metric that the cadence informs).
- **The current opportunity backlog** — the user problems the team has surfaced and is choosing among.
- **How the cadence feeds the tree.** Each conversation may produce new opportunities (added to the tree), confirm or refute existing opportunities, or generate evidence for a solution being tested.

Teams without an opportunity solution tree don't need to adopt the literal artifact, but they do need *some* structured way to accumulate what they've learned. Without accumulation, every conversation is the first one.

### 4. Team participation, not researcher-owned

Continuous cadence works when the *product trio* (PM, designer, engineer — at minimum the PM) shows up, not just the researcher. The brief names:

- **Who joins each conversation.** At least two team members per session. Rotating coverage is fine; "only the researcher" is not.
- **Roles per session.** Moderator (rotates), notetaker (rotates), observer (the rest of the trio). Rotating moderation builds team interview skills, which is half the point of the practice.
- **Synthesis owner per cycle.** Someone holds the pen on the weekly or bi-weekly synthesis. The role rotates; the responsibility is named.
- **Recruiting owner.** Continuous cadence requires *continuous recruiting*. Who runs the recruiting pipeline so that next week's sessions are already filled.

If the team can't commit two people per session, the cadence will not survive contact with sprint pressure. Surface this in the brief.

### 5. Recurring synthesis cadence

Without recurring synthesis, continuous cadence collapses into "lots of disconnected calls." The brief names:

- **Per-session debrief (15–30 min, same day or next day).** Quick capture of standout moments, surprises, and quotes worth keeping. Run as a team, not solo.
- **Weekly or bi-weekly theme review.** Cluster the week's sessions against the active sub-questions. Update the question register. Decide what to ask next week.
- **Monthly or per-cycle decision review.** Look at the opportunity tree (or equivalent). What has the cadence enabled the team to decide or de-prioritize? What's stale and should be retired? What new evidence is changing the team's mind?

Tooling for synthesis is part of the brief: Vistaly, Dovetail, Notion, or even a shared doc — but it has to be named, and it has to persist across cycles. Each week starting from a blank doc kills the accumulation.

## First-month scope advice

The most common failure mode for new continuous-discovery practices is over-scoping the first month and burning out before the cadence becomes a habit. The brief should start small:

- **Week 1–2: One conversation per week.** One PM + one designer (or engineer). Researcher coaches the format. Goal is to *run the loop*: schedule, conduct, debrief, capture.
- **Week 3–4: Two conversations per week.** Build the muscle. Start using a synthesis tool. Hold the first theme review at the end of week 4.
- **Week 5–8: Scale to target cadence.** Whatever the team committed to (3 / week, 1 / day, etc.). Add the monthly decision review at the end of week 8.
- **Week 9–12: Iterate the practice.** Adjust who attends, the synthesis cadence, the question register. The format should stabilize by week 12.

State this ramp explicitly. Teams that try to launch at full cadence ("five sessions a week starting Monday") collapse by week three. Teams that start at one a week and ramp routinely sustain.

## Tooling

The brief should name the tools the practice depends on. Continuous cadence is more tool-dependent than one-shot studies because the accumulation has to live somewhere durable.

- **Recruiting:** A continuous recruiting source. UI, an internal customer panel, or an opt-in list collected through product. Recruiting-per-study (recruit ad hoc each week) does not sustain.
- **Scheduling:** Calendly, Chili Piper, or a similar self-scheduling tool. Manual scheduling kills cadence.
- **Recording / transcription:** Granola, Otter, Fireflies, Gong, Grain — anything that captures and transcribes consistently. Pick one and stick with it.
- **Synthesis:** Dovetail (full-feature), Vistaly (opportunity-tree-native), Notion (lightweight), or a custom setup. The choice matters less than the consistency.
- **Decision integration:** Wherever the team currently makes prioritization decisions (Linear, Jira, a roadmap doc). The synthesis output has to flow into that artifact, not live separately.

Naming the tooling stack up front prevents the "we'll figure out tooling as we go" failure mode, which produces a six-week tooling delay before the practice actually starts.

## Examples

### Example: continuous cadence applied

> **Outcome the cadence serves:** Increase trial-to-paid conversion from 18% to 25% by Q3.
>
> **Cadence rhythm:** 2 customer conversations per week, 45 min each. Wednesday + Friday default slots.
>
> **Horizon:** 12-week initial commitment with a Week 12 review.
>
> **Active themes:**
> - What triggers a trial user to evaluate competitors mid-trial?
> - Where does the trial experience fail to demonstrate value in the first 7 days?
> - What signals separate trial users who convert from those who don't?
>
> **Active sub-questions (Week 1):**
> - "Tell me about the last time you started evaluating a tool like ours — what triggered it?"
> - "Walk me through the first time you used the product after signing up — what were you trying to do?"
>
> **Team participation:**
> - Moderator: rotates between PM (Maya) and designer (Jordan) week-by-week. Researcher (Sam) coaches for first 4 weeks.
> - Notetaker: engineer (Alex) for Wednesday slot; Sam for Friday slot.
> - Recruiting owner: Sam runs UI panel; auto-recruits 4 trial users per week (2 + 2 backup).
>
> **Synthesis:**
> - Same-day 20-min debrief after each session.
> - Friday afternoon weekly theme review (1 hour, full trio).
> - End of month: 90-min decision review against the opportunity tree.
> - Tooling: Vistaly for opportunity tree; Granola for transcripts.
>
> **First-month ramp:** Week 1: 1 session. Week 2: 1 session. Week 3: 2 sessions. Week 4: 2 sessions + first theme review.
>
> **Out of scope:** Quantitative validation of opportunities surfaced (that flows to a separate survey or funnel analysis); existing-customer retention research (separate practice).

### Example: continuous cadence rejected

> **Question:** Should we build the proposed onboarding redesign?
>
> **Why this fails the gate:** Single decision, fixed scope, evaluative. Continuous cadence is a *practice*; this is a *study*. Use `discovery-interview.md` for understanding the current onboarding (if needed) and `usability-testing.md` for evaluating the redesign. Continuous cadence does not apply.

### Example: ambiguous — rescope before applying

> **User says:** "We want to start doing more user research."
>
> **Why this is ambiguous:** "More research" could be one study, a cadence, or a vague aspiration. Ask: are you trying to answer a specific question soon, or build a regular practice? If the former, use a method pattern without this overlay. If the latter, apply continuous cadence with the first-month ramp.

## Skip continuous cadence when

The literature on continuous discovery is explicit about when *not* to apply this context. Skip continuous cadence if any of these hold:

- **Single fixed decision in scope.** One study, one decision, one timeline — use the method pattern directly. Continuous cadence is overhead for fixed-scope work.
- **No team buy-in to participation.** If the brief lists only the researcher as the moderator and the rest of the team as "may attend," the practice is fragile from day one. Either upgrade the commitment or scope down to a one-shot study.
- **No recruiting pipeline.** Continuous cadence dies the first week recruiting can't fill the slots. If the team has no panel, no inbound channel, no relationship with a recruiting service, building the pipeline is the first quarter's project — not the discovery practice.
- **No appetite for evolving questions.** Some teams want a fixed brief with a fixed deliverable. That's fine, but it's not continuous discovery. Use a method pattern instead.
- **Crisis-mode urgency on a specific decision.** Continuous cadence won't help if a decision is due next week. Run the study that answers the question; build the practice afterward.

When skipping continuous cadence, name *why* in the user-facing language — the four reasons above are useful framing.

## Anti-patterns

Specific failure modes to watch for and call out in review.

### Treating continuous as a series of one-shot studies

The team runs a "weekly study," sees it as 12 separate studies in a row, and never accumulates learning. Symptoms: each week's discussion guide is built from scratch, no register of active themes, no opportunity tree, no monthly decision review. The cadence becomes a treadmill. Fix: insist on the synthesis cadence and the question register in the brief, and name an artifact (tree, register, doc) that accumulates.

### No recurring synthesis

The team runs the sessions but never blocks time to look at the data together. Notes pile up. Six weeks in, no one can remember what came up in week two. The cadence produces volume but no insight. Fix: weekly theme review and monthly decision review are mandatory, not optional. If the team can't make those meetings, the cadence is not viable.

### No rhythm — sessions slip whenever sprint pressure hits

"We'll skip this week because we're crunching for release." Then "let's pick back up after the demo." Then "we lost the habit." Cadence dies. Continuous discovery requires the rhythm to be *as protected as standup* — and the team has to agree to that protection up front. Fix: state in the brief that the cadence is sprint-immune (sessions don't get bumped for crunch), and surface in review when this protection is being violated.

### Recruiting friction killing momentum

The team has to scramble each week to find participants. Sessions get rescheduled, no-shows go un-replaced, the cadence becomes 1/week instead of 2/week without anyone deciding. Within a quarter, the practice is theater. Fix: continuous recruiting is the first infrastructure investment. Without a flow that fills slots automatically, the cadence has no foundation.

### Researcher-owned, not team-participatory

The researcher runs all the sessions, takes all the notes, writes all the synthesis. The team attends "if they can." The practice never becomes the team's habit — it stays the researcher's hobby. When the researcher moves teams, the practice dies. Fix: minimum two team members per session, rotating moderation, team-owned synthesis cadence.

### No decision integration

The cadence produces synthesis. The synthesis lives in a Notion doc no one outside the trio reads. The roadmap is set in a separate meeting with no reference to the cadence's output. Continuous discovery has become continuous note-taking. Fix: the synthesis output must flow into wherever the team makes prioritization decisions, named explicitly in the brief.

### "Continuous" used as cover for "no scope"

"We don't need to scope it because it's continuous." Continuous cadence is *less* scoped than a one-shot study, not unscoped. The brief still names the cadence, the active themes, the team, the synthesis pattern, the horizon. "Continuous" is not a synonym for "vague."

### Confusing customer support with discovery

The team starts routing support escalations into the discovery cadence ("our weekly customer call this week is with an angry user"). The cadence becomes reactive customer triage, not proactive discovery. Both have value; they're different practices. Keep them separate.

## Related patterns

- **Method patterns** — Each session in a continuous cadence uses a discovery-interview-shaped format (see `references/patterns/methods/discovery-interview.md`). The cadence context overlays on top of that method; it does not replace it.
- **Anti-patterns / validation framing** — Continuous cadence is vulnerable to drifting into validation theater (running sessions to confirm decisions already made). Cross-reference the validation anti-pattern when reviewing a cadence brief.
- **Pre-flight gate** — Continuous cadence does not bypass the pre-flight gate. Run it on the *practice itself*: does the team have agency to act on what they learn? Is the practice substituting for analytics it shouldn't? Will the synthesis actually inform decisions, or is it theater?
- **Rapid cadence** — These are opposites, not variants. Rapid cadence compresses a *one-shot* project; continuous cadence sustains an *ongoing* practice. They never apply simultaneously.
