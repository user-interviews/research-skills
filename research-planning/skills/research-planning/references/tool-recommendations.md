# Tool Recommendations

## Purpose

Method → tool mappings for Phase 2 Stream 4 (tool/environment discovery) and Phase 3 (tooling recommendation). The plugin is architecturally MCP-agnostic — it never invokes any MCP — but when tools are available in the agent's environment or named by the user, Phase 4's handoff is meaningfully more useful if it's specific to those tools. This file is the catalog the agent draws from to pick that specificity.

The catalog is intentionally non-exhaustive. New tools appear constantly; this file captures the most common categories and the method-fit signals for each. Forks can extend it for org-specific tooling.

## When to apply

Two load points:

1. **Phase 2 Stream 4 (tool/environment discovery).** After auto-detecting MCPs and asking the user about non-MCP tools, build a working tooling shortlist mapped to the methods most likely to come out of Phase 3. The catalog tells the agent which tools fit which methods.
2. **Phase 3 (tooling recommendation step).** After methodology selection has firmed up the method, surface 2–3 ranked options to the user. The catalog provides the candidate set and the fit-rationale.

---

## How to use this catalog

For each method, identify candidate tools, then rank by environment availability:

1. **Auto-detected MCPs first.** If a tool's MCP is visible in the agent's environment, it's the top of the ranked list — the user has it, the integration path is clean.
2. **User-named tools second.** If the user mentioned a tool the agent can't auto-detect (Maze, Lyssna, dscout, etc.), surface it as a peer option to MCP-detectable tools.
3. **Manual fallback third.** If no tool fits and the user hasn't named one, surface the manual path (internal panel + scheduling tool + recording tool) as the realistic option. Don't pretend a tool exists when it doesn't.

Surface 2–3 ranked options, not a comprehensive enumeration. The user has to choose; too many options is paralysis. If a tool clearly dominates (only MCP-detectable option for the chosen method), say that and recommend it.

**Anti-pattern to avoid:** never recommend a tool the user doesn't have, can't access, or hasn't mentioned. If the chosen method has no tool fit, name the manual path honestly. Phase 4's handoff is more useful when honest about manual recruiting than when it papers over the gap with a tool the user can't use.

---

## Recruiting tools

Recruiting is the first step in most primary-research methods. Match the recruiting tool to the audience and method shape.

**User Interviews MCP** *(auto-detectable if `user-interviews-*` MCP is in env).*

- **Methods:** 1:1 interviews, focus groups, surveys (UI Surveys), diary studies, unmoderated tasks. Broad-spectrum recruiting platform.
- **MCP detectability:** Yes — look for `user-interviews-production`, `user-interviews-staging`, or `userinterviews` server names.
- **Strengths:** B2B and consumer panels, custom screeners, fast turnaround, integrated incentive payment.
- **Limitations:** Less coverage for highly niche enterprise audiences; tier-1 enterprise often requires custom outreach.

**dscout** *(manual config — no MCP today).*

- **Methods:** Diary studies, mobile-first qual at scale, longitudinal research, photo/video elicitation.
- **MCP detectability:** No.
- **Strengths:** Best-in-class diary tooling; built for asynchronous qual; strong mobile capture.
- **Limitations:** Higher per-study cost; overkill for simple 1:1 interview recruiting.

**UserTesting** *(manual config — no MCP today).*

- **Methods:** Moderated and unmoderated usability testing, customer experience studies, with an integrated recruiting panel.
- **MCP detectability:** No.
- **Strengths:** Legacy enterprise relationships; broad consumer panel; integrated session recording.
- **Limitations:** Less flexible for non-usability methods; panel quality varies by segment.

**Manual panel sourcing** *(fallback — no tool).*

- **Methods:** Any method, when no recruiting tool is available or the audience is too niche for panel providers.
- **MCP detectability:** N/A.
- **How it works:** Internal customer list, outreach via email / Slack / CRM, scheduling via Calendly or similar, manual incentive payment.
- **When to recommend:** Tier-1 enterprise audiences, internal-only research, or when the user names no recruiting tool and has none available.

---

## Testing tools — moderated

For moderated remote usability, depth interviews with prototype walk-throughs, or any synchronous session where a human runs the conversation.

**Lookback** *(manual config — no MCP today).*

- **Methods:** Moderated remote usability, mobile usability with screen capture, live observation by stakeholders.
- **MCP detectability:** No.
- **Strengths:** Built specifically for usability sessions; observer rooms; tagged moments.
- **Limitations:** Smaller user base than Zoom-based workflows; learning curve for stakeholders.

**Userlytics** *(manual config — no MCP today).*

- **Methods:** Moderated and unmoderated usability; has its own panel.
- **MCP detectability:** No.
- **Strengths:** Panel + tool in one; cross-device.
- **Limitations:** Less common than Lookback or Maze in B2B contexts.

**Maze (moderated mode)** *(manual config — no MCP today).*

- **Methods:** Limited moderated usability — primarily an unmoderated platform, with moderated as a secondary feature.
- **MCP detectability:** No.
- **When to recommend:** Only if the user already uses Maze and wants a single platform for both modes. For moderated-only, prefer Lookback.

**Zoom / Google Meet + Granola** *(fallback, very common).*

- **Methods:** Any moderated session — interviews, prototype walk-throughs, usability.
- **MCP detectability:** Granola yes (auto-detect if Granola MCP in env); Zoom and Meet are clients, not MCPs.
- **Strengths:** Universally available; low friction; transcription via Granola or Otter.
- **Limitations:** No purpose-built observer rooms or session tagging; sessions are recordings, not structured data.

---

## Testing tools — unmoderated

For tasks the participant completes on their own time, without a moderator. Higher n, lower depth.

**Maze** *(manual config — no MCP today).*

- **Methods:** Unmoderated usability (Figma / prototype tests), first-click testing, preference testing, surveys.
- **MCP detectability:** No.
- **Strengths:** Tight Figma integration; clean reporting; widely adopted in product-design teams.
- **Limitations:** No depth interviewing; not built for qualitative discovery.

**Lyssna (formerly Usability Hub)** *(manual config — no MCP today).*

- **Methods:** Preference testing, first-click testing, five-second tests, surveys.
- **MCP detectability:** No.
- **Strengths:** Lightweight tests, fast turnaround, lower per-study cost than Maze.
- **Limitations:** Smaller native panel; often paired with separate recruiting.

**UserTesting (unmoderated package)** *(manual config — no MCP today).*

- **Methods:** Unmoderated usability with recorded narration ("think-aloud").
- **MCP detectability:** No.
- **Strengths:** Integrated panel + recording; produces narrated session videos.
- **Limitations:** Higher cost than Maze/Lyssna; panel skews general consumer.

---

## Transcription / recording

For capturing what was said in moderated sessions, so the agent can later support analysis or so the brief's "Next steps" can name a concrete analysis path.

**Granola** *(auto-detectable if Granola MCP in env).*

- **Flow:** Captures meeting audio (Zoom, Meet, in-person), produces transcripts with speaker attribution, integrates with notes.
- **MCP detectability:** Yes — `personal-os` MCP or similar exposes `get_granola_transcript` and `search_granola_transcripts` tools.
- **Strengths:** Cleanest transcription experience for individual researchers; transcripts auto-saved to a searchable corpus.
- **Limitations:** Less common in team settings without org-wide rollout; individual-account model.

**Otter** *(manual config — no MCP today).*

- **Flow:** Real-time transcription, speaker labels, summary generation.
- **MCP detectability:** No.
- **Strengths:** Widely used; good speaker attribution.
- **Limitations:** Summary quality varies; less integrated than Granola for research workflows.

**Fathom** *(manual config — no MCP today).*

- **Flow:** Meeting transcription + AI summarization; popular in sales/CS contexts.
- **MCP detectability:** No.
- **Strengths:** Strong summarization; CRM integrations.
- **Limitations:** Sales-oriented features may not fit pure research workflows.

**Bluedot** *(auto-detectable if Bluedot MCP in env, alongside Granola).*

- **Flow:** Similar to Granola — meeting capture, transcript generation, searchable corpus.
- **MCP detectability:** Yes — same MCP family as Granola in some setups.
- **When to recommend:** When the user already uses Bluedot (often for work-account separation).

---

## Survey tools

For quantitative or attitudinal data at higher n than qual permits.

**Typeform** *(manual config — no MCP today).*

- **Methods:** Conversational surveys, branching logic, lightweight quant.
- **MCP detectability:** No.
- **Strengths:** Best-in-class respondent experience; high completion rates.
- **Limitations:** Cost scales with response volume; limited analytics built-in.

**SurveyMonkey** *(manual config — no MCP today).*

- **Methods:** Standard surveys, internal pulse surveys, broad consumer surveys.
- **MCP detectability:** No.
- **Strengths:** Ubiquitous; corporate procurement-friendly.
- **Limitations:** Dated respondent experience; analytics modest.

**Qualtrics** *(manual config — no MCP today).*

- **Methods:** Enterprise-grade surveys, complex branching, advanced analytics, MaxDiff / conjoint.
- **MCP detectability:** No.
- **Strengths:** Most powerful survey platform; advanced quant methods.
- **Limitations:** Highest cost; learning curve.

**Google Forms** *(manual config — no MCP today; google-workspace MCP can detect the user has access).*

- **Methods:** Low-stakes internal surveys, quick polls, screeners.
- **MCP detectability:** Indirect — if google-workspace MCP is in env, the user can author Forms via that path.
- **Strengths:** Free, fast, no friction.
- **Limitations:** Bare-bones; not for external respondents at scale.

**UI Surveys (User Interviews)** *(auto-detectable if UI MCP is in env).*

- **Methods:** Survey + recruiting in one — recruit a target audience via UI panel and collect responses in the same flow.
- **MCP detectability:** Yes — same MCP signal as UI recruiting.
- **Strengths:** No need to stitch a recruiting tool to a survey tool; integrated incentive payment.
- **Limitations:** Survey-builder less feature-rich than Qualtrics or Typeform.

---

## Diary tools

For longitudinal qual at scale — capturing experience over days or weeks rather than a single session.

**dscout** *(manual config — no MCP today).*

- **Methods:** Diary studies (text, photo, video), mobile-first longitudinal qual, before-and-after experiences.
- **MCP detectability:** No.
- **Strengths:** Best-in-class diary tooling; built for the method.
- **Limitations:** Higher cost; overkill for one-off studies.

**Custom (Slack channel + structured prompts)** *(fallback — no tool).*

- **Methods:** Lightweight internal diary studies with employees or close customers.
- **MCP detectability:** Slack MCP can be detected if in env.
- **How it works:** Private channel per participant or shared channel with structured daily prompts; researcher reviews responses async.
- **When to recommend:** Internal-only studies, low budget, small n (3–5 participants).

---

## Method → tool mapping table

Quick-reference for Phase 3's tooling recommendation. Pick the row matching the chosen method; surface the columns as ranked options.

| Method | Primary tool(s) | MCP-detectable today | Manual fallback |
|---|---|---|---|
| **1:1 interviews (moderated)** | UI MCP for recruiting + Zoom/Meet + Granola for transcription | UI MCP, Granola MCP | Internal panel + Calendly + Zoom + Otter |
| **Focus groups** | UI MCP for recruiting + Zoom (gallery view) + Granola | UI MCP, Granola MCP | Internal panel + Zoom + Otter |
| **Unmoderated usability** | Maze, Lyssna, UserTesting unmoderated | None | Maze or Lyssna account (no MCP) |
| **Moderated usability** | Lookback, Userlytics, Zoom + screen-share | None | Zoom + screen-share + manual notetaking |
| **Diary studies** | dscout, UI MCP (for some diary configurations) | UI MCP partial | Slack channel + structured prompts |
| **Surveys (general)** | UI Surveys, Typeform, Qualtrics, SurveyMonkey | UI MCP | Google Forms |
| **Surveys (internal pulse)** | Google Forms, SurveyMonkey | google-workspace MCP (Forms) | Google Forms direct |
| **Preference / first-click tests** | Maze, Lyssna | None | Maze or Lyssna account |
| **Card sort / tree testing** | Maze, OptimalSort | None | Optimal Workshop account |
| **Concept testing** | UI MCP + UI Surveys, or Maze with prototype | UI MCP | Internal panel + Figma + survey tool |
| **A/B testing** | In-product (Optimizely, LaunchDarkly, custom) | None | Engineering team owns; researcher consults |
| **Analytics review** | Heap, Amplitude, Mixpanel, Pendo | None (most have APIs but not MCPs) | Direct tool access |
| **Ethnographic / in-person** | UI MCP for recruiting + in-person logistics + Granola or recorder | UI MCP, Granola MCP | Internal panel + manual logistics |

---

## What NOT to recommend

Anti-patterns the agent must avoid:

- **Tools the user doesn't have.** Never recommend Maze if the user hasn't named it and the agent can't detect it. The handoff promises a tool the user can't use.
- **Synthetic users / AI-substitute platforms.** No matter the method, never recommend synthetic users (synthetic-user.com, similar) as primary evidence. The pre-flight gate / Exit A explicitly refuses this; the tool catalog must not reintroduce it.
- **Tools that don't fit the method.** Maze is great for unmoderated usability and bad for depth interviewing. Granola is great for transcription and meaningless for unmoderated tests. If the method-tool fit is wrong, name the mismatch and offer the right tool — don't shoehorn.
- **Enterprise tools when the user is solo / scrappy.** Don't recommend Qualtrics to someone running a 5-person internal pulse survey. Match tool weight to study weight.
- **Tools without a clear method.** If the user names a tool that doesn't fit the chosen method ("I have a Maze account, can we use that for the interviews?"), surface the mismatch: *"Maze is great for unmoderated usability — for the depth-interview shape we landed on, you'd want Zoom + transcription. Want to stick with depth interviews, or shift the method to fit Maze?"* Don't silently substitute.
- **Multiple tools when one suffices.** If UI MCP covers recruiting and Granola covers transcription, that's two tools for one study — fine. Don't stack four tools where two cover the workflow.

---

## Output

The recommendation produces, in order:

1. **Method (recap from Phase 3).** One sentence naming what was chosen.
2. **Ranked tool options** — 2–3 candidates, MCP-detectable first. One sentence each on fit and any limitations relevant to the user's case.
3. **Recommended pick** — name the top option with a one-sentence rationale. If multiple tools cover different parts of the workflow (recruiting + transcription, e.g.), name each with its role.
4. **What the user confirms** — *"Want to lock these in, or adjust?"* The user weighs in; the chosen tool(s) get named explicitly in the brief's **How → Tools & logistics** sub-field.
5. **If no tool fits** — name the manual path honestly: *"No recruiting tool available — you'd source from your internal panel, schedule via Calendly or similar, and record via Zoom + Otter."* The brief's Tools & logistics field reads as "manual" with the specific gaps named.

This output feeds Phase 4's handoff paragraph, which is tailored to the chosen tool(s).
