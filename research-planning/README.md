# research-planning

A Claude Code plugin that turns a research question into a structured research brief, drawing on User Interviews' published planning playbook.

The skill is built for **non-researchers** doing research — PMs, designers, customer-success folks, founders — who want a credible brief without having to learn research methodology from scratch. Researchers can also use it for question refinement and brief structure.

## What this is

Input: a research question or fuzzy topic.

Output: a structured research brief following UI's canonical 6-field plan: **What** / **Why** / **How** / **Who** / **When and where** / **Next steps**.

Along the way, the skill:

- Runs a pre-flight gate ("should we even do this research?") — refuses to draft a brief if the question fails canonical UI checks
- Refines the research question (specific / actionable / practical filter)
- Surfaces hidden assumptions
- Picks a methodology (multi-axis rubric, not guesswork)
- For interview-style methods, runs an AI-moderation-fit check (AI vs. human moderation decision)
- Applies UI's published frameworks: Decision-Driven Research, MVR, HCD Three-Question
- Catches anti-patterns (method-first thinking, leading questions, synthetic users as primary evidence, etc.)
- Outputs a brief with an optional handoff appendix for User Interviews' MCP

## Install

In Claude Code:

```
/plugin marketplace add user-interviews/research-skills
/plugin install research-planning@research-skills
```

Verify install:

```
/plugin list
```

You should see `research-planning` in the installed list.

## Usage

The slash command takes your research question or topic as an argument:

```
/plan-research "How do enterprise teams choose CI/CD tools?"
```

```
/plan-research "Why are users dropping off at our checkout?"
```

```
/plan-research "Whether our new pricing page communicates value clearly"
```

You can also invoke the skill with natural language:

> "Can you help me plan a research project on how new users discover our help docs?"

The skill walks you through an 11-step workflow:

1. Pre-flight gate — is this research worth running?
2. Why / What / Who framing — business goal, decision, audience
3. Question refinement
4. Assumption surfacing
5. Question-storming → prioritize
6. Pattern recognition (which method + context patterns apply)
7. Methodology selection
8. Draft brief
9. Anti-pattern check
10. Append handoff appendix
11. Apply team-context overrides + return

The skill may ask 1–3 clarifying questions before drafting — typically about the decision being made, the audience for the insights, and the timeline/budget context.

## What you'll get back

A brief structured like this:

````markdown
# [Project name]

## What
- Research question(s): [3–5 prioritized questions]
- Decision this research enables: [the gating decision]
- Hypotheses / assumptions to test: [ranked by risk × confidence]

## Why
- Business or product goal: [...]
- What we'll do if we don't do this research: [the counterfactual]

## How
- Method: [selected method + rationale]
- Role of AI: [input / pressure-test / none]
- Moderation: [human / AI per fit rubric]

## Who
- Participants: [criteria, sourcing]
- Sample size: [from canonical UI table + buffer]
- Audience for insights: [...]

## When and where
- Timeline: [...]
- Budget & incentives: [...]
- Tools & logistics: [...]

## Next steps
- Deliverables: [...]
- Activation plan: [...]
- Follow-up: [...]

---

## Ready to launch this study?
(Optional UI MCP handoff appendix)
````

## Optional: User Interviews MCP integration

If you have access to User Interviews' MCP (the customer research platform's project-creation tool), you can hand off the brief directly:

1. After running `/plan-research`, paste the resulting brief into a Claude chat connected to UI's MCP.
2. Say: "Use this brief and start a project on User Interviews."
3. The MCP's project-creation agent will draft incentive levels, screener questions, and targeting criteria from the brief's content. Iterate interactively before submitting the draft.

If you don't use UI's MCP, the brief is portable — share with stakeholders for review, paste into any recruiting tool, or use as a working document.

## Customization

The skill is forkable. The most common customizations:

### `team-context/team-context.md`

Drop a single markdown file in `team-context/` with your team's:
- Voice override (plain language default; researcher-fluent option)
- Default methodology preferences
- Custom personas (e.g., persona A/B for a B2B SaaS product)
- Terminology swaps
- Custom handoff text (if you use a different recruiting workflow)

See [`team-context/README.md`](team-context/README.md) for the full schema and an example.

### Custom pattern files

Beyond `team-context.md`, you can add your own pattern files:
- `references/patterns/methods/<custom>.md` — method-specific brief modifications
- `references/patterns/contexts/<custom>.md` — context-specific modifications (urgency, regulatory environment, etc.)

The skill's pattern recognition picks them up automatically.

### Fork it

If your customizations are extensive, fork the repo. Modify any reference, template, or pattern file. Install your fork via your own marketplace.

## Forking this for your team

```
git clone https://github.com/user-interviews/research-skills.git
cd research-skills
# Modify whatever you need
# Push to your own GitHub org
```

Then in Claude Code:

```
/plugin marketplace add YOUR_ORG/research-skills
/plugin install research-planning@research-skills
```

## How the skill is built

The skill consists of:

- A **slash command** (`commands/plan-research.md`) — entry point + input contract
- A **sub-agent** (`agents/research-planner.md`) — the workflow prompt (the load-bearing artifact)
- A **default brief template** (`templates/default-brief.md`) — UI's canonical 6-field structure + handoff appendix
- **Reference files** (`references/*.md`) — frameworks and rubrics the sub-agent loads on demand
- **Pattern files** (`references/patterns/methods/*.md` and `references/patterns/contexts/*.md`) — method-specific and context-specific brief modifications
- **Team-context directory** (`team-context/`) — opt-in customization layer

The sub-agent's system prompt encodes the workflow. References and patterns are loaded as the sub-agent reaches the relevant workflow step. This means the skill is self-contained and Claude Code-native — no external services, no API calls beyond Claude itself.

## Sources

The skill draws on User Interviews' published research planning content:
- [UI Field Guide — Planning UX Research](https://www.userinterviews.com/ux-research-field-guide-module/planning-user-research)
- [UI Field Guide — Methodologies](https://www.userinterviews.com/ux-research-field-guide-module/user-research-methods)
- [UI's AI Moderation Guide](https://www.userinterviews.com/ai-moderation-for-ux-research-guide)
- 27 load-bearing blog posts on research planning, methodology selection, and anti-patterns

Plus external research on AI moderation and synthetic users from NN/g, IDEO, Erika Hall, Outset, Strella, and the synthetic-users vendor's own published findings.

## Feedback

This is a POC. Feedback is welcome — open an issue at [github.com/user-interviews/research-skills](https://github.com/user-interviews/research-skills/issues) or DM Paolo Appley at User Interviews.

## License

MIT.
