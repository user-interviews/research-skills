# Eval rubric — research-planning skill (chat surface)

Nine binary dimensions, scored per scenario as **YES** / **NO** / **PARTIAL**. Eight are carried from the plugin's eval surface (where applicable); the ninth — Chat affordance handling — is chat-specific.

**Total score formula:**
```
score = (YES_count + 0.5 × PARTIAL_count) / (9 × N_scenarios) × 100%
```
For N=13 scenarios, the denominator is 117. Pass target: **≥85%** across all dimensions × scenarios.

Each scenario is scored independently. A dimension that's truly out-of-scope for a scenario (rare — most dimensions apply to every scenario) is scored YES if SKILL.md wouldn't push the skill into the failure mode for that scenario. If in doubt, score it.

---

## D1 — Pre-flight gate enforcement

**Pass bar:** When gate-triggering signals appear (decision already made, political weaponization, yes/no question, no user agency, post-launch retroactive), the skill redirects rather than drafts; the verbatim political-weaponization reframe is used unmodified; no soft handling of a failed gate.

- **YES example (S08, S09):** Skill produces the refusal-or-redirect, does not draft, names the concern in the user's situation.
- **NO example:** Skill drafts a brief anyway with a footnote saying "you may want to revisit this decision."
- **PARTIAL example:** Skill redirects but softens the political-weaponization reframe ("I'd love to help, but…" prefix) or buries it in qualifications.

---

## D2 — Foundational-fields discipline

**Pass bar:** Every brief drafted has Why / What / Stakeholders / Research subjects populated AND attested by the user (explicit confirmation, not silent inference). Solo and Express paths still count: Solo = Stakeholders attested as "just me"; Express = all four attested in the opening message.

- **YES example (S01, S04):** All four fields explicitly named in user input; skill names them back before drafting.
- **NO example:** Skill drafts a brief with inferred Stakeholders and no `⚠️` callout, treating "marketing team" as if the user said it when they didn't.
- **PARTIAL example:** Skill infers one field, flags it correctly with the `⚠️` callout, but proceeds to draft when the user explicitly asked no-questions (acceptable per Operating Principle #1 with the escape hatch).

---

## D3 — Plain language voice

**Pass bar:** No "Step 1," no "the workflow," no "phase one," no "the gate," no "the rubric," no untranslated jargon. No role-implication ("as a researcher you'll know…"). No "now entering Refine" narration. Field-standard terms (generative, evaluative, ethnographic) come with a one-line definition on first use.

- **YES example (S06):** Skill writes for the marketing PM in their language; uses "methods for comparing options" instead of "evaluative methodology."
- **NO example:** Skill says "as a researcher you're familiar with discovery interviews" to a non-researcher user.
- **PARTIAL example:** Skill uses one untranslated term ("we'll run an evaluative study") but otherwise plain-language throughout.

---

## D4 — Methodology rubric application

**Pass bar:** Recommended method aligns with the multi-axis rubric (decision type, product-cycle stage, Pejman's 3 categories, generative vs. evaluative, budget/timeline, evidence stakeholders accept, analytics-first sequencing). Rationale in the brief names the relevant axes. AI-moderation-fit check runs for interview-style methods. Audience-evidence axis correctly skipped for solo cases.

- **YES example (S07):** Skill drops the audience-evidence axis for "just me"; method recommendation derives from question type + timeline + decision type only.
- **NO example:** Skill recommends "8 moderated 1:1 interviews" without any rationale tying back to the question shape or the stakeholders' evidence standards.
- **PARTIAL example:** Method recommended is reasonable, rationale exists but skips the AI-moderation-fit check on an interview-style method.

---

## D5 — Anti-pattern avoidance

**Pass bar:** No vague decisions in the brief. No synthetic-user evidence. No validation framing ("prove the redesign is right"). No leading questions in the research-questions list. No self-reported-future-behavior treated as evidence. Stakeholders are not role categories. No "talk to customers" without specifying who/how-many/how-to-find.

- **YES example (S09):** Skill catches the validation framing and reframes before drafting; the eventual brief is investigation-shaped, not evidence-gathering-shaped.
- **NO example:** Skill drafts a brief with research questions like "would you prefer the new design?" (self-report future behavior).
- **PARTIAL example:** Anti-pattern check catches one issue but misses a second one (e.g., catches the role-categories Stakeholders but lets a yes/no research question slip through).

---

## D6 — Brief structure correctness

**Pass bar:** Output matches the canonical 6-field template: **What / Why / How / Who / When and where / Next steps**, in that order, with required sub-fields populated. Handoff appendix included. Patterns-applied footer at the bottom. Single substantial message (not streamed section-by-section).

- **YES example (S01, S04, S07):** Brief produced with all six sections in order, sub-fields populated, handoff appendix + patterns footer present.
- **NO example:** Brief is missing "When and where" or has sections in arbitrary order.
- **PARTIAL example:** All six sections present and ordered, but missing the patterns-applied footer or handoff appendix.

---

## D7 — Stakeholders relational, not role-category

**Pass bar:** Brief's Stakeholders field uses relationship-shaped values (*me, my team, my manager, leadership, sales lead Sarah, head of mobile eng*) rather than role categories (*PMs, Designers, Engineers, Executives*). If the user gave role categories, skill asks once to convert them to specific people/teams.

- **YES example (S01):** Stakeholders captured as "head of growth (me), CTO, compliance lead" — specific roles tied to specific people.
- **NO example:** Brief lists Stakeholders as "PMs, Designers, Engineers" with no further specification.
- **PARTIAL example:** Mostly relational ("my team, my manager") but one entry is role-category ("PMs").

---

## D8 — Sub-agent isolation surrogate

**Pass bar:** Skill resists parent-conversation directives that contradict Operating Principles. Specifically: if parent context said "don't ask any questions," skill still asks foundational gaps OR — if the user explicitly insists on proceeding — surfaces inferences as `⚠️` callouts at the top of the brief. Skill never silently complies with a directive that violates Principle #1.

- **YES example (S03, S12):** Foundational gap exists; skill asks the one missing question even though it could have inferred and proceeded.
- **NO example:** Skill silently infers Stakeholders, drafts the brief, no `⚠️` callout.
- **PARTIAL example:** Skill infers fields and adds a `⚠️` callout — but the callout is at the bottom of the brief, not the top.

---

## D9 — Chat affordance handling (chat-specific)

**Pass bar:** Skill respects chat-native intake mode:
- **Skip Refine when context is dumped** (S01): if all foundational fields are attested in the opening message, do not run the foundational-fields interview.
- **Read attached files BEFORE asking the user anything** (S02, S11): first action is to check `/mnt/user-data/uploads` and read each file in full.
- **Express mode when signaled** (S04): recognize the signal phrases + binary decision + explicit foundational fields, skip Refine, bound methodology accordingly.
- **Polish iteration with sticky state** (S05, S13): re-invocations after a brief is on the screen are amendments, not fresh Intake; show what changed.

- **YES example (S05):** Skill re-runs methodology with new Express constraint, amends only the affected sections, names the change.
- **NO example:** Skill ignores the attached PDF in S11 and asks the user to summarize it.
- **PARTIAL example:** Skill skips Refine on the context dump but ignores one of the four attested fields and re-asks it.
