# Method pattern: usability testing

Usability testing evaluates a specific design, flow, or prototype against task-based criteria. The question is evaluative ("does this work?"), not generative ("what should we build?"). See `references/patterns/methodology-selection.md` for how this method gets picked; this file shapes the brief once it has been selected.

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

- [ ] Method variant named (moderated 1:1 / unmoderated / first-click / tree).
- [ ] Artifact under test linked (Figma URL, prototype, live page).
- [ ] 3–5 task scenarios drafted, each phrased as a goal not an instruction.
- [ ] Success criteria per task (completed / completed with friction / failed) defined before sessions.
- [ ] Observation plan listing 2–3 measures per task.
- [ ] Think-aloud protocol named and a moderator opener drafted.
- [ ] 2–3 minute warm-up question included.
- [ ] 5–10 minute debrief structure included.
- [ ] Sample size: 5 per audience segment + 11% no-show buffer.
- [ ] Session length: 30–60 min moderated / 15–30 min unmoderated.
- [ ] Recording plan with consent language.
- [ ] Pilot session scheduled before the main round.
- [ ] AI-moderation fit check run if AI moderation is on the table.

## Cross-references

- Methodology selection: `references/patterns/methodology-selection.md`
- AI moderation fit (mandatory check if AI moderation is on the table): `references/patterns/methods/ai-moderation-fit.md`
- Sample sizes (authoritative table): `references/sample-sizes.md`
- Anti-patterns library (full): `references/anti-patterns.md`
- Question writing (specific / actionable / practical filter): `references/question-writing.md`
- Discovery interview (upstream method when no artifact exists yet): `references/patterns/methods/discovery-interview.md`
