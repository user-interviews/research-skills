# research-skills

User Interviews' external Claude skills repository. Customer-facing, forkable skills + plugins for research planning and adjacent workflows.

This repo is the external surface — separate from internal repos and the User Interviews MCP. Skills here are designed to:

- **Stand alone** — work for anyone running research, with or without a User Interviews account
- **Be forkable** — clone the repo, layer your team's customizations on top, install your fork
- **Integrate optionally** — if you use User Interviews' MCP for project creation, the briefs these skills produce flow directly into project setup

## Two surfaces, one playbook

The repo hosts **two surfaces** for the same User Interviews planning playbook:

- **Claude Code plugin** at [`research-planning/`](research-planning/) — for users in the Claude Code CLI, IDE integration, or desktop app
- **Claude.ai skill** at [`skills/research-planning/`](skills/research-planning/) — for users in claude.ai chat (web or desktop)

Both surfaces shape the same canonical content into a structured research brief. Pick the surface that matches where you work — at the playbook level they're identical (same pre-flight gate, same methodology rubric, same 6-field brief, same anti-pattern check). The workflow shape is tuned for each surface, but the substance is the same.

## What you'll get

The skill takes a research question, topic, or fuzzy idea and turns it into a structured research brief using User Interviews' canonical 6-field template:

- **What** — the research question (sharpened)
- **Why** — the decision the research informs
- **How** — methodology, sample size, timeline
- **Who** — research subjects, stakeholders
- **When and where** — logistics
- **Next steps** — handoff

Behind the scenes it applies User Interviews' planning playbook: pre-flight gate, decision-driven framing, methodology selection rubric (including AI-moderation fit), anti-pattern check, and team-context overrides if you've configured them.

The brief is portable — usable with any recruiting tool, shareable with stakeholders, or pasteable into a Claude chat connected to the User Interviews MCP to hand off straight into project creation.

## Install — Claude Code plugin

In Claude Code:

```
/plugin marketplace add user-interviews/research-skills
```

Then install the plugin:

```
/plugin install research-planning@research-skills
```

Invoke with `/plan-research "your research question"` or by asking naturally ("help me plan research on X").

## Install — Claude.ai skill

The skill ships as a folder under [`skills/research-planning/`](skills/research-planning/) and uploads to claude.ai as a ZIP.

**1. Get the skill folder as a ZIP.** Two options:

- **Easiest (once releases are published):** download `research-planning.zip` from the [latest GitHub release](https://github.com/user-interviews/research-skills/releases).
- **Manual:** clone the repo and zip the skill folder yourself.

  ```bash
  git clone https://github.com/user-interviews/research-skills.git
  cd research-skills/skills
  zip -r research-planning.zip research-planning/
  ```

**2. Upload to Claude.ai.** Open Claude.ai → Settings → Customize (or wherever the Skills section currently lives in your plan's UI) → Skills → upload the ZIP. The exact menu label moves around; look for "Skills" or "Custom skills."

**3. Verify** the skill appears in your skills list named **research-planning**.

**4. Invoke** by typing `/research-planning` in any chat, or by asking naturally ("help me plan research on X" / "I need to scope a discovery study").

**Note on org-wide install:** the steps above install the skill for one user. **Team and Enterprise** admins can provision the same ZIP org-wide via *Organization settings → Skills*. **Free / Pro / Max** plans are per-user only.

## Customization

Each surface supports per-team overrides — voice, terminology, default methodologies, custom personas, custom handoff text.

- **Claude Code plugin:** edit [`research-planning/team-context/team-context.md`](research-planning/team-context/team-context.md), then re-install the plugin. See that file's header for the supported override schema.
- **Claude.ai skill:** edit [`skills/research-planning/references/team-context.md`](skills/research-planning/references/team-context.md). It ships as a template with commented-out examples — uncomment and edit. Re-zip the `research-planning/` folder and re-upload. The override is lazy-loaded by the skill, so absent or template-only files fall back to defaults.

**Forking.** If you want deeper customization than the team-context override allows, clone the repo and edit the canonical playbook content under `research-planning/references/` and `research-planning/templates/`. Then run the sync script (below) to propagate changes into the skill surface, and re-package whichever surface you use.

## Repo structure

```
user-interviews/research-skills/
├── .claude-plugin/
│   └── marketplace.json              # Claude Code marketplace registry
├── research-planning/                # Claude Code plugin (canonical content lives here)
│   ├── .claude-plugin/plugin.json
│   ├── agents/research-planner.md    # Plugin sub-agent prompt
│   ├── commands/plan-research.md     # /plan-research command
│   ├── references/                   # Playbook reference files (canonical)
│   ├── templates/                    # Brief template (canonical)
│   ├── team-context/                 # Per-team overrides
│   └── evals/                        # Plugin eval suite
├── skills/                           # Claude.ai skills
│   └── research-planning/
│       ├── SKILL.md                  # Chat-adapted system prompt
│       ├── references/               # Synced from research-planning/references/
│       ├── assets/                   # Brief template + VERSION (synced from templates/)
│       └── evals/                    # Chat-shaped eval scenarios
├── scripts/
│   └── sync-skill-content.sh         # Propagates canonical content into the skill
└── README.md                         # This file
```

The `research-planning/` plugin folder holds the **canonical playbook content**. The `skills/research-planning/` folder holds the chat-surface adaptation; its `references/` and `assets/` directories are populated by the sync script (below) from the plugin's `references/` and `templates/`. A few files in the skill folder (`SKILL.md`, `references/team-context.md`, `assets/VERSION.md`) are authored fresh for the chat surface and intentionally not synced.

## Keeping the two surfaces in sync

When canonical content under `research-planning/references/**` or `research-planning/templates/**` changes, run the sync script from the repo root:

```bash
./scripts/sync-skill-content.sh
```

It copies playbook references and the brief template into the skill folder, applying the `templates/ → assets/` path rewrite required by the claude.ai skill layout convention. The script is **idempotent** (running it twice in a row produces no diff) and **manually invoked** — there's no CI gate. Commit the resulting changes to `skills/research-planning/` alongside the canonical edits.

The script header lists exactly what is and isn't synced; see [`scripts/sync-skill-content.sh`](scripts/sync-skill-content.sh) for details.

## Updating after a new release

**Plugin updates** — in Claude Code:

```
/plugin marketplace update
/plugin update research-planning
```

**Skill updates** — re-download the ZIP from the [latest release](https://github.com/user-interviews/research-skills/releases) (or re-zip from a fresh clone), then re-upload to Claude.ai. There is **no auto-update** for uploaded skills on claude.ai today; updating is a manual re-upload. Each skill release self-reports its version in [`skills/research-planning/assets/VERSION.md`](skills/research-planning/assets/VERSION.md), and the skill can read that file on request if you ask it which version is running.

## Roadmap

This is the first plugin / skill pair in the repo. Future additions may include:

- A research-brief-to-MCP handoff helper (currently the handoff is a paste-and-go conversation pattern)
- Synthesis / analysis skills paired with research planning
- Customer-facing screener authoring assistance

If you have an idea that belongs here, open an issue or PR.

## License

MIT.

## Maintained by

[User Interviews](https://www.userinterviews.com) — the research platform that helps companies talk to customers.
