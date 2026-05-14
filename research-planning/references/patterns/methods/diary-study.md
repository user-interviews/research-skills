# Method pattern: diary study

Diary studies capture self-reported behavior, attitudes, or experiences over time — typically 1–4 weeks of regular entries from each participant, with bookend interviews at the start and end. The unit of analysis is *change over time* or *episodic frequency*, not a single snapshot. The question is "what happens across days / weeks?" — not "what's the experience like right now?" See `references/methodology-selection.md` for how this method gets picked; this file shapes the brief once it has been selected.

## When this pattern applies

Apply this pattern when the research question matches one or more of these shapes:

- "How does [behavior / attitude / satisfaction] change across [time horizon]?"
- "What does the journey look like across [adoption / onboarding / habit formation / project lifecycle]?"
- "How often does [episodic event] happen, and what surrounds it when it does?"
- "What happens between the moments we already capture in interviews?"
- "How do [audience] use this product across a real work week (or month)?"

Triggers for routing to this pattern:

- The research question is about behavior or attitude *change* over time.
- The behavior is *infrequent* or *episodic* — it doesn't happen on demand inside an interview slot.
- A single interview would force the participant to summarize from memory; the texture would be lost.
- The team needs to see the *gaps between moments* — the unmemorable hours that shape the memorable ones.
- The question would otherwise require an unrealistic number of return interviews.

Do NOT route to diary studies when:

- The behavior is observable in a single visit — use ethnographic research instead.
- The question is about a one-time decision or event — discovery-interview applies.
- The team needs results in under 4 weeks — diary studies don't compress.
- The team can't sustain a 2–4 week active commitment to participant management — diary studies fail without daily-or-weekly engagement.
- The behavior is so frequent that observation could cover it efficiently.

## What it adds to the brief

The default brief sections stay, but methodology and logistics sections get diary-specific content. Add these to the brief:

- **Entry cadence.** Name it precisely. Daily entries for a 1–2 week study; weekly entries for a 3–4 week study; event-triggered entries (participant logs every time X happens) for episodic studies. Cadence drives everything else — recruiting commitment, incentive structure, tooling, attrition planning.
- **Prompts per entry.** Draft 3–6 prompts the participant answers each entry. Mix prompt types: one numeric (e.g., a 1–5 mood or satisfaction scale), one short-answer ("what was the most frustrating moment today?"), one optional photo or screen recording. Numeric scales make trends visible; short answers carry the texture; media captures context that text would miss.
- **Incentive structure (two-part).** Diary studies *must* incentivize completion, not just enrollment. Use a two-part structure: a per-entry incentive (small — $5–10) plus a completion bonus (large — 50–75% of total incentive paid only if the participant completes ≥80% of entries plus both bookend interviews). One-shot incentives kill compliance.
- **Over-recruit 25–30%.** Attrition is the diary-study tax. If you need 10 completers, recruit 13. Bake this into the recruiting plan, not the contingency plan.
- **Bookend interviews (start + end).** Two 30–45 minute interviews per participant: one before the diary period (kickoff, expectation-setting, baseline) and one after (synthesis with the participant, going back to flagged entries). Skip the bookends and the diary becomes a stream of disconnected entries without baseline or interpretation.
- **Tooling.** Name the platform — Dovetail, dscout, Indeemo, Ethos, even a private Slack channel or a Google Form for low-budget studies. The tooling determines what's possible (media, location data, push notifications) and what's friction (login complexity, mobile vs. desktop, time to complete an entry). Friction per entry is the silent killer of diary studies.

Also surface in the brief:

- The time horizon (1 week / 2 weeks / 4 weeks) tied to the research question. Longer is not better.
- A participant-management plan: who checks in mid-study, how non-responders are nudged, who triages technical issues.
- Whether entries are visible to the researcher in near-real-time (allowing follow-up probing) or batched (analyzed after the study ends). Near-real-time visibility is the higher-signal default.

## Defaults

**Sample size:** N=10–15 *completers* per audience segment. The completion qualifier matters — recruit 13–20 to land 10–15 completers. Smaller than 10 and patterns are unreliable; larger than 15 and the qualitative analysis load becomes punishing.

**Study duration:** Pick by question shape.

- *1 week* — for high-frequency behaviors or short-cycle changes (e.g., daily habit, first-week onboarding).
- *2 weeks* — the most common duration; captures a full work-cycle's worth of variation.
- *3–4 weeks* — for slow-changing attitudes, longer adoption arcs, or low-frequency episodes. Longer than 4 weeks rarely justifies the attrition cost.

Default to 2 weeks unless the question genuinely requires more.

**Entry cadence:** Daily for 1–2 week studies; weekly for 3–4 week studies; event-triggered for episodic studies. Daily entries on a 4-week study guarantee attrition.

**Entry length:** Keep individual entries to under 5 minutes of participant time. The brief should state this target and pressure-test the prompt count against it. Six prompts is usually the ceiling; three is often plenty.

**Bookend interviews:**

- *Kickoff (30–45 min, before Day 1):* Establish baseline, walk through the tool, set expectations, build rapport, surface anything the participant wants the team to know up front.
- *Wrap (45–60 min, within a week of last entry):* Review flagged entries together, ask the synthesis-level questions the diary couldn't ("looking back across the two weeks, what changed?"), capture the participant's own pattern recognition.

**Recording:** Bookend interviews recorded with consent. Diary entries themselves are the record; entries with media (photos, audio, video) are higher-signal than text-only but require a tool that supports them.

**Incentive structure:** Two-part, biased toward completion.

- *Per-entry:* $5–10 for daily entries, $15–25 for weekly entries (lower frequency, more substantial each).
- *Completion bonus:* 50–75% of total incentive, paid only if the participant completes ≥80% of entries and both bookend interviews.
- *Bookend interviews:* paid separately at standard interview rates ($75–150 per interview).

Total per participant for a 2-week daily diary with bookends: typically $300–500. Lower for consumer studies, higher for professional / specialist audiences.

**Participant management:** Name a single point of contact who monitors the tool daily and reaches out to non-responders within 48 hours of a missed entry. Diary studies without active management lose 30–50% of participants to drift.

**Near-real-time visibility:** Strongly preferred over batched. When the researcher sees entries within 24 hours of submission, they can:

- Probe a surprising entry in the next check-in.
- Nudge a vague response toward more specificity.
- Catch tooling failures (uploaded photos that didn't save, etc.) early.

**Synthesis cadence:** Plan a synthesis block at the midpoint of the study, not just at the end. Mid-study synthesis surfaces themes early and allows adjustment of the wrap-interview guide.

**Pilot:** Run a 2–3 day pilot with 1–2 participants before the main study launches. Pilots almost always surface a prompt that doesn't make sense out of context, a tool friction point, or an incentive ambiguity. Re-recruit pilots if they show severe issues; otherwise roll them into the main cohort.

## Examples

**Good entry prompt (specific, anchored, short):**

> "What was the most frustrating moment in your work today, and what were you trying to do when it happened?"

Specific (a moment, not a summary), anchored in actual behavior (what they were trying to do), and short enough to answer in under 2 minutes.

**Bad entry prompt (vague, summary, leading):**

> "How was your day overall? Do you feel like the product helped you?"

Asks for a summary the participant will mostly fake, and leads toward a positive evaluation.

**Good prompt set (mixed types, 4 prompts, ~4 min total):**

1. *(scale)* How satisfied were you with [workflow] today? (1–5)
2. *(short answer)* What's one moment that stood out — good, bad, or surprising?
3. *(short answer)* If you got stuck on anything, what were you trying to do?
4. *(optional photo / screen recording)* If something visual would explain what happened today, capture it.

The scale produces a trend line; the short answers carry texture; the optional media catches what text can't.

**Bad prompt set (too long, all open-ended, no structure):**

1. Tell us about your day.
2. What did you work on?
3. What was hard?
4. What was easy?
5. What would you change about the product?
6. What would you change about your workflow?
7. Anything else?

Too long, no scaffolding, no scale to make trends visible, and the last few prompts produce wishlist-ware rather than behavioral signal.

**Good two-part incentive (2-week daily diary):**

- $7 per daily entry (14 days × $7 = $98 maximum)
- $150 completion bonus (paid if ≥11/14 entries + both bookends)
- $100 each for kickoff + wrap interviews
- Total: up to $448 per completer

The completion bonus is large enough to matter and conditional on the behavior that actually produces useful data.

**Bad single-part incentive (same study):**

- $200 paid upfront on enrollment

Participants who change their mind on Day 3 already have the money; attrition climbs sharply.

**Good attrition planning:**

> Recruit 13 to land 10 completers. Monitor entries daily; reach out to any non-responder within 48 hours. Replace participants who drop in the first 3 days; do not replace later drops (the cohort is the cohort).

**Bad attrition planning:**

> Recruit 10, hope they finish.

## Analysis and synthesis defaults

The brief should name how findings get from a pile of entries to a shared artifact. For diary studies, the synthesis pattern is longitudinal:

- **Per-participant arc.** For each completer, produce a 1-page arc: starting baseline (from kickoff), key moments across the diary period, ending state (from wrap). The arc is the analytic unit, not the individual entry.
- **Cross-participant patterns.** Cluster arcs into 3–5 patterns. Patterns describe *trajectories* ("satisfaction rose during week 1 and then dropped sharply after the first integration setup") rather than static states ("users like the onboarding").
- **Numeric trend overlay.** If scale prompts were used, plot the per-day or per-week averages across the cohort. Trend lines are visually persuasive and surface inflection points that the qualitative data then explains.
- **Surprising-entry register.** A list of entries that the researcher flagged as surprising during the field period, with a one-line interpretation per. Surprising entries often anchor the strongest themes.
- **Verbatim quotes per pattern.** 2–3 strong quotes per pattern, pulled from entries or wrap interviews. Diary entries often produce the most quotable language because participants write in their own moment.
- **Implications, not recommendations.** Diary studies surface what changed and what caused it; they do not directly produce design specifications. Frame implications.

Name a synthesis owner and a midpoint + final readout in the brief.

## Anti-patterns

- **Too long.** A 4-week daily diary with no plan for attrition will burn 50% of participants. Match duration to the question; don't add weeks "just in case."
- **Entries too open-ended.** "Tell us about your day" produces nothing usable. Specific, anchored prompts produce evidence.
- **No incentive structure.** Single up-front payment, or per-entry only with no completion bonus, both produce drift. The completion bonus is the discipline.
- **No bookend interviews.** Without the kickoff, there's no baseline; without the wrap, there's no participant-side interpretation of the data. Skipping either turns the diary into a stack of disconnected entries.
- **No participant management.** Studies that "self-run" on a platform without active touch-points lose participants silently. Name an owner who checks in daily.
- **No mid-study synthesis.** Waiting until the end means you miss the chance to probe surprising entries in real time. Synthesize at the midpoint.
- **Daily entries on a 4-week study.** The cadence has to match the duration. Daily-for-4-weeks is a recipe for attrition; weekly-for-2-weeks is a recipe for too little data.
- **Treating diary entries as standalone evidence.** Diary entries are partial — they need the bookend interviews to interpret them. A surprising scale dip on Day 8 means nothing until the wrap interview surfaces what happened on Day 7.
- **Skipping the pilot.** Diary studies launch with more friction than any other method. The pilot exists to catch the friction before it taxes 13 participants.
- **Over-recruiting demographically.** Diary studies are expensive per participant; demographic recruiting will surface people who don't actually do the behavior. Use behavioral recruit criteria.

## Brief deltas summary

Quick checklist of what the diary-study pattern adds to the default brief. The agent generating the brief should confirm each item is present:

- [ ] Entry cadence named (daily / weekly / event-triggered).
- [ ] Study duration tied to question shape (1 / 2 / 3–4 weeks).
- [ ] 3–6 prompts per entry, mixed types, <5 minute target per entry.
- [ ] Two-part incentive structure (per-entry + completion bonus).
- [ ] Recruit number set to 25–30% above target completer count.
- [ ] Kickoff bookend interview (30–45 min, before Day 1).
- [ ] Wrap bookend interview (45–60 min, within a week of last entry).
- [ ] Tooling platform named with rationale.
- [ ] Participant-management owner named with check-in cadence.
- [ ] Near-real-time visibility plan (preferred) or batched-analysis acknowledgement.
- [ ] Mid-study synthesis block scheduled.
- [ ] Pilot with 1–2 participants before main launch.
- [ ] Sample size: 10–15 completers per segment.

## Cross-references

- Methodology selection: `references/methodology-selection.md`
- Ethnographic research (alternative for behavior-in-context, but snapshot rather than longitudinal): `references/patterns/methods/ethnographic.md`
- Discovery interview (used for the bookend interviews; share prompts and probing technique): `references/patterns/methods/discovery-interview.md`
- Sample sizes (authoritative table): `references/sample-sizes.md`
- Anti-patterns library (full): `references/anti-patterns.md`
- Question writing (specific / actionable / practical filter): `references/question-writing.md`
