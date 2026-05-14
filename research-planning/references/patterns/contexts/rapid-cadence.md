# Context: Rapid cadence

A *context* modifies a brief — it overlays whatever project type, method, and framework you've already picked. Rapid cadence is the "tight timeline" overlay. It compresses the schedule, names a team model, and bounds the methods. It does **not** make every step faster; it makes the *project* smaller.

## When this context applies

Apply rapid cadence when **all three** are true:

- **Timeline is short.** Typically under 2 weeks from kickoff to share-out. If the work fits comfortably in a normal sprint, you may not need this context at all.
- **Sprint pressure or stakeholder urgency.** Someone said "we need this fast," "before the next sprint," "by EOW," or "we can't wait for a full study."
- **The question is tactical, not strategic.** Rapid cadence is for narrow, decision-adjacent questions. Strategic / foundational research does not compress.

Trigger phrases to watch for:
- "We need this fast"
- "Quick research before we decide"
- "Sprint-aligned"
- "Rapid round"
- "Lightweight version of X"
- "Just enough to de-risk"

If the user says "fast" but the question is foundational (e.g., "who are our users"), do not apply rapid cadence. Push back and recommend foundational research at the appropriate scope — or scope down the question, not the rigor.

## What it adds to the brief

Rapid cadence overlays four changes on the canonical brief.

### 1. Schedule becomes a per-day timeline

Replace the generic "next 2 weeks" schedule with a 15-day, phase-keyed calendar. This forces commitments and reveals collisions early.

**Day 1–2 — Plan the rapid study**
- Define objectives and research questions
- Identify data sources and existing evidence (skip if it's already answered)
- Start recruiting
- Develop the research plan and confirm the 15-day timeline with stakeholders

**Day 3–5 — Conduct**
- Run the sessions (intercepts, usability, concept tests, whatever the method shortlist landed on)
- Light notes captured live; no deep-dive write-ups mid-stream

**Day 6–8 — Analyze**
- Tag transcripts or notes
- Identify the 3–5 strongest findings — not every signal, just the ones that move the decision

**Day 9 — Synthesize and share**
- Produce the readout (deck, doc, or Loom)
- Share with the decision-maker on Day 9, not Day 15

**Day 10–11 — Document into research repository**
- File the readout and raw artifacts in the team repo
- Tag participants for re-contact

**Day 12–15 — Review and finalization**
- Stakeholder Q&A
- Follow-up on activation: what changed because of this, who owns the next step

If the team can't commit people to these dates, do not run the study. Slipping any phase by 2+ days breaks the cadence — at that point, you're running normal-pace research badly.

## Express variant (1-3 days)

A tighter sub-variant of rapid cadence for cases where modern AI-moderated, unmoderated, or in-product methods can produce directional signal in days, not weeks. Express is **not** "rapid, but faster" — it's a different shape, with a narrower scope gate and a bounded method shortlist.

### When Express applies

Apply Express only when **all five** are true:

- **Scope is narrow.** One specific question, not exploratory. "Does the new pricing copy read as 'per-seat' or 'flat-rate'?" qualifies. "How do users feel about pricing?" does not.
- **The decision is binary or short-list.** Pick A vs. B, ship vs. don't, top 3 of 8. If the decision space is open-ended, Express won't close it.
- **Method permits.** AI-moderated, unmoderated, in-product survey, or async-short-diary only. Real-time human probing doesn't fit a 1-3 day window.
- **Audience accepts directional evidence.** The consumer of insights is choosing speed-to-decision over thoroughness, and knows the readout will be directional. If the audience needs defensible quantitative anchors or executive-grade rigor, Express is wrong.
- **Foundational fields are already clear before kickoff.** Why / What / Who (audience + subjects) are confirmed. Express has no slack for re-scoping mid-study.

If any of these fail, fall back to the 15-day rapid cadence above. The temptation to compress further when a foundational field is fuzzy is the most common failure mode.

### Timeline (1-3 day scaffold)

- **Day 1 morning** — Pressure-test the discussion guide / unmoderated tasks / survey questions (yourself or a teammate). Catch broken logic, ambiguous wording, mis-firing branching before it scales.
- **Day 1 afternoon → Day 2 morning** — Recruit + field. Use an existing customer panel, in-product survey, or async unmoderated platform. No cold recruiting on this timeline.
- **Day 2 afternoon → Day 3 morning** — Quick synthesis. Budget ~10 minutes per response or session. Capture the top 3 findings, not all signals.
- **Day 3 afternoon** — Readout. 15-min Slack post or 1-page memo. No deck. Decision-maker sees it the same day fielding closed.

### Methods bounded to

- **AI-moderated interview** (Outset/Strella style). Pressure-test the guide before launch — see `references/patterns/methods/ai-moderation-fit.md`.
- **Unmoderated usability test** (Maze, UserTesting). Tasks, not interviews.
- **In-product survey** (Sprig, Pendo). ≤5 questions, targeted segment.
- **Async diary** — 1-2 entries only, not longitudinal. If the question needs >2 entries, it's not an Express question.

### NOT for

- **Strategic decisions** — positioning, market entry, roadmap pivots. These need depth Express can't provide.
- **Niche populations** — recruiting alone will take longer than 1-3 days. If the audience needs custom sourcing, fall back to rapid or standard.
- **Generative discovery** — Express cannot answer "what don't we know we don't know." Generative work needs human probing and follow-up loops.

### Anti-patterns

- **Skipping the pressure-test "to save time"** — Quality drops sharply at scale without it. The Day 1 morning pressure-test is non-negotiable; it's what makes the rest of the timeline trustworthy.
- **Express on a strategic question** — Wrong scope. If the answer changes a quarterly plan, Express isn't the right vehicle.
- **Treating Express as the default** — Express is for narrow, well-scoped questions with clear foundational framing. A team that defaults to Express will produce a stream of directional answers that don't add up to anything decision-grade.

### 2. ReOps section is mandatory

Rapid cadence only works with a clear team model. Add a **ReOps** section to the brief naming who fills each role:

- **Notetaker** — captures sessions live; rapid cadence has no time for after-the-fact transcript cleanup
- **Moderator** — runs the sessions
- **Observer** — at least one stakeholder per session (this is how rapid cadence buys stakeholder buy-in fast)
- **Prototyper** — if the method involves a stimulus (concept test, usability), name who's producing it
- **Product partner** — the decision-maker the research is for

Also name:
- **Cadence** — is this a one-off rapid round, or part of a recurring rapid program?
- **Model** — embedded researcher vs. on-demand vs. partner-led

If roles are unfilled, surface the gap in the brief. Don't write "TBD" — name the person or block the project.

### 3. Method section bounded to tactical only

Rapid cadence is for tactical methods. Restrict the method shortlist to:

- Intercept interviews (1–3 questions, in-context, short)
- Usability studies (on existing flows or low-fi prototypes)
- Concept testing (single concept or A/B between two)
- Light survey work (≤10 questions, existing audience)
- User journey evaluations (mapping a known flow, surfacing friction)
- Literature reviews (existing internal or external sources)
- Competitive analysis (heuristic walkthroughs of competitors)

**Not** for:
- Generative interviews aimed at unknown-unknowns
- Diary studies, ethnography, longitudinal work
- Strategy or vision-level questions
- Multi-segment foundational discovery

If the natural method for the question is not on the tactical list, the question is not tactical. Either rescope or drop the rapid context.

### 4. Cut "deep-dive" sections — scope what gets done, name what doesn't

Rapid cadence means **bounded**, not flexible. The brief should explicitly state what's out of scope:

- "We will not deep-dive on the [adjacent topic]; logged for a future round."
- "We will not segment beyond [primary persona]; secondary segments deferred."
- "We will not run quantitative validation on findings; this is directional."

This is the most important discipline. The temptation in rapid work is to keep saying yes mid-study. Naming the cuts in the brief gives you something to point to when scope creep starts.

## Examples

### Example: rapid cadence applied

> **Question:** Does the new pricing page accurately communicate which features are available to new users?
>
> **Context:** Engineering ships in 2 weeks. We need a go/no-go on the current draft.
>
> **Schedule:**
> - Day 1–2: Recruit 6 trial-stage users, finalize 5-task usability protocol
> - Day 3–5: Run 6 unmoderated usability sessions
> - Day 6–8: Tag, identify top friction points
> - Day 9: Readout to PM + design lead
> - Day 10–11: File in repo
> - Day 12–15: Q&A, decide on pricing-page fixes vs. ship-as-is
>
> **ReOps:**
> - Moderator: unmoderated (Maze)
> - Notetaker: N/A (auto-transcripts)
> - Observer: PM joins debrief on Day 9
> - Prototyper: Design lead supplies final pricing-page draft
>
> **Method:** Unmoderated usability with 5 tasks, 6 participants.
>
> **Out of scope:** Existing-customer pricing perception; competitive pricing comparison; price-point optimization. All deferred to future rounds.

### Example: rapid cadence rejected

> **Question:** Who are our power users and what do they want from us in the next 12 months?
>
> **Why this fails the gate:** Foundational / strategic — needs generative work, multi-segment, longitudinal signal. 15 days won't produce a defensible answer; it will produce a flat one. Recommend a 6–8 week foundational study instead, or scope the question down to one decision (e.g., "Does the proposed retention feature address our top power-user complaint?") and run rapid on that.

## Skip rapid when

The literature on rapid research is explicit about when **not** to apply this context. Skip rapid cadence if any of these hold:

- **Inconclusive outcomes likely.** If the team will need follow-up rounds to act, run the full study once instead of two truncated ones.
- **Bigger scope than rapid can handle.** Multi-segment, multi-product-surface, or multi-decision questions don't compress without losing fidelity.
- **Lack of organizational support.** Rapid cadence depends on tight roles and fast decisions. If stakeholders won't observe sessions, won't show up on Day 9, or won't commit to acting on findings, the cadence breaks.
- **Limited method options for the question.** If the question really needs ethnography or diary work, rapid can't help. The tactical method shortlist is the constraint, not a suggestion.

When skipping rapid cadence, tell the user *why* — not just that you're declining. The four reasons above are useful framing.

## Anti-patterns

Specific failure modes to watch for and call out in review.

### "Rapid" that's actually same-speed as normal research

Rapid cadence is **not** "the same study, faster." Each step takes about the same time per session it would normally take. The compression comes from scope, not pace. If the brief looks like a full study with deadlines moved up, you've fallen into this trap. Cut sessions, cut segments, cut depth — don't squeeze the same volume of work into fewer days.

### Strategic question forced into rapid scope

"Why are users churning?" is not a rapid question. "Did the new onboarding step reduce confusion in the first session?" might be. If the user is pushing a strategic question into rapid framing, do one of two things: rescope to a tactical sub-question, or recommend foundational research with a longer timeline. Don't produce a 15-day brief for a question that needs 6 weeks.

### Scope creep mid-flight

"While we're at it, can we also..." is the rapid-cadence killer. The brief's *out-of-scope* section is what you point to when this happens. If new questions emerge during the study, log them as inputs to the next round — do not absorb them into the current one.

### Treating rapid as default

Rapid cadence is for **specific cases** with tactical questions, tight stakeholder support, and bounded scope. It is not the default mode for a team that wants to "ship faster." Teams that default to rapid produce shallow research that doesn't move decisions, which generates more stakeholder skepticism, which produces more pressure to go rapid. Break the cycle: name when the question warrants foundational work and protect the time for it.

### Skipping the ReOps section

A rapid brief without named roles is a wish, not a plan. Notetaker, moderator, observer, prototyper, product partner — all of these need names. "TBD" in any field means the brief is not ready to execute.

### Burying the cuts

If the brief doesn't explicitly state what's out of scope, mid-study scope creep is guaranteed. The cuts are not a footnote — they are the discipline that makes rapid cadence possible. Surface them in the same section as the schedule.

## Related patterns

- **Method patterns** — Apply the tactical method shortlist constraint by routing to specific method patterns (intercept, usability, concept test, light survey). Rapid cadence is a context overlay; the method pattern still drives the discussion guide and recruiting plan.
- **Anti-patterns/scope-creep** — Rapid cadence is the context most exposed to scope creep. Cross-reference the scope-creep anti-pattern when reviewing a rapid brief.
- **Pre-flight gate** — Rapid cadence does not bypass the pre-flight gate. Run that first. Rapid cadence only modifies *how* the work is scheduled and scoped after the gate confirms research is the right move.
