---
description: Draft a research project brief from a research question, using User Interviews' planning playbook.
argument-hint: "<research question or topic>"
---

# /plan-research

Turn a research question (or fuzzy topic) into a structured research brief — or, when research isn't the right move, an honest redirect.

## What this does

Invokes the `research-planner` sub-agent, which runs a conversational planning flow built around four behaviors:

- **Interview.** Starts with a broad opener about what you're trying to figure out and what you already know. Foundational fields (Why / What / Stakeholders / Subjects) are inferred from what you say, not asked cold.
- **Research.** Scans your workspace for relevant files (capped, with a chance for you to point it at the right place first), conditionally runs a web search when your audience is hard to reach and the topic is publicly written about, recognizes which method + context patterns apply, and notes which execution tools are available in your environment.
- **Plan.** Confirms the inferred frame, refines questions against the specific / actionable / practical rubric, surfaces assumptions, selects a methodology, recommends specific tools you can actually use, and drafts the 6-field brief.
- **Implementation.** Appends a short handoff paragraph tailored to the tool(s) you chose. The plugin does not invoke any MCP itself — the brief is portable.

These phases are internal scaffolding for the agent's behavior, not gates you have to step through. The agent narrates pivots in plain language when new information changes the picture.

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

The sub-agent opens with a single broad question — verbatim or close to:

> *"Tell me what you're trying to figure out — topic, learning goal, and what you already know about it."*

From your answer, it infers as much of the foundational frame as the response supports (the goal behind the goal, the concrete decision, who else cares, who the work would study) and surfaces that frame back for you to correct. It asks targeted follow-ups only on the gaps your answer didn't address — one question per turn, plain English — and never re-asks anything you've already covered.

You can surface a timeline preference (Express 1–3 days / Rapid 1–2 weeks / Standard 3–6 weeks / In-depth 6+ weeks) at any point.

The sub-agent will NOT assume you're a researcher — the skill defaults to plain language for non-researcher users (PM, designer, founder, customer-success, etc.).

### Three possible outcomes

Not every invocation produces a brief. The sub-agent treats three outcomes as first-class:

- **Here's your brief.** The default. Research is the right move and there's enough to draft against. You get the 6-field brief plus a handoff paragraph.
- **Do more digging first.** Fires when your audience is hard to reach, the topic is well-covered publicly, and you haven't read the public material yet — or when analytics could plausibly answer the question and that check hasn't happened. The sub-agent points at concrete digging steps (search terms, source types, internal data sources) and offers to come back for a focused brief on the irreducible gap.
- **Research isn't the right fit.** Fires when the work you're describing is actually a decision memo, a stakeholder alignment problem, an analytics question, or selective evidence-gathering for a decision already made. The sub-agent names what would actually help and redirects.

If you push back on a redirect and want the brief anyway, the sub-agent asks you to acknowledge the concern explicitly and documents it in the brief.

## Customization

If `team-context/team-context.md` exists in your fork of this plugin, the sub-agent reads it and applies per-team overrides (voice, terminology, custom personas, default methodology, custom handoff text). See `team-context/README.md` for the schema.

## Invocation

Read the user's input from `$ARGUMENTS`. Pass it to the `research-planner` sub-agent (in `agents/research-planner.md`) along with:

- The full text of `$ARGUMENTS` as the research question/topic
- Today's date
- A check for `team-context/team-context.md` — if present, load and pass to the sub-agent

The sub-agent owns the workflow and returns the brief.

## Notes

- This is the input contract for what eventually becomes an MCP tool in UI's MCP. The args here become the tool's args schema; the sub-agent's prompt becomes the tool's prompt.
- The slash command is intentionally thin — workflow logic lives in the sub-agent, not here.
