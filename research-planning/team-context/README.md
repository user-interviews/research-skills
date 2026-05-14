# team-context/

This is the **customization layer** for the `research-planning` plugin. It's optional.

If `team-context/team-context.md` exists in your fork of this plugin, the sub-agent reads it and applies per-team overrides. The baseline works without anything here.

## Schema

Drop a file at `team-context/team-context.md` with any subset of these sections:

### `# Audience`
Who's reading the briefs this team produces. Options:
- `researchers` — trained research practitioners. Brief uses researcher-fluent vocabulary.
- `mixed` — mix of researchers + PMs/designers. Default voice.
- `non-researchers` — PMs, designers, customer-success, founders. Plain-language brief.

If unset, the plugin defaults to plain language.

### `# Voice`
Tone override.
- `plain-language` (default) — accessible to anyone running research, even occasionally.
- `researcher-fluent` — uses field-standard terminology (generative, evaluative, ethnographic, etc.) without explanation.
- Free-text — any custom voice description the sub-agent will follow.

### `# Default methodology preferences`
If your team has a methodology house style — e.g., "always pair qual interviews with a follow-up survey" or "discovery interviews are N=8 default, not N=6" — describe it here. The sub-agent applies these as priors during methodology selection.

### `# Custom personas`
If your team works with specific personas — e.g., CircleCI's "Persona A (individual developer)" vs "Persona B (optimizer/spend owner)" — describe them here. The sub-agent uses these for the Who section of the brief.

Example:
```
# Custom personas

## Persona A — Individual developer
Owns CI/CD for their team. Cares about reliability and DX. Frustrated by complex config.

## Persona B — Optimizer / spend owner
Engineering leader or platform owner. Cares about cost, scaling, governance. Often a former Persona A.
```

### `# Terminology`
Vocabulary swaps. Pairs of "what the plugin says by default" → "what your team says."

Example:
```
# Terminology
- "customers" → "members"
- "research participants" → "research panelists"
- "stakeholders" → "partners"
```

### `# Custom handoff`
The plugin appends a "Ready to launch this study?" section by default that mentions the UI MCP. If your team uses a different recruiting workflow, override the appendix here. The plugin will use your text instead of the default.

Example:
```
# Custom handoff

When this brief is ready, paste it into our internal Notion under "Research Plans" and tag @reops. ReOps will route to recruiting.
```

## Example team-context.md

A full example file is below. Copy into `team-context/team-context.md` in your fork to use.

~~~markdown
# Audience
researchers

# Voice
researcher-fluent

# Default methodology preferences
- Default to N=8 for discovery interviews (we've found 6 misses tail variance)
- Always pair concept tests with a 5-question follow-up survey for triangulation
- Strict generative-before-evaluative ordering for any new product question

# Custom personas
## Persona A — Individual developer
Owns CI/CD for their team. Cares about reliability and DX. Frustrated by complex config.

## Persona B — Optimizer / spend owner
Engineering leader or platform owner. Cares about cost, scaling, governance. Often a former Persona A who has scaled up.

# Terminology
- "users" → "developers" (where the audience is the developer persona)
- "stakeholders" → "engineering leaders"

# Custom handoff

When this brief is ready, paste it into our internal Notion under "Research Plans" and tag @reops. ReOps will route to recruiting.
~~~

## Pattern overlays (advanced)

Beyond the single `team-context.md` file, you can also add custom pattern files:

- `research-planning/references/patterns/methods/<custom-method>.md` — define how to brief a method specific to your team.
- `research-planning/references/patterns/contexts/<custom-context>.md` — define conditions and brief modifications for your team's workflows.

The sub-agent's pattern recognition picks these up alongside the built-in patterns. Format: same shape as the built-in pattern files (`## When this pattern applies` / `## What it adds to the brief` / `## Defaults` / `## Anti-patterns`).

## Updating team-context.md

When your team's conventions evolve, update `team-context.md` in your fork. The sub-agent reads fresh each invocation — no rebuild needed.

If you're forking and customizing, consider opening a PR upstream when your additions are general enough to apply to other teams.
