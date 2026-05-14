# research-planning — Plugin Conventions

This file declares conventions and the overlay contract for the `research-planning` plugin. Read this before contributing or forking.

## What this plugin does

Takes a research question or topic as input and produces a structured research brief, drawing on User Interviews' published planning methodology.

The brief follows UI's canonical 6-field plan template (What / Why / How / Who / When and where / Next steps), enriched with universal frameworks (decision-driven research, MVR, methodology selection) and context-specific patterns (rapid cadence, AI-moderation fit, etc.).

## Architecture

- **`commands/plan-research.md`** — slash command, the user entry point. Defines the input contract.
- **`agents/research-planner.md`** — sub-agent containing the load-bearing workflow prompt. This is the artifact that eventually ports into UI's MCP project-creation tool.
- **`templates/default-brief.md`** — UI's canonical 6-field brief structure with a handoff appendix at the bottom.
- **`references/`** — framework references the sub-agent loads on demand (pre-flight gate, question-writing, methodology selection, anti-patterns, decision-driven research, planning procedure, sample sizes, AI research context).
- **`references/patterns/methods/`** — method-specific patterns (how to brief a usability test, discovery interview, survey, etc.).
- **`references/patterns/contexts/`** — context-specific patterns (rapid cadence, AI-augmented research).
- **`team-context/`** — optional customization layer. If `team-context/team-context.md` exists, the sub-agent reads it and applies per-team overrides (voice, terminology, custom personas, default methodologies).

## Overlay contract

The plugin baseline works without any customization. Three customization seams are available, in increasing scope:

1. **`team-context/team-context.md`** — single file with documented schema (see `team-context/README.md`). Override voice, terminology, default methodologies, custom personas, custom handoff.
2. **Pattern overlays** — drop additional pattern files in `references/patterns/methods/<custom>.md` or `references/patterns/contexts/<custom>.md`. The sub-agent's pattern recognition will pick them up.
3. **Fork** — clone the repo, modify any reference or template, install your fork via your own marketplace.

When `team-context/` is empty (just contains `README.md`), the plugin uses default behavior: plain language, decision-driven framework, UI's canonical brief structure.

## Sub-agent workflow (overview)

When invoked via `/plan-research`, the sub-agent runs these steps:

1. Pre-flight gate (refuse-or-redirect if goals unclear, no real-user contact planned, AI as substitute, etc.)
2. Why / What / Who framing
3. Question refinement (specific / actionable / practical + SMART)
4. Assumption surfacing ("If we're wrong that ___, this will fail")
5. Question-storming → prioritize to 3–5
6. Pattern recognition (which method + context patterns apply)
7. Methodology selection (multi-axis rubric; if interview-style → AI-moderation-fit check)
8. Draft brief from default template
9. Anti-pattern check
10. Append handoff appendix ("Ready to launch this study?")
11. Apply team-context overrides + return

Full workflow detail: `agents/research-planner.md`.

## Voice

Default: plain language. The skill's primary user is a non-researcher (PM, designer, customer-success, founder) doing research and producing a brief. Researchers may also use it for question refinement and structure.

Researcher-fluent voice is available via `team-context/team-context.md` (set `# Voice` section).

## Position on AI in research

The skill treats AI as an **input** to a brief (drafting, desk research, guide pressure-testing) or a **pressure-test** (synthetic users to vet a guide before fielding), **never as a substitute** for real-user contact in primary research.

This position is grounded in the convergent professional view across NN/g, IDEO, Erika Hall, and the synthetic-users vendor's own concession. See `references/ai-research-context.md` for the full position.

## Contributing

This is an external customer-facing skill. PRs welcome from anyone — see top-level repo README.
