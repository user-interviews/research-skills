---
description: Draft a research project brief from a research question, using User Interviews' planning playbook.
argument-hint: "<research question or topic>"
---

# /plan-research

Turn a research question (or fuzzy topic) into a structured research brief.

## What this does

Invokes the `research-planner` sub-agent, which walks an 11-step planning workflow:

1. Pre-flight gate ("should we even do this research?")
2. Why / What / Who framing
3. Question refinement (specific / actionable / practical)
4. Assumption surfacing
5. Question-storming → prioritize
6. Pattern recognition (which method + context patterns apply)
7. Methodology selection (multi-axis rubric)
8. Draft brief from UI's canonical 6-field template
9. Anti-pattern check
10. Append handoff appendix (optional UI MCP integration)
11. Apply team-context overrides + return

The output is a structured brief following User Interviews' canonical 6-field plan structure: **What** / **Why** / **How** / **Who** / **When and where** / **Next steps**.

## Usage

```
/plan-research "How do enterprise teams choose CI/CD tools?"
```

```
/plan-research "Why are users dropping off at our checkout?"
```

```
/plan-research "Whether our new pricing page communicates value clearly"
```

## What you'll be asked

The sub-agent will likely ask 1–3 clarifying questions before drafting:

- What decision will this research inform? (the gating question)
- Who's the audience for the insights — researchers, PMs, designers, executives?
- What's your timeline / budget context?

If your input already includes these, the sub-agent skips the question and drafts directly.

## Customization

If `team-context/team-context.md` exists in your fork of this plugin, the sub-agent reads it and applies per-team overrides (voice, terminology, custom personas, default methodology, custom handoff text). See `team-context/README.md` for the schema.

## Invocation

Read the user's input from `$ARGUMENTS`. Pass it to the `research-planner` sub-agent (in `agents/research-planner.md`) along with:

- The full text of `$ARGUMENTS` as the research question/topic
- Today's date
- A check for `team-context/team-context.md` — if present, load and pass to the sub-agent
- An optional project-type hint if the user's message explicitly named one (e.g., "rapid PMF research on X" → hint "rapid + pmf")

The sub-agent owns the workflow and returns the brief.

## Notes

- This is the input contract for what eventually becomes an MCP tool in UI's MCP. The args here become the tool's args schema; the sub-agent's prompt becomes the tool's prompt.
- The slash command is intentionally thin — workflow logic lives in the sub-agent, not here.
