# Workspace Scanning

## Purpose

Guidance for reading the user's local workspace during Phase 2 (Research). The plugin runs in Claude Code, in a project with files — using that workspace is the move that makes the plugin distinct from a chat-only research skill. This file tells the agent *what* to look for, *where*, *how much*, and *when to stop*.

## When to apply

Load this when starting Phase 2 Stream 1 (Local workspace scan). The Phase 1 broad opener has produced a working model — learning goal, prior-knowledge surface, open questions, tentative foundational fields. Stream 1 turns that working model into a short list of files to read, then reads them, then surfaces what it found back to the user.

---

## Keyword strategies

Extract scan terms from the Phase 1 surface, not from a fixed taxonomy. Weight project- and topic-specific keywords over generic research vocabulary.

**Weight up:**

- Project names the user actually said ("PCA," "skill-sharing rollout," "the v2 onboarding redesign").
- Audience nouns the user used ("research ops leads," "non-renewing customers," "engineers on platform teams").
- Domain language unique to the user's situation ("incentive policy," "panel sourcing," "tier-1 enterprise").

**Weight down (or skip):**

- Generic terms — "research," "users," "interview," "study." They match too much and rank low-signal files high.
- Stopwords and method names alone — "survey," "usability." Combine with a topic noun, or skip.

**Practical pattern.** Build 3–5 keyword queries from the Phase 1 surface. Example: if the user said *"I want to figure out whether the skill-sharing pilot is working with our power users,"* the queries are: `skill-sharing`, `power users`, `pilot`, and `skill share`. Not `research`, not `users`.

If the Phase 1 surface is thin (user said "I don't know much yet"), ask the user for a pointer rather than guessing: *"Anywhere I should look first — a folder, project notes, prior research?"*

---

## File-pattern hints

A Claude Code workspace's structure varies. These are hints — places that often hold relevant context — not requirements. If the directories don't exist, skip them silently.

- **`Knowledge/`** — project notes, research, context. Often the highest-signal location for prior work on the topic.
- **`Tasks/`** or **`tasks/`** — task files with goal context, decisions, and follow-ups.
- **`Knowledge/CRM/Meetings/`** — meeting transcripts if a capture pipeline exists. Recent transcripts often reveal what's already been discussed about the topic.
- **`Knowledge/projects/<project-slug>/`** — project-specific research, specs, decision memos.
- **Prior briefs** — `*brief*.md`, `*plan*.md`, `*research-plan*.md`, `*research-brief*.md` anywhere in the workspace.
- **`BACKLOG.md`, `GOALS.md`, `README.md`** at the workspace root — useful for orientation, low priority for direct scan.

Glob+Grep combination: glob for filenames, grep for keyword hits inside files. The user-pointed read ("Anywhere I should look first?") takes precedence over the glob — if the user names a folder, read there first and budget remaining cap against the glob.

---

## Stopping criteria

**Hard cap: 3 files, 5K characters total.** Once the cap is hit, stop and summarize.

The cap is conservative on purpose. Better to read two high-signal files in full than to skim five mediocre ones. If a candidate file is large, prefer reading the first 1.5–2K chars and stopping rather than burning the whole budget on one document.

**Soft signals to stop earlier:**

- The first two files cover the same ground — the third is unlikely to add new information. Stop and surface.
- A file's first paragraph is clearly off-topic despite a keyword hit. Skip it, don't burn budget reading further.
- The scan has produced enough to either trigger an exit or fill the gaps Phase 1 left. Stop.

**Negative result is a valid output.** If the scan finds nothing relevant, report the negative ("Looked for files matching X, Y, Z — nothing relevant in your workspace") and fall back to interview-only mode for the rest of Phase 2. Do not flag the absence as a problem; many workspaces don't have prior research on the topic and that's fine.

---

## Conflict handling

When the scan finds two files that contradict each other — two memos with different conclusions about the same audience, a recent transcript that contradicts an older planning doc, a brief that says "we decided X" alongside a meeting note that says "we're still debating X" — **surface the conflict to the user. Do not silently resolve it.**

The rule:

- **Quote both excerpts** (short — one or two sentences each) with the file each came from.
- **Ask which to weight.** *"The Q3 planning doc says the audience is research ops leads; the recent team note from last week says we've narrowed to enterprise research ops only. Which is current?"*
- **Let the user resolve.** Their answer goes into the working model; the un-chosen interpretation is discarded for this brief (not silently averaged in).

Do NOT:

- Silently average ("the audience is research ops leads, possibly with an enterprise lean").
- Apply a recency heuristic ("the newer file wins"). Recency is sometimes wrong — the newer file might be a draft, the older file might be the authoritative version.
- Apply a source heuristic ("the formal brief beats the meeting note"). Same problem — sometimes the meeting note captures a decision the brief hasn't been updated to reflect.

The user knows their workspace's truth-state better than the agent does. The conflict surface is a one-turn cost; silent resolution can produce a brief built on the wrong frame.

---

## Narration style

The workspace scan is **narrated, not silent.** This matches Operating Principle #4 (present research back before drafting). The user has the right to know what was read, what was found, and what's about to be drafted from it.

**Before scanning:** announce intent in plain language.

> *"Let me check your workspace for files matching skill-sharing, power users, and pilot — sound good?"*

If the user has not pointed at a folder, ask first:

> *"Anywhere I should look first — a folder, project notes, prior research?"*

**After scanning:** surface what was found before reading further.

> *"Found three relevant files: a planning doc from Q3, last week's team sync transcript, and an older pilot retro. The planning doc and transcript look highest-signal — let me skim those."*

**After reading:** surface what was learned before drafting.

> *"Quick read: the Q3 planning doc lays out the original pilot scope; the team sync transcript shows you've already shifted to a tighter focus on enterprise customers. That second framing is what I'll work from — push back if I'm reading it wrong."*

The agent's voice here is a researcher thinking out loud while doing the work — not a system narrating its internal state. Never say "running Stream 1," "executing the workspace scan," or "Phase 2." The user doesn't need to know the architecture.

The internal pattern dataset stream (`references/patterns/`) stays silent — that's the agent's own knowledge, not the user's workspace. Narration is specific to the workspace scan because the workspace belongs to the user.

---

## What NOT to do

Anti-patterns the design defends against, called out explicitly so the agent doesn't drift into them:

- **Runaway slurp.** Reading every match the glob produces. The 3-file / 5K-char cap is the defense; respect it. If a glob returns 20 files, narrow by filename signal before reading any of them.
- **Silent reading.** Reading files without telling the user what's being read or what was found. Erodes trust and prevents the user from correcting a wrong frame before the brief is drafted.
- **Ignoring conflicts.** Finding two files that disagree and quietly picking one (or averaging them). Always surface; let the user resolve.
- **Treating sparse content as comprehensive.** Reading two short files and treating the workspace as fully scanned. If the cap wasn't hit and there are obvious unread candidates, name them: *"Found a planning doc and one transcript — there's also a folder of older meeting notes I didn't read. Want me to dig there, or is what I have enough?"*
- **Scanning before Phase 1's surface is in hand.** Without keywords from the user's own framing, the scan picks up generic matches that waste budget. Always run Phase 1's opener first.
- **Burying the negative.** If the scan found nothing, say so plainly. Don't paper over an empty result with phrases like "I've reviewed your workspace" when nothing was actually read.

---

## Output

The scan produces, in order:

1. A short list of file paths that were read (or a clear "nothing relevant found").
2. A one- or two-sentence synthesis of what each file contributed to the working model.
3. Any conflicts surfaced for the user to resolve.
4. An updated working model that incorporates the scan's findings, ready for Phase 2's remaining streams.

This synthesis is conversational, not a structured report. It feeds into the broader Phase 2 "present research back" moment alongside any web search results and pattern dataset hits.
