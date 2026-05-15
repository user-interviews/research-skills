# Chat-shaped eval scenarios — research-planning skill

These scenarios target chat-surface behaviors the Claude Code plugin doesn't see: single-message context dumps, file attachments, Express mode, solo researcher path, political-weaponization reframe, Polish iteration, multi-turn course-correction. They exist to prove SKILL.md's Operating Principles hold up in a single-context conversation (no sub-agent fork).

Each scenario lists a user input, expected skill behavior, and the failure mode it guards against. Scoring uses the 9-dim rubric in `rubric.md`. Run results live in `runs/`.

---

## S01: Single-message context dump

**User input:**
> Hey — I want to plan some research. Context: we're a Series B fintech, and our self-serve onboarding completion rate dropped from 62% to 48% over the last quarter. We just rolled out a new identity-verification step around then and I think it might be the culprit, but I'm not sure if that's the only thing changing behavior. The decision I'm staring at is whether to roll back the new IDV step, replace it with a lighter-touch alternative, or keep it as-is and address dropout differently. The people who need to weigh in are me (head of growth), our CTO (he owns the IDV vendor relationship), and our compliance lead (she signed off on the new flow). I'd want to talk to new signups who dropped out somewhere in the IDV flow specifically — not generic churned users. Timeline: we can take 2-3 weeks. Help me plan it.

**Expected behavior:**
- Skill detects all 4 foundational fields are attested (Why = drop in completion rate; What = IDV rollback/replace/keep decision; Stakeholders = head of growth, CTO, compliance lead; Research subjects = signups who dropped out in IDV flow).
- Skill skips Refine entirely; proceeds directly to Draft.
- Brief's "Why / What / Who" sections reflect inferred fields verbatim — does NOT ask "who are your stakeholders" or "what decision does this inform."
- Methodology recommendation considers compliance + CTO as audience-evidence axis inputs.
- Acknowledgment line ("Sounds like you want to plan research on…") names back what was found before drafting.

**Why this matters:** Chat users routinely dump context up front. The 11-step plugin pattern of "ask one foundational question at a time" would feel like the skill ignored their text.

---

## S02: Image attachment context

**User input:**
> [attached: competitor-pricing.png]
> Take a look at this — it's our biggest competitor's pricing page. I want to plan research on whether we should restructure our pricing to look more like this. Help me design the study.

**Expected behavior:**
- Skill's first action is to check `/mnt/user-data/uploads` and read the attached PNG multimodally.
- Brief's Why ties to specific elements seen in the image (price points, tiering shape, value-prop framings).
- Inferred Research subjects reflect the segment the screenshot implies (e.g., if the competitor targets mid-market, that becomes the inferred audience to confirm).
- Skill flags any inferred fields with `⚠️ Open items to confirm before reviewing this brief` callout at the top.
- Does NOT ask the user to describe the image; reads it directly.

**Why this matters:** File attachments are chat-native; the plugin's interview-only model has no analog. The skill must read first, ask second.

---

## S03: Implicit foundational fields

**User input:**
> We just got bad NPS scores from enterprise customers and I want to figure out why before our QBR.

**Expected behavior:**
- Skill infers Why (NPS dropped) and surface-level What (understand why for QBR) — but recognizes that **the decision** is unattested (what will the user do with the answer?).
- Skill explicitly asks the missing foundational question: what decision does the QBR-prep inform? (Renew/expand strategy? Account-health intervention? Product roadmap shift?)
- Skill also asks for Stakeholders (whose QBR? who needs to act on findings?) and confirms Research subjects (which enterprise customers — detractors only, full segment?).
- Skill does NOT draft a brief on the implicit fields alone — even with all four loosely inferable, it confirms before drafting.

**Why this matters:** "Implied" ≠ "attested." Principle #1 requires explicit confirmation; the skill must not over-infer just because the gist is clear.

---

## S04: Express request

**User input:**
> Need a quick brief — no questions, just write it. Decision: ship the new dashboard layout or keep the old one. Stakeholders: me (PM) and my design partner Maya. Why: we A/B tested and got mixed results, want qualitative signal before we commit. Research subjects: current dashboard users (paid plan, used the product in the last 30 days). Timeline: 1-3 days, this week.

**Expected behavior:**
- Skill recognizes Express signal ("no questions, just write it") AND all foundational fields explicit AND decision is binary.
- Skill skips Refine entirely, transitions Intake → Draft directly.
- Acknowledgment line: "Got everything I need — drafting now." (Not "skipping Refine"; that's plumbing.)
- Methodology bounded to Express-permitted methods (AI-moderated / unmoderated / in-product survey / async-short-diary).
- Brief surfaces Express timeline constraint and its methodological implication.

**Why this matters:** Express is a chat-native shortcut. The plugin doesn't have a workflow-level Express; honoring it cleanly is the test.

---

## S05: Polish iteration

**Context:** A brief is already on the screen from a prior turn. Decision: ship new onboarding flow A or B. Stakeholders: PM + designer. Method: moderated 1:1s with 8 new signups. Timeline: Rapid (1-2 weeks).

**User input:**
> Actually — can we make this Express? Need to ship by Friday.

**Expected behavior:**
- Skill treats this as a Polish turn, NOT fresh Intake.
- Skill re-runs methodology selection with Express timeline constraint; surfaces the tradeoff (moderated 1:1s out, AI-moderated/unmoderated/survey/diary in).
- Skill amends the affected sections (How, When and where) in place — does NOT regenerate the whole brief.
- Skill shows the user what changed: "Updated How — switched from moderated 1:1s to AI-moderated unmoderated tests, given the 1-3 day window."
- Skill does NOT re-ask foundational fields.

**Why this matters:** Polish iteration is where chat's strength (iterating on an artifact) pays off. Regenerating from scratch or losing state would be a fundamental failure.

---

## S06: Ambiguous user role

**User input:**
> Hi — I'm a marketing person trying to figure out what messaging resonates with small-business owners shopping for accounting software. I want to plan some research. The decision is which of three taglines to lead with on our new landing page (we're rebuilding it next month). The people I need to convince are our VP Marketing and our agency partner. I want to talk to actual SMB owners who buy or evaluate accounting software, not generic SMB people. Help me scope it.

**Expected behavior:**
- Skill stays role-neutral throughout. Does NOT say "as a researcher you'll know" or imply marketing-person ≠ researcher.
- Plain-language framings only; no untranslated jargon (no "generative vs. evaluative" without one-line definition).
- Brief's voice respects the user's stated role — examples, language, and the methodology rationale read for a marketing PM, not a UX researcher.
- Methodology selection still runs cleanly (this is a copy/messaging test — likely concept-test or unmoderated comparative).

**Why this matters:** Operating Principle #6 (plain language; never imply researcher role). The plugin lives behind a sub-agent fork where the parent context is irrelevant; here the user's stated identity is in scope and the skill must respect it.

---

## S07: Solo researcher

**User input:**
> It's just me — I'm a solo indie founder. I want to figure out whether my new pricing tier (a mid-tier between free and pro) would actually convert free users. I'm going to make this call myself, no stakeholders, no team. I want to talk to current free users who've been active for 30+ days. Plan the research.

**Expected behavior:**
- Skill accepts Stakeholders = "just me" without further probing.
- Methodology rubric skips the audience-evidence axis (axis 6) per PAP-202.
- Deliverables section sized for the founder's own thinking — NOT "how will you communicate findings to the team."
- Activation plan reads "how I'll act on findings myself," not "how I'll share with stakeholders."
- Brief's Who section reflects solo decision-making cleanly.

**Why this matters:** Solo researcher is a first-class case (PAP-202). The plugin's audience-evidence axis assumes external stakeholders by default; the skill must collapse it gracefully.

---

## S08: Pre-flight gate trigger — decision already made

**User input:**
> Help me plan research to find out if my new pricing is good — we're launching it next Monday regardless. Just need to make sure we know how customers feel about it post-launch.

**Expected behavior:**
- Skill recognizes pre-flight gate failure: decision is locked, launch is irrevocable on timeline, research after the fact cannot change the decision.
- Skill produces the refusal-or-redirect from `references/pre-flight-gate.md` — names the concern in the user's situation (not "the gate said").
- Skill does NOT draft a brief.
- Skill offers alternatives: post-launch instrumentation, feedback-listening setup, decision memo with explicit assumptions to revisit if metrics shift.

**Why this matters:** The pre-flight gate is non-negotiable. A drafted brief here would erode the playbook's load-bearing move.

---

## S09: Political weaponization

**User input:**
> I redesigned our checkout flow last quarter and I'm pretty sure it's the right call, but leadership wants more evidence before greenlighting the rollout. Can you plan research that'll show them my redesign is the better option?

**Expected behavior:**
- Skill produces the **verbatim** political-weaponization reframe from `pre-flight-gate.md`: *"are you trying to investigate whether the project is worth funding, or are you trying to gather evidence to support a decision you've already made?"*
- Skill does NOT soften the reframe (no "I'd love to help, but…" no "let me reframe slightly…").
- Skill waits for the user's answer before proceeding.
- If user re-frames toward genuine investigation, skill proceeds to Refine. If user persists with "I want evidence for my call," skill names that the work isn't research and offers decision-memo / pilot alternatives.

**Why this matters:** This is the highest-stakes gate. Softening the verbatim reframe collapses the framework's core move. Operating Principle #7 is non-negotiable.

---

## S10: Multi-turn course correction

**Turn 1 user input:**
> Want to plan research on our new mobile app — figuring out if users find the redesigned home screen useful.

**Turn 1 skill behavior:** Asks for missing What (decision), Stakeholders, Research subjects.

**Turn 2 user input:**
> Actually, scratch that. The real question is whether we should keep the mobile app at all — we're considering sunsetting it and going web-only. Stakeholders are me (CPO), our CEO, and our head of mobile eng. Research subjects: active mobile-only users in the last 30 days.

**Expected behavior:**
- Skill re-anchors cleanly to the NEW topic (sunset decision), discards the home-screen framing.
- Skill does NOT mix the two contexts (no "for the home-screen research AND the sunset decision…").
- Skill confirms the new Why (signals suggesting sunset is on the table?), accepts the new fields, proceeds to Refine then Draft.
- Methodology selection reflects the much bigger decision (sunset = strategic + irreversible; methodology rubric weights differently).

**Why this matters:** Course-corrections mid-stream are chat-native. The skill must drop prior state cleanly without confusion.

---

## S11: PDF transcript attached

**User input:**
> [attached: customer-interview-transcript.pdf]
> Plan research based on this. We did one interview already and there's a lot to unpack — want to run a proper study off the back of it.

**Expected behavior:**
- Skill's first action is to read the attached PDF in full — BEFORE asking any question.
- Skill extracts from the transcript: any explicit decision the user mentioned, audience cues, prior findings, hypotheses worth testing.
- Skill surfaces what it found ("Reading the transcript — looks like the topic is X, customer mentioned Y as a pain point, you said you want to decide on Z…") and asks only the still-unattested fields.
- Skill does NOT ask "can you summarize the transcript" or "what's in the PDF."

**Why this matters:** Reading attached files BEFORE asking is Operating Principle #4. Skipping this would erase chat's biggest UX advantage over the plugin.

---

## S12: Express + foundational gap

**User input:**
> Quick brief, no questions please. We're testing whether to add Apple Pay to checkout. I want to talk to mobile checkout users in the last 14 days. Decision is binary (add it or don't). Timeline: 1-3 days.

**Expected behavior:**
- Skill recognizes Express signal AND most foundational fields explicit — BUT Stakeholders is missing.
- Skill does NOT silently downgrade to Standard timeline.
- Skill does NOT silently infer Stakeholders.
- Skill asks the ONE foundational gap in plain language: "I need to know who else is involved before drafting — Express needs the foundational fields settled. Who else weighs in on this decision?"
- Once Stakeholders is captured, skill proceeds to Draft (not full Refine).
- If user refuses to clarify, skill falls back to Rapid timeline (not Express) and proceeds.

**Why this matters:** Express has a foundational-fields gate. Honoring Express while still enforcing the gate is the test.

---

## S13: Mid-Polish Stakeholder change

**Context:** Brief is on the screen. Stakeholders captured as "me (PM) and my design partner." Method: unmoderated usability test on 10 users. Audience-evidence axis weighted lightly (small internal team).

**User input:**
> One more thing — actually, our CEO is going to want to weigh in on this too. He's pretty data-driven, wants stats not anecdotes.

**Expected behavior:**
- Skill treats this as a Polish turn.
- Skill updates Stakeholders to include CEO + the new evidence preference (quantitative).
- Skill re-runs the audience-evidence axis (axis 6) with the new constraint: CEO wants stats → unmoderated usability with N=10 may not be enough; methodology may shift toward larger-N (survey, quant unmoderated, or analytics-backed study).
- Skill surfaces the methodology change explicitly: "Updated How — bumping N from 10 to 25 and adding a post-test quantitative survey, since your CEO wants stats."
- Skill does NOT regenerate the whole brief; amends Who + How + possibly When (timeline may stretch).

**Why this matters:** Stakeholder changes downstream-of-Draft are common in Polish. The skill must propagate the change through the affected rubric axes, not just edit the Who field in isolation.
