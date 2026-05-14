# research-skills

User Interviews' external Claude Code skills repository. Customer-facing, forkable skills + plugins for research planning and adjacent workflows.

This repo is the external surface — separate from internal repos and the User Interviews MCP. Skills here are designed to:

- **Stand alone** — work for anyone running research, with or without a User Interviews account
- **Be forkable** — clone the repo, layer your team's customizations on top, install your fork
- **Integrate optionally** — if you use User Interviews' MCP for project creation, the briefs these skills produce flow directly into project setup

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

See [`research-planning/README.md`](research-planning/README.md) for details.

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
