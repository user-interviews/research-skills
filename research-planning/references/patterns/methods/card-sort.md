# Method pattern: card sort (and tree test)

Card sorts and tree tests are information-architecture methods. Card sorts surface how users *would group and label* content; tree tests evaluate whether a *proposed structure* lets users find content. They almost always come paired — open card sort to propose an IA, tree test to validate it. The question is "does the organization match the user's mental model?" — not "is the design beautiful?" or "is the feature wanted?" See `references/methodology-selection.md` for how these methods get picked; this file shapes the brief once they have been.

## When this pattern applies

Apply this pattern when the research question matches one or more of these shapes:

- "How should we organize [content area / navigation / feature set]?"
- "What terminology do users expect for [category / feature / section]?"
- "Can users find [target] in [proposed IA]?"
- "Does the navigation match how users think about [domain]?"
- "Where would users look first for [feature], and does that match where we've put it?"

Triggers for routing to this pattern:

- The research question is about content organization, navigation, terminology, or mental models.
- A redesign or new site / app section needs an IA decision before visual design starts.
- An existing IA is suspected of being misaligned with how users think (low findability metrics, support tickets about where things live).
- The team is choosing between two or more candidate IAs.
- Terminology is a load-bearing decision (industry vocabulary vs. internal jargon vs. user-natural language).

Do NOT route to card sorting / tree testing when:

- The question is about whether content exists at all — that's discovery or content strategy, not IA.
- The question is evaluative on a flow rather than a hierarchy — use usability-testing.
- The question is about a single screen's clarity — use first-click testing or usability-testing.
- The team has fewer than ~15 cards / nodes to test — the method's analytic power needs scale to be worth it.

## What it adds to the brief

The default brief sections stay, but methodology and participants sections get IA-specific content. Add these to the brief:

- **Card set (40–60 items typically).** Name the cards in the brief or link to the full list. Cards should be items users would actually look for — features, tasks, content pieces — not internal team taxonomies. If the team can't list the cards yet, the IA work is premature; back up to content audit first.
- **Open vs. closed format.** Open card sort = participants create and name their own groups. Closed card sort = participants sort into pre-named categories the team supplies. Open surfaces mental models and terminology; closed validates a proposed taxonomy. Default to open for generative IA work; closed for validation.
- **Hybrid format option.** Some platforms support hybrid (participant can use supplied categories *or* create new ones). Hybrid is useful when the team has high confidence in some categories but wants to surface the missing ones. Name explicitly if used.
- **Segments to compare.** If the audience has meaningful sub-segments (new users vs. power users, admins vs. end users, role A vs. role B), recruit each separately and analyze separately. Mental models often diverge sharply across segments — averaging across them produces an IA that fits no one.
- **Analysis approach.** Name the analytic outputs the synthesis will produce: dendrograms (hierarchical clustering of which cards group together), similarity matrices (cell-by-cell agreement), standardization grids (which group names users agreed on). The platform mostly produces these automatically; the brief names which ones the team will look at.
- **Tree test pairing plan.** If the card sort is generative (open), state explicitly that a tree test will follow to validate the proposed IA. The pairing is the discipline. Card sort alone produces a candidate IA; tree test alone validates someone else's guess. Together they cover the loop.
- **Tooling.** Name the platform — Optimal Workshop (industry default for both card sort and tree test), UserZoom, Maze, UXtweak, or a manual setup (sticky notes for in-person). Tooling determines whether the study runs remote, sample size economics, and analytic output quality.

Also surface in the brief:

- Task scenarios for the tree test (5–10 findability tasks the proposed IA must support).
- Whether the study is moderated (rare, mostly for in-person formative work) or unmoderated (the default for remote IA work at scale).
- Time budget per participant (15–25 min for an open card sort with 40–50 cards; 10–15 min for a tree test).

## Defaults

**Sample size:** N=15–30 per audience segment for quantitative analysis. UI's Field Guide cites ≥15 per group for card sort and tree test — this is the floor for reliable dendrogram and findability statistics. Practical defaults:

- *Open card sort:* 15–20 per segment.
- *Closed card sort:* 20–30 per segment (looking for agreement-or-not patterns needs more N).
- *Tree test:* 25–50 per segment (the more, the tighter the findability confidence intervals).

If you have multiple segments, run the floor per segment, not in total.

**Card count:**

- *Sweet spot:* 40–60 cards. Enough to surface real groupings; few enough that participants don't fatigue.
- *Floor:* 20–25 cards. Below this and the analytic patterns get thin.
- *Ceiling:* 60 cards. Above this and dropout climbs sharply, and the cognitive load corrupts the late-card sorts.

If the natural list exceeds 60, prioritize ruthlessly or run two complementary studies.

**Card phrasing:** User-natural language, not internal jargon. "Pay my bill" not "Receivables transaction." Test card phrasing in a pilot — ambiguous cards (where multiple participants ask "what is this?") are bad data.

**Session length / participant time:**

- *Open card sort, 40–50 cards:* 15–25 minutes participant time.
- *Closed card sort, 40–50 cards:* 10–15 minutes (faster — categories supplied).
- *Tree test, 5–10 tasks:* 10–15 minutes.

**Moderation type:** Unmoderated is the default for IA work — the method is structured and the tooling handles instructions cleanly. Moderated is reserved for in-person formative work where think-aloud during sorting is valuable.

**Tree test task design:** 5–10 findability tasks per tree test. Phrase each as a goal, not as a label. "You want to update your saved payment method. Where would you go?" — not "Find the Saved Payment Methods page." The label-matching shortcut is a known gotcha; goal-phrased tasks bypass it.

**Counterbalancing:** Randomize card order per participant (sort) and randomize task order per participant (tree test). Order effects are real and substantial.

**Incentive:** $25–75 for unmoderated IA studies, depending on length and audience. Lower than discovery interviews because the participant time is shorter and the platform handles scheduling.

**Pilot:** Run a 2–3 participant pilot before launching. Pilots surface ambiguous card phrasing, broken tooling, instruction confusion, and task wording problems. Re-recruit pilot participants if severe issues surface; otherwise roll them in.

## The card-sort → tree-test loop

The most reliable IA outcome comes from running the methods in sequence:

1. **Open card sort.** Surface how users naturally group and label the content. Produces dendrograms, similarity matrices, and a register of category names users invented.
2. **Propose IA.** The team synthesizes the card sort output into a candidate IA — usually 2–4 candidate trees, drawing on the strongest natural groupings while applying product-design constraints.
3. **Tree test.** Validate the candidate IA(s). Each participant attempts 5–10 findability tasks. Output: per-task success rate, time-to-find, directness score, and the "wandering" patterns that reveal where the IA confuses people.
4. **Iterate.** If tree-test success rates are below ~70% on critical tasks, revise the IA and retest. Two tree-test rounds are common.

Skipping step 3 (proposing an IA from card sort and shipping it without validation) is the most common failure mode. Card sort surfaces *what users would do unconstrained*; the proposed IA combines that with team constraints; the tree test validates the *combination*.

## Examples

**Good cards (specific, user-natural, behavioral):**

- "Update my payment method"
- "Cancel my subscription"
- "See past invoices"
- "Get help with a charge I don't recognize"
- "Change my plan"

These are tasks users would actually go looking to do. They use the user's language.

**Bad cards (internal taxonomy, vague, jargon):**

- "Account Management"
- "Billing Operations"
- "Subscription Lifecycle"
- "Self-Service Tools"

These are internal categorizations, not user destinations. Participants will sort them to whatever feels right with no signal value.

**Good tree-test task (goal-phrased):**

> You just noticed an unfamiliar charge on your last invoice and want to dispute it. Where would you go to do that?

Anchored in a real goal, no label-matching shortcut.

**Bad tree-test task (label-matched):**

> Find the "Dispute a Charge" page.

The participant just looks for the matching label and the test measures string-matching, not findability.

**Good segmentation example:**

> The study compares admins (who manage organization-wide settings) and end users (who interact with their own account only). Each segment runs separately with n=15. The two dendrograms will be compared side by side — divergence between them is itself a finding.

**Bad segmentation example (demographic, not behavioral):**

> The study compares users at small companies (<100 employees) vs. large companies (>100 employees).

Company size doesn't shape mental model in most cases — role does. Segmenting on company size will surface the same mental model with extra steps.

**Good per-task readout (tree test):**

| Task | Success rate | Direct success | Time (median) | Notes |
|---|---|---|---|---|
| Update payment method | 92% | 78% | 18s | Strong — ship as-is |
| Dispute a charge | 54% | 31% | 47s | Failing — most participants go to Help, not Billing |
| Change plan | 81% | 64% | 28s | Acceptable — directness is low; consider a secondary entry from the dashboard |

Per-task numbers point to specific IA decisions.

## Analysis and synthesis defaults

The brief should name how findings get from raw sort data to an IA recommendation. For card-sort and tree-test studies, the synthesis pattern is structured:

- **Dendrogram review (card sort).** The platform produces the dendrogram automatically. The synthesis walks through which clusters held together strongly, which were ambiguous, and what category names the strongest clusters earned.
- **Standardization grid (card sort).** If open or hybrid, document the category names users invented. The frequency of each name is the terminology signal.
- **Per-task numbers (tree test).** Per-task success rate, direct-success rate, time-to-find, and the most common "wrong" path. The numbers are the readout; the wandering paths are the diagnosis.
- **Segment comparison.** If multiple segments, surface where the segments diverge — divergence is itself a finding and may force segment-specific IAs (e.g., a separate "for admins" navigation).
- **Recommended IA + open questions.** Synthesis ends with a recommended IA, the confidence level, and the open questions (cards or tasks where the data was ambiguous and a follow-up study would tighten the answer).

Name a synthesis owner and a target readout date in the brief. Tree-test analysis is fast (the platform does most of it); plan the readout within a week of fielding.

## Anti-patterns

- **Too many cards (>60).** Above 60, dropout climbs and late-card sort quality degrades. If the natural list is longer, prioritize or split into two studies.
- **No segmentation when segments diverge.** Averaging across segments with different mental models produces an IA that fits no one. Default to per-segment analysis whenever the audience has plausibly different mental models.
- **Segmenting by demographics instead of behavior.** Company size, age, location rarely shape IA. Role, frequency of use, and goals do. Use behavioral segmentation.
- **Skipping tree-test validation.** Card sort alone produces a candidate IA; shipping that without validation is a guess. The tree test is what closes the loop. If the brief proposes a card sort with no tree-test follow-up, surface this gap.
- **Internal-taxonomy cards.** Cards phrased in internal team language don't surface user mental models — they surface how well users can decode internal language. Use user-natural phrasing throughout.
- **Label-matched tree-test tasks.** Tasks that include the destination label tell the test nothing; they measure string-matching. Use goal-phrased tasks.
- **No counterbalancing.** Fixed card or task order will bake order effects into the results. Randomize per participant.
- **Treating card sort as a survey.** Card sort surfaces *grouping behavior*, not *opinion*. Adding "what do you think of this navigation?" questions to a card sort dilutes both methods.
- **Running open card sort when the team has already decided the categories.** That's validation theater dressed as discovery. Use closed card sort or a tree test directly.
- **Single round of tree testing on a borderline IA.** If tree-test success rates on critical tasks are below 70%, revise and retest. One round is rarely enough for the final IA.

## Brief deltas summary

Quick checklist of what the card-sort / tree-test pattern adds to the default brief. The agent generating the brief should confirm each item is present:

- [ ] Card set named (40–60 items typical) or linked.
- [ ] Card phrasing reviewed for user-natural language.
- [ ] Format named: open / closed / hybrid card sort.
- [ ] Audience segments named with separate recruiting plans.
- [ ] Analysis outputs named (dendrograms / similarity matrix / standardization grid / per-task numbers).
- [ ] Tree-test pairing plan named (or rationale if standalone).
- [ ] 5–10 goal-phrased tree-test tasks drafted.
- [ ] Tooling platform named with rationale.
- [ ] Moderation type named (unmoderated default; moderated by exception).
- [ ] Sample size: 15–30 per segment + 11% no-show buffer.
- [ ] Session time: 15–25 min sort / 10–15 min tree test.
- [ ] Counterbalancing plan (randomize card and task order per participant).
- [ ] Pilot scheduled before main fielding.

## Cross-references

- Methodology selection: `references/methodology-selection.md`
- Usability testing (the tree-test variant is part of that pattern's method shortlist; full IA validation lives here): `references/patterns/methods/usability-testing.md`
- Sample sizes (authoritative table — IA methods need ≥15 per segment): `references/sample-sizes.md`
- Anti-patterns library (full): `references/anti-patterns.md`
- Question writing (specific / actionable / practical filter): `references/question-writing.md`
- Discovery interview (upstream when the team isn't sure what content should exist at all): `references/patterns/methods/discovery-interview.md`
