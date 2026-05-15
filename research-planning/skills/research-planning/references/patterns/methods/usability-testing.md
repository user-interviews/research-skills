# Method pattern: usability testing

Usability testing evaluates a specific design, flow, or prototype against task-based criteria. The question is evaluative ("does this work?"), not generative ("what should we build?"). See `references/methodology-selection.md` for how this method gets picked; this file shapes the brief once it has been selected.

## When this pattern applies

Apply this pattern when the research question matches one or more of these shapes:

- "Can users complete [specific task] using [design or flow]?"
- "Where do users get stuck in [checkout / signup / settings flow]?"
- "Is [this prototype / wireframe / live screen] clear enough for [audience] to [outcome]?"
- "Which of these two designs is more intuitive?" (paired with A/B or preference testing)
- "Does the new navigation help users find [feature]?"

Triggers for routing to this pattern:

- A specific artifact exists or is in flight (prototype, wireframe, live product, redesign).
- The decision being informed is evaluative: ship / fix / kill / iterate.
- The product cycle stage is validation, not discovery.
- Success can be defined as a task outcome (completed, failed, abandoned, completed-with-friction).

Do NOT route to usability testing when:

- The team doesn't yet know what to build (discovery-interview applies instead).
- The question is about motivations, behaviors, or context-of-use outside the product (discovery-interview).
- The question requires quantitative validation at scale (survey).
- There is no concrete artifact to test against — even a low-fi sketch counts, but "we have an idea" does not.

## What it adds to the brief

The default brief sections stay, but the methodology and participants sections get usability-specific content. Add these to the brief generated for the user:

- **Task scenarios (3–5 tasks).** Each scenario describes a real goal, not an instruction. Good: "You need to invite a teammate to this workspace. Show me how you would do that." Bad: "Click the Invite button in the top right." The scenario gives the participant a job; the product reveals whether the design supports it.
- **Success criteria per task.** Define what "completed," "completed with friction," and "failed" look like before sessions start. This is the difference between a usability test and a demo.
- **Observation plan.** Where will the moderator (or recording) capture: time on task, errors, recoveries, verbal confusion, satisfaction. Pick 2–3 measures per task — more becomes noise.
- **Think-aloud protocol.** Note explicitly in the brief that participants will be asked to narrate their thinking. This is the load-bearing data; without it you have completion rates but no diagnosis.
- **Warm-up question (1–2 minutes).** A low-stakes opener so the participant settles in before tasks start. Typical: "Tell me a little about how you currently [adjacent activity]." Skipping this concentrates anxiety into the first task and corrupts that task's data.
- **Debrief structure (5–10 minutes).** What did the participant find easiest, hardest, surprising. Where would they go next. Captures post-task reflection that doesn't surface during tasks.

Also surface in the brief:

- The artifact being tested (link to Figma / live URL / prototype). The brief is incomplete without it.
- Whether the test is moderated, unmoderated, first-click, or tree.

## Method variants

The default brief should name which variant is being run. Four variants share most defaults but diverge on what they're best at.

- **Moderated 1:1.** A live moderator runs each session, one participant at a time. The default. Best for early-stage prototypes, complex flows, or when probing confusion in real time is load-bearing. Highest signal per session; highest cost per session.
- **Unmoderated.** Participants complete tasks on their own through a remote testing platform. Best when the flow is well-scoped, success criteria are unambiguous, the participant pool quality is assured, and the team is comfortable losing the live probing layer. Scales further; faster turnaround; lower per-session signal.
- **First-click testing.** Participants see a screen and click where they would go to accomplish a task. Best for narrow IA or wayfinding questions ("where do users go first to start a return?"). Sample size can be larger (n=20–50) because the test is short and the signal is binary.
- **Tree testing.** Participants navigate a text-only sitemap to find a target. Best for testing information architecture before any visual design exists. Pairs well with card sorting upstream. Sample size leans higher (≥15 per audience segment, per UI's Field Guide).

If the brief is ambiguous about which variant fits, default to moderated 1:1 and flag the alternatives in the methodology section so the team can choose.

## Comparative variant

The comparative variant of usability testing applies when the team needs to choose between alternatives — A vs. B designs, the existing IA vs. the proposed redesign, two candidate flows, or a set of concept directions. The question is no longer "does this work?" but "*which* works better?" This is Pejman's *alternative selection* decision-intent category. Method choices, defaults, and brief content all shift accordingly.

### When the comparative variant applies

Use the comparative variant when the research question matches one of these shapes:

- "Which of these two (or three) designs lets users complete [task] more easily?"
- "Does the redesigned IA outperform the existing one on [findability tasks]?"
- "Between these flows, which one users prefer — and why?"
- "Should we ship Concept A, Concept B, or something else?"
- "Does Version 2 fix the friction we saw in Version 1?"

Triggers for routing here:

- The team has named alternatives explicitly. Vague "well, we have some directions" is not alternative selection — that's still discovery.
- The decision is between, not about, designs. The team has decided to ship *something*; the question is *which*.
- Each alternative is mature enough to be testable on the same tasks. Mismatched fidelity (a polished prototype vs. a rough sketch) will bias the comparison — equalize fidelity before testing.

Do NOT use the comparative variant when:

- Only one design exists — that's the standard variant.
- The alternatives haven't been built or sketched yet — run discovery interviews to inform what alternatives are worth building.
- The team is fishing for permission to ship a specific one — that's validation theater. Surface the bias and reframe.

### Method options

Several specific methods fit alternative-selection questions. Pick by the shape of the comparison:

- **Side-by-side preference test.** Participants see both designs simultaneously (or in close succession) and pick one. Fast, clean, but vulnerable to first-impression effects and surface-aesthetic bias. Best for short, visual comparisons where the goal is preference signal, not task signal.
- **Comparative tree test.** Each participant runs the same findability tasks against both candidate IAs (counterbalanced order). Produces per-task success rates per IA, which is the cleanest comparative output for navigation work. See `references/patterns/methods/card-sort.md` for tree-test mechanics.
- **Sequential comparison (within-subjects).** Each participant attempts the same tasks first on Design A, then Design B (with order counterbalanced across participants). Highest signal — same participant on both means the comparison controls for individual differences. Risk: learning effects (participants get faster on the second flow regardless), which is what counterbalancing exists to manage.
- **Between-subjects comparison.** Half the participants test Design A, half test Design B. No learning effect, but you need roughly 2× the sample size to get the same statistical power. Use when learning effects would dominate (e.g., the flows are similar enough that a participant who's already done one is no longer naïve).
- **5-second test (paired).** Participants see one design for 5 seconds, then answer recall questions; repeat with the other. Useful for first-impression and information-hierarchy comparisons on landing pages or marketing surfaces. Cheap, fast, narrow.

Default choices:

- *Flow comparison:* sequential comparison (within-subjects), counterbalanced.
- *IA comparison:* comparative tree test.
- *Landing page or hero comparison:* 5-second test (paired).
- *Pure visual preference:* side-by-side preference test (and flag the bias risks).

### Defaults

**Sample size:** 10–15 participants per audience segment for quantitative comparison. The doubled-up-versus-standard floor reflects that comparative claims need tighter confidence than single-design diagnosis. For between-subjects, double again — 10–15 *per arm*.

**Counterbalancing:** Always randomize which alternative the participant sees first. For within-subjects designs, alternate order across participants (half see A→B, half see B→A). Order effects are the most common comparative-variant artifact.

**Equalized fidelity:** Both alternatives at the same level of polish before testing. A high-fidelity Figma vs. a paper sketch is a comparison of fidelity, not design. Spend the prep time on equalization.

**Equalized task surface:** Both alternatives should support the same tasks. If Design B can't even attempt Task 3, don't test Task 3 on Design A — the comparative claim becomes lopsided and unfair.

**Session length:** 45–75 minutes for within-subjects (longer because each participant runs both flows). 30–60 minutes for between-subjects.

**Preference question placement:** Ask preference *after* both flows are complete, not in between. Mid-flow preference questions prime the participant for the second flow and corrupt task data.

### Brief additions

The default usability brief sections all apply, plus:

- **Alternatives being compared (explicit).** Name each alternative, link to the artifact, and state the fidelity level. "Design A: existing live product. Design B: high-fidelity Figma prototype rev 4." Mismatched fidelity gets surfaced and resolved before testing — no asterisks in the readout.
- **Comparison method named.** Side-by-side / comparative tree / sequential within-subjects / between-subjects / 5-second. With the rationale tying it to the question.
- **Order counterbalancing plan.** "Half the participants see A→B; half see B→A. Randomized by recruit-order parity." Or whatever scheme — the brief states it explicitly.
- **Success criterion (decision rule).** What threshold determines a winner. Default: a winner requires ≥60% preference (for preference tests) or a clear per-task advantage (for sequential comparisons — e.g., Design B beats Design A on ≥3 of 5 tasks by a meaningful margin). Below the threshold, the result is "no clear winner" — name that outcome explicitly so the team can pre-commit to what they'll do if it lands there.
- **How the loser is handled.** Critical and often skipped. If Design B wins, does Design A get killed entirely, or do its strengths get folded back into B? If neither wins, what's the fallback? Naming this in the brief prevents the post-readout argument over what to do with the "losing" design.
- **Task set held constant.** Same tasks across both alternatives, ordered consistently within each participant's run. Different task sets per alternative is a different study, not a comparative one.

### Examples

**Good comparative success criterion:**

> Design B "wins" if it produces a higher task-completion rate than Design A on at least 3 of 5 tasks *and* a higher post-test preference vote (≥60% of participants). If only one of those holds, the result is "mixed — fold Design B's wins into Design A's frame and retest." If neither, we ship Design A unchanged.

This is pre-committed. The team knows what they'll do at each outcome before they see the data.

**Bad comparative success criterion:**

> We want to see which design users prefer.

No threshold, no decision rule, no plan for ambiguous results. The team will negotiate the outcome post-hoc, which is how comparative tests turn into validation theater.

**Good order-counterbalancing plan:**

> Participants 1, 3, 5, 7, 9 see Design A first, then Design B. Participants 2, 4, 6, 8, 10 see Design B first, then Design A. Order recorded as a column in the results table.

**Bad order-counterbalancing plan:**

> We'll show them both designs.

No order discipline. Order effects will silently bias the results.

**Good "which do you prefer" framing (post-test, follow-up probe):**

> Now that you've used both versions, if you had to pick one to use every day, which would it be? — and then — what specifically led you to that choice?

The follow-up probe is the signal. The preference vote alone is a coin flip with extra steps; the *why* is what tells the team what made the difference.

**Bad framing (as the only question):**

> Which one do you like better?

Surface preference, no diagnosis, no behavioral anchor. Liking is not using.

### Comparative-variant anti-patterns

- **Showing both at once for sequential evaluation.** Side-by-side priming is a known artifact: the first one becomes the anchor and the second gets evaluated against it. If you *want* preference signal, side-by-side is fine; if you want task-completion signal, separate the alternatives in time.
- **No counterbalancing.** Without alternating order, the second flow always has the learning-effect advantage. The comparison is meaningless. Counterbalance or stop.
- **"Which do you like better" as the only question.** Preference without diagnosis is not actionable. Pair every preference question with at least one "why" probe and one behavior measure (task completion, time on task, error count).
- **Mismatched fidelity treated as a footnote.** "Design B is a polished prototype and Design A is a sketch, but participants seem to prefer B." Of course they do. Equalize fidelity before testing — or run a different kind of study.
- **Mismatched task surfaces.** Asking Design A to support 5 tasks and Design B to support 3 of those 5, then comparing. The comparison is structurally unfair. Cut to the shared task set or don't run the comparative variant.
- **Vague decision rule.** No pre-committed threshold for what counts as a win, so the team negotiates the outcome after seeing the data. Always specify the decision rule up front.
- **Skipping the "how is the loser handled" question.** The brief states what success looks like but not what happens to the design that loses. The team ships the winner, the design lead pushes back on losing entirely, and the team ends up with a third design that wasn't tested. Name the loser-handling plan in the brief.

## Defaults

**Sample size:** N=5 participants per audience segment, per Nielsen's classic finding that ~5 users surface ~85% of usability issues. UI's Field Guide cites the same range (3–10 for qualitative interviews; 5–8 for A/B; tree and card sort lean higher at ≥15 per group). If the brief covers multiple distinct audiences (e.g., admins and end users), run 5 per segment. Add an 11% no-show buffer (NN/g) when scheduling.

**Sessions per round:** A single round of 5 is the default. If the design changes substantially between sessions (rapid iteration), shorter rounds of 3 can be useful, but flag this as an iteration cadence in the brief, not a one-off study.

**Moderation type defaults:**

- **Moderated 1:1** for early-stage prototypes, complex flows, or when you need to probe confusion in real time. Default for v1 of any new design.
- **Unmoderated** is acceptable when the flow is well-scoped, success criteria are unambiguous, and the participant pool quality is assured (e.g., recruited through a vetted panel). UI's published default for low-budget/fast research is "a round of user interviews and a round of usability testing, each with about 5 participants" — moderated is the assumption unless otherwise noted.
- **First-click testing** for narrow questions like "where do users go first to accomplish X?" Sample sizes can be larger (n=20–50) because the test is short.
- **Tree testing** for information architecture questions before any visual design exists.

**Session length:**

- Moderated: 30–60 minutes. Include warm-up + 3–5 tasks + debrief.
- Unmoderated: 15–30 minutes. Cap at 30 — fatigue and dropout climb sharply past that point.

**Recording and notes:** Record the session (with consent). Have one note-taker if possible — the moderator should focus on facilitation, not transcription. If unmoderated, the platform handles recording; plan for highlight-reel review, not full re-watch. Tag moments worth re-listening with timestamps during the session; reviewing a tagged 6-minute set is cheaper than re-watching 5 full hours.

**Pilot session:** Run one pilot session before the main round, especially for new flows. Pilots almost always surface 1–2 task wording issues, a broken prototype state, or a setup step the moderator forgot. The pilot session is a methodology investment, not a sample-size sacrifice — re-recruit if needed.

**Incentive:** Tied to session length, audience seniority, and recruit source. Typical ranges: $50–100 for 30-minute consumer studies; $100–200 for 60-minute professional studies; $250+ for senior professional or specialist audiences. State the incentive in the brief — logistics needs it for budgeting and recruiting needs it for the invite copy.

**Stimuli setup:** For prototype-based studies, build a "starting state" the moderator can reset to between sessions. For live-product studies, decide ahead whether participants use their own account, a test account, or a dummy account; each choice trades off realism vs. clean state.

**AI moderation fit:** Usability testing on wireframes, prototypes, and live products is one of Strella's 7 validated AI-moderation use cases. If the team is considering AI moderation, route the brief through `references/patterns/methods/ai-moderation-fit.md` before finalizing. AI-moderated usability needs predefined probing logic, a pressure-tested guide, and active monitoring.

## Examples

**Good task scenario:**

> You've been using this dashboard to track your team's work. Your manager just asked you to share last week's progress with the leadership team. Show me how you would do that.

This scenario has a goal (share progress), a context (manager asked), and an outcome (the participant takes you there). It doesn't instruct.

**Bad task scenario:**

> Click the "Share" button in the upper right corner, then select "Leadership" from the dropdown.

This is a tutorial, not a test. The participant can complete it without understanding the design.

**Another bad task scenario (leading):**

> The new share dialog has a few options. Try to find the leadership audience and let me know if it makes sense.

The phrase "let me know if it makes sense" sets up the participant to evaluate the design rather than try to use it. They become a critic, not a user. Strip evaluation framing from the task.

**Good success criteria:**

| Task | Completed | Completed with friction | Failed |
|---|---|---|---|
| Share progress with leadership | Reaches share dialog and selects correct audience in <90s | Reaches dialog but hesitates >30s or backtracks once | Gives up, picks wrong audience, or can't find share entry point |

**Good debrief prompts:**

- "Of the things you did today, what was easiest?"
- "What felt hardest or most confusing?"
- "If you could change one thing about this, what would it be?"
- "Anything you expected to find that wasn't there?"
- "Walk me through the moment you got stuck on [task]. What were you trying to figure out?"

**Good think-aloud framing (from the moderator's opener):**

> "As you go through each task, I'd like you to narrate what you're thinking — what you're looking for, what you expect to happen, what surprises you. There are no wrong answers, and you can't break anything. If you get stuck, that's useful information — it tells us where the design isn't doing its job."

This frame normalizes confusion as data, which is the opposite of the demo-mode framing that participants default to.

**Good recruit criterion (behavioral, sharp):**

> "Has shipped or owned at least one feature in the last 90 days that involved coordinating with a designer."

Compare to a weak recruit criterion:

> "PMs at SaaS companies."

The first one is testable, recent, and behavioral. The second one is a demographic that includes participants who don't do the thing the study is about.

## Analysis and synthesis defaults

The brief should name how findings get from raw observations to a shared artifact. For usability testing, the synthesis pattern is largely consistent across studies:

- **Per-task rollup.** For each task, summarize how participants did: count of completed / completed-with-friction / failed, plus the friction patterns that recurred. This is the spine of the readout.
- **Severity ranking.** Tag each issue surfaced as P0 (blocker — multiple participants couldn't complete) / P1 (major friction — multiple participants struggled) / P2 (minor — single-participant issue or low-impact). Severity ranking is what stakeholders use to decide what gets fixed before ship.
- **Recommended next steps per issue.** Don't just list the issues; pair each with a recommended next action (fix the copy / re-design the flow / add empty state / accept and monitor).
- **Verbatim quotes per finding.** Quotes are more persuasive than counts in stakeholder readouts. Tag 1–2 strong quotes per finding during the session, not after.
- **Highlight reel for stakeholders.** A 5–10 minute video cut of the most-cited moments. Optional but high-leverage for skeptical stakeholders.

Name a synthesis owner and a target readout date in the brief. Without those, usability findings tend to live as scattered notes for weeks.

## Anti-patterns

- **Leading prompts during tasks.** "Try clicking the Share button — does that make sense?" telegraphs the answer. Stay quiet during tasks; use the debrief for follow-up.
- **Fixing issues on the fly.** When a participant gets stuck, the urge to explain ("oh, you actually just click here") destroys the data point. The stuck moment is the finding. Wait it out, then probe in debrief.
- **Demo-mode bias / "crash test dummy" framing.** Treating the participant as an automaton being forced through a flow corrupts the session. Make it a conversation about their work, with the product as the medium. See `references/anti-patterns.md` for the broader frame.
- **Too many tasks per session.** 3–5 tasks in a 60-minute session is the ceiling. Past that, participants fatigue and later tasks generate noise. If you have 8 tasks worth testing, split into two studies.
- **No warm-up.** Jumping straight into Task 1 concentrates anxiety into the data you most need to be clean. A 2-minute opener costs almost nothing and pays for itself.
- **Skipping success criteria.** Without pre-defined criteria, every observation becomes negotiable post-hoc ("well, they did eventually get there"). Define what success looks like before sessions start.
- **Confusing usability testing with concept testing.** Usability asks "can you use this?" Concept testing asks "would you want this?" Different methods, different questions. If the team isn't sure the concept is wanted, run discovery interviews or a concept test first.
- **Running usability without an artifact.** "We don't have a prototype yet, can we still do usability testing?" No. Either build a low-fi prototype (paper, Figma click-through) or switch methods.
- **Validation framing.** "We want to validate that the new design works." The phrasing pre-commits to a finding. Reframe as "we want to learn where the new design breaks down" before the brief goes out. See `references/anti-patterns.md` on validation vs. investigation.
- **No moderator-recruit fit check.** For specialized audiences (engineers, clinicians, financial advisors), the moderator needs enough domain literacy to follow the work. Generic moderators on specialized flows miss the diagnosis. Flag this in the brief.

## Brief deltas summary

Quick checklist of what the usability-testing pattern adds to the default brief. The agent generating the brief should confirm each item is present:

- [ ] Method variant named (moderated 1:1 / unmoderated / first-click / tree / comparative).
- [ ] Artifact under test linked (Figma URL, prototype, live page).
- [ ] 3–5 task scenarios drafted, each phrased as a goal not an instruction.
- [ ] Success criteria per task (completed / completed with friction / failed) defined before sessions.
- [ ] Observation plan listing 2–3 measures per task.
- [ ] Think-aloud protocol named and a moderator opener drafted.
- [ ] 2–3 minute warm-up question included.
- [ ] 5–10 minute debrief structure included.
- [ ] Sample size: 5 per audience segment + 11% no-show buffer (10–15 per segment for comparative variant).
- [ ] Session length: 30–60 min moderated / 15–30 min unmoderated / 45–75 min within-subjects comparative.
- [ ] Recording plan with consent language.
- [ ] Pilot session scheduled before the main round.
- [ ] AI-moderation fit check run if AI moderation is on the table.
- [ ] *If comparative:* alternatives named with equalized fidelity, comparison method chosen, counterbalancing scheme stated, decision rule pre-committed, loser-handling plan named.

## Cross-references

- Methodology selection: `references/methodology-selection.md`
- AI moderation fit (mandatory check if AI moderation is on the table): `references/patterns/methods/ai-moderation-fit.md`
- Sample sizes (authoritative table): `references/sample-sizes.md`
- Anti-patterns library (full): `references/anti-patterns.md`
- Question writing (specific / actionable / practical filter): `references/question-writing.md`
- Discovery interview (upstream method when no artifact exists yet): `references/patterns/methods/discovery-interview.md`
- Card sort and tree test (paired IA work; comparative tree test variant lives there): `references/patterns/methods/card-sort.md`
