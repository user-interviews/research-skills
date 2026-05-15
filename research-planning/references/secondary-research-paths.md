# Secondary Research Paths

## Purpose

Concrete digging guidance for Exit B output. When primary research is plausible but secondary research should come first — typically when the audience is hard to reach and the topic is publicly written about — this file gives the agent the search-term construction patterns, source types, internal-data check protocol, and a 2-hour desk-research playbook to surface in the redirect.

The goal is not to refuse the brief. The goal is to sequence the work: do the cheap, fast, already-public reading first, then come back for a focused primary-research brief on whatever gap remains.

## When to apply

Load this when Exit B fires. Exit B's triggers (from the design memo):

- Hard-to-reach audience (rare / monthly contact frequency) + topic publicly written about + user hasn't done desk research yet.
- Analytics could plausibly answer the question and the user hasn't checked.
- Question is broad enough that secondary research would meaningfully narrow it before primary work is scoped.

The output of Exit B is a short redirect message naming specific search terms, source types, and the standing offer to return for a focused brief on the irreducible gap. This file is the catalog the agent draws from.

---

## Search-term construction

Effective desk research is more about query construction than tool choice. The same search engine produces wildly different results depending on the query.

**Boolean operators.**

- `AND` — narrows. Use to combine the audience with the topic: *`"research ops" AND "incentive policy"`*.
- `OR` — broadens. Use to capture synonyms: *`"research ops" OR "user research operations" OR "ResearchOps"`*.
- `NOT` (or `-`) — excludes. Use to filter noise: *`"design system" -"design system thinking"`* to exclude philosophy results when you want toolkit results.

**Exact-phrase searches.**

Wrap multi-word phrases in double quotes to require the exact match: *`"jobs to be done" framework`* vs. unquoted, which matches any document mentioning the three words separately.

**Site-specific operators.**

Restrict to high-trust sources by domain:

- `site:hbr.org` — Harvard Business Review case studies and frameworks.
- `site:nngroup.com` — NN/g for UX research methodology.
- `site:medium.com` — broad practitioner writing (mixed quality, useful for breadth).
- `site:substack.com` — newsletters; surfaces independent operator writing.
- `site:reddit.com` — user voice and community discussion. Combine with subreddit: `site:reddit.com/r/userexperience`.
- `site:gov` or `site:edu` — public-sector and academic sources.

**Date-bounded searches.**

Use the search engine's Tools → Time menu (Google) or the `before:` / `after:` operators where supported. For fast-moving topics (AI tooling, post-2023 SaaS pricing), restrict to the last 12 months. For methodological topics (interview techniques, sample sizing), recency matters less.

**Industry-specific search engines.**

- **Google Scholar** — peer-reviewed and citation-counted. Best for any topic with academic coverage: behavior change, decision-making, healthcare, education.
- **Semantic Scholar** — Scholar alternative with better AI-driven topic clustering.
- **Statista** (often paywalled) — for "how many / how much / how often" market-sizing questions.
- **Crunchbase** / **PitchBook** — for company-level B2B questions (funding, headcount, customer-base estimates).
- **App Annie** / **Sensor Tower** — for mobile app market questions.

---

## Source types by industry

The right source depends on the audience and topic. Map the user's situation to one of these clusters, then surface the matching sources in the redirect.

**B2B SaaS / product / growth.**

- Industry blogs: a16z, First Round Review, Reforge, Substack newsletters (Lenny's, Elena Verna, Wes Bush).
- Vendor research reports: Gainsight, ChurnZero, HubSpot, Productboard.
- Review platforms: G2, TrustRadius, Capterra — surface real customer language about pain points and feature gaps.
- Community: Reddit r/SaaS, Indie Hackers, Product Hunt, Mind the Product, Pavilion.

**Consumer / D2C.**

- Reddit and forums (most relevant subreddit for the topic).
- App store reviews (iOS App Store, Google Play) — best raw source of consumer voice for any app-shaped product.
- Pew Research, McKinsey, BCG consumer reports.
- Trade publications (Modern Retail, Glossy, AdAge).

**Healthcare / clinical.**

- NIH / PubMed for peer-reviewed evidence.
- Industry associations: HIMSS, AMA, AHRQ.
- Vendor research from Epic, Cerner, Veeva (often paywalled but white papers free).
- ClinicalTrials.gov for ongoing study context.

**Enterprise IT / infrastructure.**

- Gartner, Forrester, IDC reports (often paywalled; check if the user's org has a subscription).
- Vendor whitepapers: AWS, Azure, GCP, Snowflake, Databricks.
- Stack Overflow / Reddit / Hacker News for practitioner perspective.

**Academic / niche / specialist.**

- Google Scholar (`scholar.google.com`) — the default for anything with academic coverage.
- Conference proceedings (CHI, CSCW for HCI; NeurIPS, ICML for AI; SIGCOMM for networking; etc.).
- Association journals — most professional fields have a peer-reviewed journal; find it.

**When industry is unclear or the topic spans clusters:** start with Google Scholar (for any framework / methodology coverage) and the most relevant industry blog cluster, then expand from what those surface.

---

## Internal-data check protocol

Before recommending any external desk research, check what the user might already have inside the org. Internal data is faster, cheaper, and directly relevant — and is the most common Exit B trigger Pejman/Ronsen flag.

**Order of operations:**

1. **Analytics dashboards.** Is there event data, cohort analyses, funnel data, or revenue cuts that touch the question? Most product analytics tools (Heap, Amplitude, Mixpanel, Pendo) have a search bar — start there.
2. **Prior research repository.** Does the team have a Notion / Confluence / Dovetail / EnjoyHQ repo of prior studies? If yes, search it for the audience and topic before doing any external desk research.
3. **Support tickets / NPS verbatims.** Zendesk, Intercom, or wherever the customer voice lives. Filter by topic keywords; read the top 20 verbatims. Often answers "is this even a real problem" in 15 minutes.
4. **Sales / customer success notes.** Salesforce, Gong, Chorus, or the team's CRM. Sales calls about the topic surface customer language and objections; CS notes surface adoption barriers.
5. **Product analytics (Heap, Amplitude, Mixpanel).** If the question is behavioral ("how many users do X," "what's the path from A to B"), this is often the right first stop.

**Ask the user before recommending external search:**

> *"Before we go external — have you checked your analytics dashboards or the existing research repo? Often the question is already answered inside the org."*

If the user has, accept that and move to external sources. If not, recommend internal first.

---

## "How to do desk research in 2 hours" mini-playbook

A concrete protocol the user can follow before scoping primary research. Six steps, ~2 hours total. This is the meat of an Exit B redirect — give the user something they can act on today.

1. **Define 3–5 specific questions** *(15 min).* Translate the broad topic into specific, answerable questions. Not *"how do research ops leads think about incentives,"* but *"what incentive amounts do peer research ops teams use for tier-1 enterprise participants? what policies do they have for non-employee incentives? what tooling do they use?"* Specific questions narrow the search.

2. **Run 5–10 targeted searches per question** *(30 min).* For each question, run a mix: one broad search, one site-specific (industry blog), one Scholar (if academic coverage exists), one Reddit / community search. Note results that look promising; don't read in depth yet.

3. **Scan first 10 results per search, save 2–3 high-signal sources per question** *(45 min).* Skim titles and first paragraphs; save the 2–3 that actually answer the question. Read those in full.

4. **Synthesize: what did you learn? what's still unanswered?** *(20 min).* Open a doc. Write one paragraph per question: what the public sources say, with one or two specific examples or numbers. Flag what's still ambiguous.

5. **Identify the irreducible gap** *(5 min).* What's the one thing you couldn't answer from public sources? That's the gap primary research should close. Often the gap is narrower than the original topic — which is the whole point of doing desk research first.

6. **Decide: design primary research on the gap, or did desk close it?** *(5 min).* If desk closed it, great — no primary research needed. If a gap remains, the gap is now scoped enough to brief a focused study on. Come back to the planning agent with the gap, not the original topic.

The 2-hour budget is a forcing function. It's enough to surface what's public; not enough to write a literature review. The deliverable is a one-page synthesis, not a research report.

---

## Output framing for Exit B

When Exit B fires, the agent's redirect should be specific and actionable — not a generic "have you considered desk research." Concrete shape:

> *"Sounds like this audience is hard to recruit but the topic is well-covered publicly. Before scoping primary research, try this 2-hour desk path: [3 specific search queries built from the user's case]; then check [1-2 high-signal source types for their industry]; then look at your [internal data source — analytics, prior research, support tickets — whichever the user has]. If a gap remains after that, come back and we'll design a focused study on what's left."*

What makes this land:

- **Specific search queries**, not "do some searching." Build them from the Phase 1 surface. Quote them so the user can paste them directly.
- **Specific sources**, not "look online." Name two or three based on the user's industry.
- **The internal-data check**, if the user hasn't already done it.
- **The standing offer to return** — Exit B is not a refusal. The agent is sequencing the work, not declining it. The handoff back is the closing move.

**When to recommend just the internal-data check (without external desk).**

If the user's question is clearly answerable by analytics or prior research and they haven't checked, the Exit B redirect is tighter:

> *"Before scoping primary research — this looks like a question your analytics could answer. Pull [specific event / cohort] from [their analytics tool]; if the data doesn't close the question, come back and we'll scope from what the data revealed."*

Either shape (full 2-hour desk path or analytics-only check) ends with the standing offer. The agent's job is to make the redirect feel like sequencing help, not gatekeeping.

---

## What NOT to do

- **Don't refuse without an actionable next step.** "You should do desk research first" without concrete queries is a refusal in research-skill clothing.
- **Don't recommend external desk before checking internal.** Analytics, support tickets, prior research, and CS notes are faster and more directly relevant.
- **Don't pretend desk closes every Exit B case.** Some gaps genuinely need primary research. The 2-hour playbook ends with "identify the irreducible gap" precisely because that gap is what to scope next.
- **Don't gatekeep the brief.** If the user pushes back and says they've already done desk research, accept that and move to Phase 3. Don't audit their desk work.
- **Don't generate a 2-hour playbook that's actually 20 hours.** The whole point is the time-bound forcing function. Six steps, two hours, one-page synthesis. Bigger investments belong inside a primary-research brief, not a desk-research playbook.
