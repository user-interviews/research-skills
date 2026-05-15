# research-planning skill — version

**Version:** 0.7.0
**Released:** 2026-05-15
**Source:** https://github.com/user-interviews/research-skills/tree/main/research-planning/skills/research-planning

This release jumps directly from 0.1.0 (initial skill ship) to 0.6.0 to match the
companion Claude Code plugin, then continues with the plugin through 0.6.1 (skill
bundling) and 0.7.0 (repo restructure — workflow-as-unit layout, single canonical
content location). v0.6.0 was the Pattern B convergence: the same SKILL.md powers
both the Claude Code plugin and this Claude.ai skill, with a runtime branch that
adapts to surface-specific affordances (sub-agent invocation on Claude Code;
inline drafting in main thread on Claude.ai). v0.7.0 collapses the prior cross-
location content duplication into a single canonical location at
`research-planning/skills/research-planning/`, which is what the chat-skill ZIP
is built from.

## How to update

There is no auto-update on claude.ai. To install a newer version:

1. Visit the source URL above.
2. Download or clone the latest `research-planning/skills/research-planning/` directory.
3. Re-zip the directory (the `research-planning/` folder must be the ZIP root, not nested). The repo's `scripts/build-skill-zip.sh` produces this ZIP automatically.
4. In Claude.ai: **Customize → Skills**, remove the existing `research-planning` skill, then click **+ Create skill → Upload a skill** and submit the new ZIP.

If the skill was provisioned to your organization by an owner, you'll see the new version automatically once the owner re-uploads the ZIP via **Organization settings → Skills**.

## Companion plugin

This skill is the Claude.ai surface for User Interviews' research-planning workflow. The Claude Code plugin lives in the same repo under `research-planning/` and bundles this exact skill at `research-planning/skills/research-planning/`. Both surfaces share the same playbook content (pre-flight gate, methodology rubric, anti-patterns, patterns, brief template) directly from the single canonical location — no cross-location sync needed.
