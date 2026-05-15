# research-skills

User Interviews' open collection of AI workflows for running good research, quickly and effectively. Each workflow is a focused thing you can do — plan a study, design a survey, synthesize transcripts — drawn from the same playbook our research ops team uses with hundreds of customers.

## The playbook

Three pieces of methodology IP carry across every workflow in this repo:

- **The canonical 6-field brief** — What / Why / How / Who / When and where / Next steps. The same structure UI's research team uses for every project. Portable to any execution tool.
- **The three-outcome decision discipline** — not every research request should produce a study. Sometimes the right move is desk research first; sometimes the request isn't a research problem at all. Workflows in this repo handle all three outcomes as first-class.
- **The methodology rubric** — three forcing axes (generative vs. evaluative, attitudinal vs. behavioral, qual vs. quant) plus six tiebreakers. Picks methods that actually answer the question, not methods that sound right.

Plus sample-size discipline (per-method floors, no-show buffers), an anti-pattern list (the failure modes we've watched customers run into for a decade), and pattern recognition for common method+context combinations.

## Workflows in this repo

### research-planning

Turn a fuzzy research question into a structured 6-field brief — or honestly redirect when research isn't the right move.

- **Surfaces:** Claude Code (plugin) · Claude.ai chat (skill)
- **Install in Claude Code:**
  ```
  /plugin marketplace add user-interviews/research-skills
  /plugin install research-planning
  ```
- **Install in Claude.ai:** Build the ZIP (`./scripts/build-skill-zip.sh` from repo root, or download from a release once published), then upload at Settings → Customize → Skills.
- **Best for:** anyone scoping a study — PMs, designers, customer-success, founders, or researchers. Especially useful when you're not sure what you should research, or when you want a defensible methodology stance built in.

[→ See `research-planning/skills/research-planning/SKILL.md` for the full workflow definition.](research-planning/skills/research-planning/SKILL.md)

## What's coming

This repo is being built workflow-by-workflow. Other research workflows are in design and prototyping; specifics will land here as they ship. The pattern stays the same: each new workflow gets its own top-level folder, install paths for the surfaces it ships on, and a card in this README.

## Repo structure

```
research-skills/
├── README.md                              # this file
├── .claude-plugin/marketplace.json        # registers all plugins
├── scripts/build-skill-zip.sh             # builds the chat-skill ZIP for upload
├── research-planning/                     # WORKFLOW — full plugin package
│   ├── .claude-plugin/plugin.json
│   ├── agents/                            # plugin-only (sub-agents)
│   ├── commands/                          # plugin-only (slash commands)
│   ├── evals/                             # workflow-level eval suite
│   └── skills/research-planning/          # the load-bearing skill (powers both surfaces)
│       ├── SKILL.md
│       ├── references/                    # methodology references
│       └── assets/                        # templates + version metadata
└── dist/                                  # build artifacts (git-ignored)
```

Adding a new workflow means creating a new top-level folder with the same shape. No reference duplication; one canonical location per workflow.

## Forking + customization

Each workflow's skill includes a `references/team-context.md` template at `research-planning/skills/research-planning/references/team-context.md`. Your team's preferences (voice, default methodology, custom personas, terminology swaps, custom handoff text) go there. Fork the repo, edit the template, rebuild the ZIP (or re-install the plugin), and the workflows pick up your team's overrides.

## Contributing

Internal for now. If you're at User Interviews and want to propose a new workflow for this repo, talk to Paolo. External contributions are not currently accepted; we'll revisit when the repo's contribution shape is clearer.

## License

MIT
