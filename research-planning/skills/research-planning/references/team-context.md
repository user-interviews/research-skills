# team-context.md — customization layer (template)

> **This file is a template.** While every override section below is commented out, the `research-planning` skill treats this file as absent and falls back to its built-in defaults. To customize, uncomment the section(s) you want to override and replace the example content with your team's conventions. Save the file in place — the skill reads it on the next invocation.

The skill checks this file during the Draft phase. Optional overrides: Audience, Voice, Default methodology preferences, Custom personas, Terminology, Custom handoff. You can override one, several, or all.

If you want a worked example with content populated, the User Interviews internal variant of this skill ships with all sections filled in for the UI researcher team's defaults.

---

## How to uncomment

Each section below sits inside an HTML comment block (`<!-- ... -->`). To activate a section, delete the surrounding `<!--` and `-->` lines and edit the content between them.

---

## Audience

Who's reading the briefs this team produces. Options: `researchers` / `mixed` / `non-researchers`. Default if unset: plain language (assumes non-researchers).

<!--
# Audience
researchers
-->

---

## Voice

Tone override. Default: plain language. Common values:

- `plain-language` — accessible to anyone running research, even occasionally
- `researcher-fluent` — uses field-standard terminology (generative, evaluative, ethnographic) without explanation
- Free-text — any custom voice description the skill will follow

<!--
# Voice
researcher-fluent
-->

---

## Default methodology preferences

If your team has a methodology house style — e.g., "always pair qual interviews with a follow-up survey" or "discovery interviews are N=8 default, not N=6" — describe it here. The skill applies these as priors during methodology selection.

<!--
# Default methodology preferences
- Default to N=8 for discovery interviews (we've found 6 misses tail variance)
- Always pair concept tests with a 5-question follow-up survey for triangulation
- Strict generative-before-evaluative ordering for any new product question
-->

---

## Custom personas

If your team works with specific personas — e.g., "Persona A (individual developer)" vs "Persona B (optimizer/spend owner)" — describe them here. The skill uses these when populating the Who section of the brief.

<!--
# Custom personas

## Persona A — Individual developer
Owns CI/CD for their team. Cares about reliability and DX. Frustrated by complex config.

## Persona B — Optimizer / spend owner
Engineering leader or platform owner. Cares about cost, scaling, governance. Often a former Persona A who has scaled up.
-->

---

## Terminology

Vocabulary swaps. Pairs of "what the skill says by default" → "what your team says."

<!--
# Terminology
- "customers" → "members"
- "research participants" → "research panelists"
- "stakeholders" → "partners"
-->

---

## Custom handoff

The skill appends a "Ready to launch this study?" section by default that mentions the User Interviews MCP. If your team uses a different recruiting workflow, override the appendix here. The skill uses your text instead of the default.

<!--
# Custom handoff

When this brief is ready, paste it into our internal Notion under "Research Plans" and tag @reops. ReOps will route to recruiting.
-->

---

*End of template. While every override section above is commented out, the skill treats this file as absent and uses built-in defaults.*
