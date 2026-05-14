# Method pattern: ethnographic research

Ethnographic research observes people in their actual environment — at their desk, on the shop floor, in their kitchen, riding along on a sales call. The unit of analysis is *behavior in context*, not self-reported behavior. The question is "what do people actually do?" — not "what do people say they do?" See `references/methodology-selection.md` for how this method gets picked; this file shapes the brief once it has been selected.

## When this pattern applies

Apply this pattern when the research question matches one or more of these shapes:

- "How do [audience] actually [do the job] in their real environment?"
- "What workarounds, hacks, or shadow tools do [audience] use that they wouldn't think to mention?"
- "What does the physical / digital / social context look like when [behavior] happens?"
- "Where does our product fit (or fail to fit) into the broader workflow?"
- "What's invisible to us because [audience] doesn't think it's worth describing?"

Triggers for routing to this pattern:

- The research question is about how people behave in their actual environment, not how they describe their behavior.
- The team suspects there's a gap between what users say and what users do (stated vs. revealed behavior).
- The work crosses tool boundaries, time boundaries, or social boundaries that no single interview can reconstruct.
- The context itself (room, team, hardware, interruptions) is part of the system being studied.
- Self-report would systematically miss the texture — e.g., workflow improvisation, tacit knowledge, environmental constraints.

Do NOT route to ethnographic research when:

- A specific artifact exists and the question is evaluative — usability-testing applies.
- The question is about motivations or decision-making *recalled* by the participant — discovery-interview applies; you don't need to be on-site for past-behavior recall.
- The audience can't be observed for logistical or privacy reasons (e.g., regulated environments, sensitive personal contexts) — fall back to diary study + discovery interview.
- The team has decided what to build and wants research to confirm it — ethnography is too expensive to spend on validation theater.

## What it adds to the brief

The default brief sections stay, but methodology, participants, and logistics sections get ethnography-specific content. Add these to the brief:

- **Observation protocol — what to watch.** Name the 4–6 behaviors or moments the observer is there to capture: tool-switching, interruptions, workarounds, hand-offs, error recovery, the gap between "official" and "actual" workflow. The protocol prevents the observer from drifting into a generic interview.
- **Observation protocol — what to avoid intervening on.** Equally important. Ethnographers do not coach, correct, suggest, or explain. Name the temptations to resist: "don't explain how the product is supposed to work," "don't suggest a faster way," "don't fill silences." The observer's job is to disappear, not to facilitate.
- **Consent for on-site recording.** On-site visits raise the consent bar. Spell out: who else might be in frame (colleagues, family, customers), what happens if a third party walks into the room, what's recorded vs. note-only, how to handle confidential material that surfaces (whiteboards, screens, paperwork). Get consent in writing before the visit, not at the door.
- **Field notes structure.** Standardize on four columns: *did* / *said* / *felt* / *environment*. "Did" captures behavior. "Said" captures verbatim language. "Felt" captures observable affect (frustrated, hesitant, confident — never inferred motivations). "Environment" captures the physical or digital context (paper notes taped to the monitor, three browser tabs open, dog barking, manager walking by). Without the four-column scaffold, field notes drift into interpretation.
- **Follow-up debrief (15–30 min, end of visit).** Time-boxed conversation at the end of the visit to ask about moments the observer flagged: "I noticed you opened a spreadsheet to look up X — can you walk me through what that was?" The debrief is where stated-vs-revealed gaps get surfaced. Save interpretive questions for the debrief; do not ask during observation.
- **Stated-vs-revealed framing.** Name explicitly in the brief that the study's value is the gap between what participants would have said in an interview and what they actually did. The synthesis will pair stated quotes from the debrief with observed behaviors from the visit. This is the load-bearing analytic move.

Also surface in the brief:

- Site logistics: where the visit happens, travel time, day-of-week constraints, who the on-site host is, what the observer needs to bring (laptop with cellular, paper notebook, audio recorder).
- Whether the observer is shadowing (continuous presence) or sampling (dropping in across the day).
- A non-disclosure plan for any confidential material that surfaces (most professional contexts will surface some).

## Defaults

**Sample size:** N=4–8 participants. Ethnography is expensive per session and the analytic depth comes from texture, not breadth. Four is the floor (any fewer and pattern-finding gets thin); eight is the practical ceiling for most teams. UI's Field Guide cites smaller samples for high-depth methods; ethnography is the canonical example.

**Visits per participant:** 1–2 visits. A single visit captures the snapshot; a second visit (1–2 weeks later) captures whether what you saw was representative. For longitudinal questions, pair with a diary study (`references/patterns/methods/diary-study.md`) instead of more visits.

**Session length:** 60–90 minutes per visit. Shorter than 60 and the observer is interrupting the natural rhythm; longer than 90 and the participant's behavior starts shifting (fatigue, self-consciousness, eagerness to be done). For shadowing studies covering a defined work block, longer is acceptable — but plan breaks for both observer and participant.

**Observation-to-debrief ratio:** Roughly 75/25. A 90-minute visit is ~65 minutes observing, ~20–25 minutes debriefing. Don't let the debrief eat the observation — it's the observation that you can't get from a discovery interview.

**Recording:** Audio always (with consent), video when consent allows and the visual context matters (workspace layout, screen content, physical tools). Many sites will not allow video; plan for audio + field notes as the default and treat video as the exception.

**Note-taking:** Two-observer model is high-value where budget allows — one observer captures field notes, the other handles the debrief and tracks conversation threads. With one observer, lean on the four-column field-notes structure and the audio recording.

**Incentive:** Higher than interview incentives because the time and access burden is higher. Typical ranges: $200–400 for 90-minute consumer visits; $300–600 for professional contexts; $500+ for senior or specialist roles. For on-site professional visits, the incentive may flow to the company (gift card, charitable donation) rather than the individual — check during recruiting.

**Recruit screener:** Behavioral and recent. Demographics alone are useless for ethnography. Ask about the specific behavior, the specific context, and frequency in the last 30–90 days. See `references/patterns/methods/discovery-interview.md` for screener strategy; the same principles apply.

**Pilot visit:** Run one pilot visit before the main round, especially when the site type is new (first home visit, first hospital visit, first field-sales ride-along). Pilots almost always surface a logistics issue (battery dies, dog interrupts, building badge process), a protocol issue (the observer talks too much), or a consent ambiguity. Treat the pilot as protocol investment.

**Synthesis cadence:** Schedule a synthesis block after every 1–2 visits. Ethnography produces dense, idiosyncratic data; waiting until the end risks losing the texture of early visits.

## Examples

**Good observation focus (concrete, behavioral):**

> Watch for the moments when the participant switches between tools — what triggers the switch, what they're trying to accomplish, how long it takes, whether they verbalize a complaint about it.

This is observable. It will produce evidence.

**Bad observation focus (vague, evaluative):**

> Get a sense of whether the participant likes the workflow.

This is not observable. It will produce opinions, not behavior.

**Good debrief prompt (anchored in observed moment):**

> "About 20 minutes in, when you copied the data out of the dashboard and into a spreadsheet — can you walk me through what was going on? What were you trying to do?"

Anchors the question in a specific observed moment. Surfaces the reasoning behind the behavior without leading.

**Bad debrief prompt (leading or evaluative):**

> "It seemed like you were frustrated with the dashboard — did that feel hard to use?"

Telegraphs the answer and invites the participant to confirm the observer's interpretation.

**Stated-vs-revealed example:**

> In the recruit screener, the participant said they "use the CRM daily to log every customer interaction." During the on-site visit, the observer watched the participant log three interactions in a paper notebook over the course of two hours and never open the CRM. The debrief surfaced the workaround: "I log into the CRM at the end of the day so my manager sees the numbers." This gap is the finding. Neither half — the stated practice nor the revealed practice — would have been visible without the other.

**Good field-notes excerpt (four-column structure):**

| Time | Did | Said | Felt | Environment |
|---|---|---|---|---|
| 0:14 | Opened CRM tab, scrolled past 4 alerts, closed tab | "Yeah I always close those" | mild irritation, audible sigh | 3 browser tabs open; sticky note on monitor reads "DO NOT FORGET WEEKLY REVIEW" |
| 0:18 | Switched to spreadsheet, copy-pasted account name from email | (silence) | focused, neutral | Email inbox has 217 unread; spreadsheet titled "ACCOUNTS_REAL" |

The structure forces separation of behavior, language, observable affect, and context. The interpretation comes in synthesis, not in the notes.

## Analysis and synthesis defaults

The brief should name how findings get from raw field notes to a shared artifact. For ethnographic research, the synthesis pattern is layered:

- **Per-visit summary (within 24 hours).** A 1–2 page narrative per visit covering: what the participant did, key moments, surprises, the stated-vs-revealed gaps surfaced. Write this while the texture is fresh.
- **Cross-visit themes.** Cluster across visits into 4–6 themes. Themes name a pattern of behavior-in-context, not a feature complaint. "Account reps maintain a parallel paper system because the CRM punishes accurate logging" is a theme; "the CRM is hard to use" is a symptom.
- **Stated-vs-revealed register.** For each theme, name the stated story (what participants would have told an interviewer) and the revealed reality (what the observer saw). Pair them in the readout — the gap is the finding.
- **Behavior anchors per theme.** Concrete moments from the field notes, with verbatim quotes from the debrief. Themes without behavior anchors drift into opinion.
- **Implications, not recommendations.** Ethnography surfaces context; it does not directly produce design specifications. Frame implications ("this suggests the team should investigate the parallel-paper system before redesigning the CRM logging flow") rather than prescriptions.

Name a synthesis owner and a target readout date in the brief. Schedule the per-visit summaries during the field period, not after.

## Anti-patterns

- **Treating ethnography as interview-only.** "We'll just chat with them at their desk for 90 minutes." That is not ethnography; that is a discovery interview in a different location. The observation has to actually be observation — watching the work happen, with the observer's mouth mostly closed.
- **Leading questions during observation.** "It looks like you're stuck — would the product be easier if it did X?" Destroys the data point and biases the rest of the visit. Save all interpretive questions for the debrief.
- **Interrupting workflow.** When the participant gets stuck, hesitates, or starts to ask for help, the urge to coach is strong. Coaching contaminates the observation. The stuck moment is the finding; let it happen.
- **Stated-only synthesis.** Writing the readout from the debrief quotes without grounding in the observed behavior. This collapses the method back into a discovery interview and loses the load-bearing analytic move. Every theme needs a behavior anchor.
- **Treating ethnography as a usability test in disguise.** Bringing a prototype to the on-site visit and watching the participant click through it. That's usability testing in a different room. Ethnography is for understanding the world the product enters; if the product is the focus, run usability-testing instead.
- **Site logistics treated as recruiting overhead.** The site is part of the data. If the brief doesn't name how site access works (who lets the observer in, what badge process applies, what happens if a meeting room is double-booked), the visits will burn an hour each on logistics that should have been pre-resolved.
- **No consent plan for third parties.** People other than the participant will appear in the visit. The brief needs a plan for what to do when they do: explain the study, get verbal consent, exclude them from notes if they decline, leave the room if necessary. Without this, the study generates privacy and legal exposure.
- **One-and-done with no debrief.** Skipping the post-visit debrief saves 20 minutes and loses 50% of the analytic value. The debrief is where stated-vs-revealed gaps get surfaced.
- **Treating context as decoration.** Field notes that capture what the participant did without capturing the environment around them lose the "in context" part of "behavior in context." The four-column structure exists to prevent this.

## Brief deltas summary

Quick checklist of what the ethnographic pattern adds to the default brief. The agent generating the brief should confirm each item is present:

- [ ] Observation protocol naming 4–6 behaviors or moments to watch.
- [ ] Observation protocol naming temptations to resist (no coaching, no explaining, no suggesting).
- [ ] On-site recording consent plan, including third-party handling.
- [ ] Four-column field-notes structure (did / said / felt / environment).
- [ ] 15–30 minute follow-up debrief at the end of each visit.
- [ ] Stated-vs-revealed framing named as the load-bearing analytic move.
- [ ] Site logistics resolved (access, host, day-of-week constraints, gear).
- [ ] Sample size: 4–8 participants + 11% no-show buffer.
- [ ] Visit length: 60–90 minutes; ~75/25 observation-to-debrief split.
- [ ] Visit count: 1–2 per participant; second visit for representativeness.
- [ ] Recording plan with consent language (audio default, video by exception).
- [ ] Note-taker named (two-observer where budget allows).
- [ ] Pilot visit scheduled before the main round.
- [ ] Synthesis cadence after every 1–2 visits, not at the end.

## Cross-references

- Methodology selection: `references/methodology-selection.md`
- Discovery interview (the closest sibling method; ethnography differs by being in-context, not in-room): `references/patterns/methods/discovery-interview.md`
- Diary study (longitudinal pairing when one visit can't capture the time horizon): `references/patterns/methods/diary-study.md`
- Sample sizes (authoritative table): `references/sample-sizes.md`
- Anti-patterns library (full): `references/anti-patterns.md`
- Question writing (specific / actionable / practical filter): `references/question-writing.md`
