---
description: Activates the research-planning skill — turns a fuzzy research question into a structured research brief using User Interviews' planning playbook.
argument-hint: "<research question or topic>"
---

# /plan-research

Slash-command entry point for the `research-planning` skill. Activating this command starts a conversational planning workflow that turns a fuzzy research question (or just a topic) into a structured 6-field research brief — using User Interviews' planning playbook.

## What activating this does

Loads the `research-planning` skill into your conversation. The skill conducts a multi-turn Interview to understand your goal, prior knowledge, and open questions; reads relevant files from your workspace incrementally as the conversation surfaces topics; checks what research tools you have available; then either drafts a 6-field brief, recommends you do desk research first, or redirects to a non-research alternative when research isn't the right fit.

## Usage

```
/plan-research "How do enterprise teams choose CI/CD tools?"
/plan-research                    # Empty — skill opens with the broad opener anyway
```

## Three possible outcomes

The skill treats three outcomes as first-class:

1. **Here's your brief.** Default. Research is the right move; you get a 6-field brief.
2. **Do more digging first.** When your audience is hard to reach AND the topic is well-covered publicly. The skill recommends a concrete 2-hour desk path and offers to come back for a focused brief on the irreducible gap.
3. **Research isn't the right fit.** When the work is actually a decision memo, stakeholder alignment, or selective evidence-gathering. The skill names what would actually help.

## Customization

If `team-context/team-context.md` exists in your fork of this plugin, the skill reads it and applies per-team overrides (voice, terminology, custom personas, default methodology, custom handoff text).

The skill also reads `.claude/research-planning.local.md` in your current project if present, surfacing your past tool choices as defaults. You can opt-in to write to that file at the end of any session.

## Behind the slash command

The skill is at `skills/research-planning/SKILL.md`. The brief-drafting sub-agent is at `agents/research-brief-writer.md`. The slash command is intentionally thin — workflow logic lives in the skill, not here.
