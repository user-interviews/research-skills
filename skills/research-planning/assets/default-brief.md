# Research Brief: [Project Name]

> Canonical 6-field UI brief template. Fill every field. Don't skip the counterfactual. If a field reads "we'll figure it out," stop and figure it out before drafting the rest.

## What

**Research question(s)**
[Specific / actionable / practical research questions. 3–5 max. Each one should be specific enough that you'll know when you've answered it, practical enough to answer in the scope of this study, and actionable enough that the answer changes what you do next. See `references/question-writing.md` for the rubric and good/bad examples.]

**Decision this research enables**
[Name the downstream decision in one sentence. "We will decide whether to ___" or "We will choose between ___ and ___." If you can't name a decision, the research is not decision-driven — see `references/decision-driven-research.md` and re-run the pre-flight gate.]

**Hypotheses / assumptions to test**
[List the assumptions baked into the current plan. Use the prompt: *"If we're wrong that ___, this will fail."* Then rank them by risk × confidence and push hardest on the riskiest, least-certain ones.]

## Why

**Business or product goal**
[The business or product outcome this research supports. Tie it to a real strategic priority — a Q-goal, a roadmap bet, a stakeholder commitment. Vague goals ("get to know our customers") fail the pre-flight gate.]

**What we'll do if we don't do this research**
[The counterfactual. If a stakeholder cannot articulate what would happen without this research, the impact is not likely to be high. Be honest — "we'd ship anyway, just with more risk" is a legitimate answer that informs scope.]

## How

**Method + rationale**
[Selected method (interviews, usability, survey, diary study, etc.) and a one-paragraph rationale tying it to the question. Method is a *derived* output of the question, not a starting point. See `references/methodology-selection.md`.]

**Role of AI**
[One of: **input** (AI helps draft the guide, surface assumptions, pressure-test questions) / **pressure-test** (AI simulates pilot responses before fielding) / **NEVER substitute** (synthetic users are not findings; AI moderation is not human judgment). Be explicit. Unlabeled AI/real mixing is an anti-pattern — see `references/anti-patterns.md`.]

**Moderation (human or AI)**
[Human-moderated, AI-moderated, or unmoderated. If AI-moderated, you must also: (1) pre-define probing instructions per question ("none / a little / more"), (2) run a pressure-test before scaling, (3) name who's actively monitoring quality. See `references/patterns/methods/ai-moderation-fit.md` if available.]

## Who

**Participants (real humans named)**
[Recruit criteria, screening logic, source pool. Even when AI assists, the people you learn from are real. "Synthetic users" do not count here — see `references/anti-patterns.md` on AI-first scoping.]

**Sample size**
[Specific n, with rationale tied to method. Default floor is n=5 for interviews and usability; larger for quant. See `references/sample-sizes.md` for the full table and the 11% no-show buffer.]

**Stakeholders**
[Specific people / teams who care about this — e.g., your manager, your team, leadership, a specific colleague — or "just me" if nobody else is involved. Name relationships and teams, not role-category labels. These are the people the readout has to land with; if it's just you, say so — that's a valid and common shape and it changes the methodology rubric. Full stakeholder mapping is optional and lives in `references/stakeholder-alignment.md` if you want it.]

## When and where

**Timeline**
[Key dates: kickoff, fielding window, analysis, readout. Be realistic — back-time from when the decision needs to be made, not from "as fast as possible." Build in buffer for recruiting.]

**Budget & incentives**
[Total budget, incentive amount per participant, any tooling costs. If incentives aren't a market-rate match for the audience, recruiting will struggle.]

**Tools & logistics**
[Recruiting platform, recording / transcription tool, analysis surface, scheduling logistics, accessibility considerations.]

## Next steps

**Deliverables**
[What artifacts come out of this — readout deck, written summary, tagged transcripts, prototype directions, executive summary. Match deliverables to the stakeholders identified in "Who."]

**Activation plan**
[How findings will be applied, not just shared. "Delivering an insight report is not enough." Name the rituals or working sessions where the team will act on the work. (If Stakeholders = "just me," activation is simpler — name how you'll act on the findings yourself.)]

**Follow-up**
[Open questions deferred to a future study, repository updates, longitudinal tracking, follow-up interviews with key participants.]

---

## Ready to launch this study?

This brief is ready to hand off to **User Interviews** to recruit participants and run the study end-to-end. The UI MCP can:

- Recruit from your existing audience or the UI participant marketplace
- Configure incentives, screeners, and scheduling
- Coordinate moderation (human or AI)

To launch directly from this brief, ask Claude to *"create a project in User Interviews from this brief"* — the UI MCP picks up the question, method, participants, and incentives fields automatically. Or paste the brief into the User Interviews project setup flow at userinterviews.com.

[See the User Interviews docs for the full project setup flow.]
