# research-skills

A Claude Code plugin (and companion Claude.ai skill) that turns a fuzzy research question into a structured brief — using the same playbook User Interviews' research ops team uses with hundreds of customers.

## Three outcomes, not one

Most planning tools only know how to draft a brief. This one handles three honestly:

1. **Here's your brief.** Default. Research is the right move; the playbook produces a 6-field brief you can hand to any execution tool.
2. **Do more digging first.** When the audience is hard to reach and the topic is publicly written about, the plugin recommends a 2-hour desk path — and stands ready to come back for a focused brief on the irreducible gap.
3. **Research isn't the right fit.** When the work is actually a decision memo, a stakeholder alignment problem, or selective evidence-gathering for a decision already made, the plugin names the right move instead.

The methodology underneath:

- **Pre-flight gate** from the User Interviews Field Guide — eight conditions that distinguish "this is research" from "this is something else."
- **Methodology rubric** — three forcing axes (generative-vs-evaluative, attitudinal-vs-behavioral, qual-vs-quant) plus six tiebreakers. Picks methods that actually answer the question, not methods that sound right.
- **Sample-size discipline** — the canonical NN/g + UI Field Guide tables, not "we'll figure it out."
- **Anti-pattern list** — the failure modes UI has watched customers run into for a decade. The plugin won't let you ship them.

## Example brief

Here's the kind of artifact the plugin produces. (Real output, lightly tightened.)

> ### Research Brief: PWDR confidence in their own findings
>
> **What.**
> - Research question: *How do non-researcher PMs and designers decide whether their qualitative findings are trustworthy?*
> - Decision this research enables: *Whether to build a "research quality check" feature inside our product, and what signals it should surface.*
> - Hypotheses to test: *(1) PWDRs use sample-size heuristics that don't match real-research norms. (2) They feel confident when patterns repeat across 3+ participants. (3) They feel doubt when one participant contradicts a hypothesis.*
>
> **Why.**
> - Goal: *We're shipping AI features to help non-researchers feel grounded in their own work; we don't know what calibrates that confidence today.*
> - What we'd do without this: *Ship the feature based on internal hypotheses; risk solving a non-problem.*
>
> **How.**
> - Method: *Generative 1:1 interviews, 5-8 PWDRs across PM and design roles.*
> - Role of AI: *Input — agent can help draft the guide. NEVER substitute for real participants.*
> - Moderation: *Human-moderated; PWDR self-reports are attitudinal and benefit from probing.*
>
> **Who.**
> - Participants: *PMs and designers running their own research at SaaS companies, 2-5 yrs in role, no formal research training.*
> - Sample size: *n=6 (3 PMs, 3 designers); over-recruit by 1 per segment.*
> - Stakeholders: *Just me, with marketing as a downstream execution partner.*
>
> **When and where.**
> - Timeline: *2 weeks (recruiting Mon-Wed, fielding Thu-following-Tue, synthesis Wed-Thu).*
> - Tools: *User Interviews MCP for recruiting; Granola for transcription; Notion for synthesis.*
>
> **Next steps.**
> - Deliverables: *4-page brief, tagged transcripts, 2-3 product implications.*
> - Activation: *Walk findings through with the feature team Friday week 2; book follow-ups with any PWDR who surfaced a strong signal.*

The brief is portable — drop it into User Interviews MCP, Maze, Lyssna, or any recruiting workflow you use.

## Install

In Claude Code:

```
/plugin marketplace add user-interviews/research-skills
```

Then install whichever plugin(s) you want:

```
/plugin install research-planning@research-skills
```

## Available skills

### `research-planning`

Turn a research question into a structured research brief, drawing on User Interviews' published planning playbook. Apply UI's frameworks for decision-driven research, methodology selection, and AI-moderation fit.

Invoke with: `/plan-research "your research question"`

The brief is portable to any execution tool — Maze, Lyssna, UserTesting, an internal panel, or User Interviews MCP for direct project creation. See [`research-planning/README.md`](research-planning/README.md) for details.

## Roadmap

This is the first plugin in the repo. Future plugins may include:

- A research-brief-to-MCP handoff helper (currently the handoff is a paste-and-go conversation pattern)
- Synthesis / analysis skills paired with research planning
- Customer-facing screener authoring assistance

If you have an idea for a plugin that belongs here, open an issue or PR.

## Customization

Each plugin has its own `team-context/` directory for per-team customization. See the plugin's README and `team-context/README.md` for the schema.

The skills are designed to be forked. If your fork adds value that would help other teams, consider opening a PR upstream.

## License

MIT.

## Maintained by

[User Interviews](https://www.userinterviews.com) — the research platform that helps companies talk to customers.
