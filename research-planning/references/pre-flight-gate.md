# Pre-Flight Gate — Three Outcomes

v0.5.0 redistributes pre-flight conditions across two exit types and adds the brief as a third outcome. The three exits are:

- **Exit A — "Research isn't the right fit."** Triggered by conditions revealing research as the wrong tool entirely. Output: redirect to a non-research alternative (decision memo, stakeholder workshop, analytics check, A/B test, etc.).
- **Exit B — "Do more digging first."** Triggered when primary research is plausible but secondary research should come first. Output: concrete digging guidance + a standing offer to return for a focused brief on the irreducible gap.
- **Exit C — "Here's your brief."** Default happy path when no Exit A or B condition fires. Output: the 6-field brief (handled in Phase 3 of the agent workflow).

This file specifies the trigger sets for A and B; Exit C is the absence of A and B triggers.

## When to use

Run these checks **before** drafting a brief. The Exit A set runs primarily during Phase 1 (Interview). The Exit B set runs primarily during Phase 2 (Research), once enough context has surfaced to assess audience accessibility and topic coverage. A light final pass runs at the top of Phase 3 (Plan) as a sanity check.

Don't draft a brief on top of a request that shouldn't exist. UI's own thought leadership says doing research when any of these checks fails is worse than not doing it at all.

## The "Do not pass go" gate (preserved)

Conceptually sitting between Exit A (wrong tool) and Exit B (do more digging), the UI Field Guide's clarity-of-goals check is its own gate. It can fire from Phase 1 if the user can't articulate goals after one round of clarifying questions.

> **Verbatim from the UI Field Guide:** *"If you're not already clear about the goals of your research, stop here. Do not pass go."*

Use this as a literal forcing function. If after one round of clarifying questions the goal is still vague ("get to know our customers," "understand the user better," "see what people think"), the gate fails. The research has no decision attached and won't produce action. Output: hold the line; ask the user to articulate the decision the research informs before continuing.

---

# Exit A — Research isn't the right fit

The output for any Exit A trigger is an honest redirect to what would actually help: a decision memo, stakeholder alignment workshop, analytics check, A/B test, or a frank "this is a leadership call, not a research question." Don't draft a brief.

## A1. Decision already made

**Signal.** User's framing reveals the choice has been made and they're seeking confirmation. Phrases like "we've decided to X, just want to validate," "leadership wants to launch X, can you check," "we need research to back up our plan to X." Phase 2 workspace scan may also surface prior memos that show the decision is locked.

**Output if triggered.**
"It sounds like the decision is already locked in. Research run after the fact rarely changes the outcome. Two options: (a) skip this study and document the decision rationale in a decision memo, or (b) reframe as evaluative research that tests the *implementation*, not the decision itself (usability, A/B, preference)."

**Phase this typically fires from.** Phase 1 — the framing usually surfaces in the opener response.

**If user pushes back.** Quote their specific framing back ("you said 'we've decided to X, just want to validate' — that's the part I'm flagging"). Require explicit acknowledgment if they want to proceed anyway, and document the acknowledgment at the top of the brief in the `⚠️ Open items` callout.

## A2. Team has no agency to act

**Signal.** User describes the work as research for a decision their team can't actually make — the call sits with another team, an executive, or a vendor. Phrases like "we want to influence the X team's roadmap," "this is for leadership to decide," "we'd present this to corporate."

**Output if triggered.**
"If your team can't actually make the decision this research would inform, the findings won't drive action — even if the research is rigorous. Who owns the decision? Worth pulling them in before scoping the study, or running a stakeholder alignment workshop first to get them invested. Spend time aligning stakeholders first, then scope the study."

**Phase this typically fires from.** Phase 1 — agency questions surface early when the user names stakeholders.

**If user pushes back.** Ask which specific stakeholder will act on findings. If they can't name one, the redirect holds. If they can, suggest involving that person in scoping before proceeding.

## A3. Political weaponization

**Signal.** User's framing reveals research is being used to gather evidence supporting a pre-made decision, win an argument, or get political buy-in — not to investigate. Phrases like "we need research to convince leadership," "I need data to push back on X," "we want to prove the case for Y."

**Output if triggered.** Produce the verbatim reframe before doing anything else:

> *"Before drafting, I want to make sure: are you trying to investigate whether the project is worth funding, or are you trying to gather evidence to support a decision you've already made? Research can do the first; the second isn't research, it's selective evidence-gathering."*

**Do not soften this phrasing.** The distinction between investigation and selective evidence-gathering is the load-bearing one — softer phrasings ("just to clarify your goals…", "let me understand what you're hoping to learn…") collapse the gate. Wait for the user's answer.

If the answer is "investigate" — proceed. If the answer is "gather evidence" — redirect:
"Research run to win an argument rarely wins the argument. If the goal is alignment, a stakeholder workshop is more honest and faster. If the goal is to test the solution honestly, evaluative research (usability, A/B, preference testing) is the right shape — accepting that it may invalidate the solution. Want help framing one of those?"

Michele Ronsen, verbatim, for context: *"research as a weapon... they're conducting user research or wanting to conduct user research, to mask it as a way to prove a point or to validate, you know, one direction or another is just wrong."*

**Phase this typically fires from.** Phase 1 — usually the opener response gives this away.

**If user pushes back.** Hold the line. The reframe phrasing is non-negotiable. If they insist on proceeding after acknowledging the framing, require explicit acknowledgment and document at the top of the brief.

## A4. AI-substitute framing

**Signal.** User proposes synthetic users, AI personas, or LLM-generated participants as primary evidence. Phrases like "can you simulate user responses," "we want to use AI personas instead of recruiting," "synthetic users would be faster." Also fires if the user names a niche population (underrepresented in LLM training data) and proposes synthetic substitutes.

**Output if triggered.**
"Synthetic users / AI-only research isn't a substitute for primary research with real users. AI is fine as input (drafting the guide, surfacing assumptions) or pressure-test (simulating pilots before fielding), but you still need real humans to learn from. Substitute is a block, not a tradeoff."

If a niche population is involved, add:
"This population is also underrepresented in LLM training data — synthetic users will hallucinate confidently. Real recruits only. Recruiting may be harder; budget accordingly."

Offer the redirect: "Want help re-scoping with real recruits? Or if recruiting is the blocker, we can talk about whether secondary research could narrow the question first."

**Phase this typically fires from.** Phase 1 — the framing usually surfaces in the opener or first follow-up.

**If user pushes back.** Substitute framing is a block, not a tradeoff. Quote the user's wording back, name the risk specifically (hallucination, no real recruit criteria, sample-size theater), and require explicit acknowledgment if they want to proceed.

## A5. Answer is yes/no

**Signal.** The research question, as written, has a binary answer. Phrases like "do users want X," "will customers adopt Y," "is feature Z worth building." The user has data (analytics, sales, support tickets) that could answer this directly, or the question would be answered by an A/B test or single-question survey.

**Output if triggered.**
"As written, this is a yes/no question. Yes/no answers usually mean A/B testing, analytics, or a single survey question — not qualitative research. Either re-scope to 'how' or 'why' (which opens up qualitative — for example, *how do users currently solve X?* or *why do customers abandon Y?*), or run the quick quant version first and come back if it raises follow-up questions."

**Phase this typically fires from.** Phase 1 — question shape is usually clear from the opener.

**If user pushes back.** Offer 2-3 specific 'how/why' reformulations of their question. If they still want qualitative on a binary, ask what the 'why' behind the yes/no is and route there. If they insist, document the framing and proceed.

## A6. Research already done

**Signal.** Workspace scan surfaces prior research on the same question (Phase 2). Or the user mentions in passing that "we did some research on this last year" but doesn't seem aware that it answers the current question. Or a similar study from another team is findable with light desk work.

**Output if triggered.**
"Looks like there's prior work in this area — [name the source, e.g., the Q3 2025 study from the X team]. Pull the prior research before scoping new work. If gaps remain after reading it, scope a focused study around those specific gaps rather than re-running the whole thing."

**Phase this typically fires from.** Phase 2 — workspace scan is the usual trigger. Occasionally Phase 1 if the user mentions it directly.

**If user pushes back.** Ask what specifically is missing from the prior work. If they can name a concrete gap, that becomes the new (narrower) research question and Phase 3 proceeds. If they can't, the redirect holds.

---

# Exit B — Do more digging first

The output for any Exit B trigger is concrete digging guidance — specific search terms, source types (industry analyst reports, public case studies, internal data sources), and a standing offer to return for a focused brief on the irreducible gap. Exit B is a sequencing recommendation, not a refusal. Point the user to `references/secondary-research-paths.md` for the concrete digging protocol.

Every Exit B output should include the standing offer:

> *"After 2 hours of desk research, if a gap remains, come back and we'll design a focused study on the irreducible piece."*

## B1. Hard-to-reach audience + topic publicly written about (composite)

**Signal.** Two user-answered questions, both required:

1. *"How easily can you talk to this audience? (Daily / weekly / monthly / rarely)"* — Answer of **rarely** (or sometimes **monthly**) signals hard-to-reach.
2. *"Have you or anyone you know written publicly about this — or is this topic well-covered in the industry?"* — Answer of **yes** signals publicly-written-about.

Both must apply. Hard-to-reach alone is a recruiting challenge, not a redirect. Publicly-written-about alone is not blocking. The composite is what triggers Exit B.

**Output if triggered.**
"Sounds like this audience is hard to recruit but the topic is well-covered publicly. Before we scope recruiting on a hard-to-reach group, let's do some desk research first — check what's already been written, find prior studies, read what your audience has said publicly. See `references/secondary-research-paths.md` for the digging protocol — specific search terms, source types, and a checklist for when to stop.

After 2 hours of desk research, if a gap remains, come back and we'll design a focused study on the irreducible piece."

Offer to run the conditional web search as the first step (per Phase 2 Stream 2).

**Phase this typically fires from.** Phase 2 — the audience-accessibility and topic-coverage questions are asked during Phase 2 Research. Occasionally Phase 1 if the user volunteers both signals in the opener.

**If user pushes back.** Accept the override but document it in the brief's Why or Next-steps section: *"User opted to scope primary research without prior desk research on a hard-to-reach + publicly-covered topic — flagged as a methodology risk."* The override is the user's call; the documentation protects the rationale.

## B2. Analytics could answer this without primary research

**Signal.** The question is quantitative or behavioral — frequency, conversion, drop-off, adoption rates, retention curves, time-on-task — and the team's existing dashboards or product analytics likely have the answer. User hasn't checked. Phrases like "how often do users…", "what percent of customers…", "where do people drop off in X flow."

**Output if triggered.**
"This looks like it can be answered with analytics or by talking to your team — not primary research. Cheaper, faster, and the data probably already exists. Specific places to check first: [name 1-2 plausible sources from context — product analytics, the data team, support ticket trends, the team owning the flow]. Want to start there?

After 2 hours of desk research / analytics, if a gap remains, come back and we'll design a focused study on the irreducible piece."

**Phase this typically fires from.** Phase 2 — usually after the agent sees the question is quantitative. Can fire in Phase 1 if the opener makes it clear.

**If user pushes back.** Ask what the analytics check would *not* answer. If they can name a qualitative follow-on ("we know *that* they drop off, we don't know *why*"), reframe the research question to the qualitative part and proceed — the analytics is upstream context, not a replacement for the now-narrower study. If they can't, the redirect holds.

---

# After the gate

If the request passes both exit checks, route to Exit C (Phase 3 plan drafting): question refinement (`references/question-writing.md`) → methodology selection (`references/methodology-selection.md`) → 6-field brief (`templates/default-brief.md`).

If the request fails an Exit A check, refuse-or-redirect with the specific language above. Don't soften. The gate exists because soft refusals produce bad briefs. Document any override in the `⚠️ Open items` callout at the top of the brief.

If the request fails an Exit B check, point the user to `references/secondary-research-paths.md` and include the standing offer to return. Exit B is a sequencing recommendation — the brief is paused, not refused.

## Re-checking exits across phases

- **Phase 1** — Exit A triggers usually surface here from the opener response. Exit B's composite trigger may pre-fire if the user volunteers both signals.
- **Phase 2** — Exit B's audience-accessibility check runs here by asking the user directly. Exit A can re-fire if workspace scan turns up prior research (A6) or a locked-in decision memo (A1).
- **Phase 3** — light final pass at the top of plan drafting. Most conditions are already answered by Phase 1 + 2; this is a sanity check, not the load-bearing gate.
