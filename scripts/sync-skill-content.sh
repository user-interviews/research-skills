#!/usr/bin/env bash
# sync-skill-content.sh
#
# Copies canonical research content from the Claude Code plugin
# (research-planning/) into the Claude.ai skill (skills/research-planning/).
#
# WHEN TO RUN
#   After editing canonical content under research-planning/references/ or
#   research-planning/templates/. The plugin is the source of truth; the skill
#   mirrors it (modulo the templates/ -> assets/ path rewrite that the
#   claude.ai skill spec uses).
#
# WHAT IT DOES
#   - Copies research-planning/references/*  -> skills/research-planning/references/*
#     (including the patterns/ subtree, 1:1)
#   - Copies research-planning/templates/*   -> skills/research-planning/assets/*
#     (path rewrite: templates/ -> assets/, per agentskills.io spec)
#   - Idempotent: re-running produces identical state. Stale files in the
#     destination subtrees are removed before each sync.
#
# WHAT IT DELIBERATELY DOES NOT SYNC
#   - research-planning/agents/                  (plugin-only artifact)
#   - research-planning/commands/                (plugin-only artifact)
#   - research-planning/.claude-plugin/          (plugin manifest)
#   - research-planning/team-context/            (plugin team-context shape;
#                                                 the skill has its own
#                                                 references/team-context.md
#                                                 authored fresh)
#   - skills/research-planning/SKILL.md          (skill entry point; authored
#                                                 fresh, not derived)
#   - skills/research-planning/references/team-context.md
#                                                (skill-side template; authored
#                                                 fresh, not derived from plugin)
#   - skills/research-planning/assets/VERSION.md (skill-specific self-report)
#   - skills/research-planning/evals/            (skill-specific scenarios)
#
# HOW TO REVERSE
#   Delete the synced trees and re-run (or leave them deleted):
#     rm -rf skills/research-planning/references
#     rm -rf skills/research-planning/assets
#     bash scripts/sync-skill-content.sh
#
# EXIT CODES
#   0  success
#   1  source directory missing or unreadable
#   2  required tool missing
#
# Runs from the repo root, or from anywhere via `bash scripts/sync-skill-content.sh`.

set -eu

# Resolve repo root from this script's own location so the script works from
# any CWD. POSIX-portable: use `cd -P` to canonicalize.
SCRIPT_DIR="$(cd -P "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd -P "$SCRIPT_DIR/.." && pwd)"

SRC_PLUGIN="$REPO_ROOT/research-planning"
DST_SKILL="$REPO_ROOT/skills/research-planning"

SRC_REFS="$SRC_PLUGIN/references"
SRC_TPL="$SRC_PLUGIN/templates"
DST_REFS="$DST_SKILL/references"
DST_ASSETS="$DST_SKILL/assets"

# Skill-side files authored fresh (not derived from plugin). The script
# preserves these when wiping/repopulating the destination trees.
PRESERVE_REFS="team-context.md"
PRESERVE_ASSETS="VERSION.md"

err() { printf "error: %s\n" "$*" >&2; }

# --- Pre-flight checks --------------------------------------------------------

if [ ! -d "$SRC_REFS" ]; then
  err "missing source directory: $SRC_REFS"
  exit 1
fi
if [ ! -d "$SRC_TPL" ]; then
  err "missing source directory: $SRC_TPL"
  exit 1
fi
if ! command -v find >/dev/null 2>&1; then
  err "required tool not found: find"
  exit 2
fi

mkdir -p "$DST_REFS" "$DST_ASSETS"

# --- Step 1: wipe destination subtrees, preserving skill-authored files -------
# Use find -mindepth 1 so the destination directories themselves stay.
# Preserve specific skill-authored files at the top level by name.

# References: keep team-context.md (and any future skill-authored file listed
# in PRESERVE_REFS). Delete everything else, including the patterns/ subtree.
find "$DST_REFS" -mindepth 1 \( -name "$PRESERVE_REFS" \) -prune -o -mindepth 1 -exec rm -rf {} + 2>/dev/null || true

# Assets: keep VERSION.md. Delete everything else.
find "$DST_ASSETS" -mindepth 1 \( -name "$PRESERVE_ASSETS" \) -prune -o -mindepth 1 -exec rm -rf {} + 2>/dev/null || true

# --- Step 2: sync references/ (including patterns/ subtree, 1:1) --------------

REF_COUNT=0
# Walk the source references tree, copying every .md file. Skip .gitkeep.
# Use NUL-delimited find output for path safety.
while IFS= read -r -d '' src; do
  rel="${src#"$SRC_REFS"/}"
  case "$rel" in
    .gitkeep|*/.gitkeep) continue ;;
  esac
  dst="$DST_REFS/$rel"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
  printf "  ref: %s\n" "$rel"
  REF_COUNT=$((REF_COUNT + 1))
done < <(find "$SRC_REFS" -type f -name "*.md" -print0)

# --- Step 3: sync templates/ -> assets/ (path rewrite) ------------------------

ASSET_COUNT=0
while IFS= read -r -d '' src; do
  rel="${src#"$SRC_TPL"/}"
  case "$rel" in
    .gitkeep|*/.gitkeep) continue ;;
  esac
  dst="$DST_ASSETS/$rel"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
  printf "  asset: %s (from templates/%s)\n" "$rel" "$rel"
  ASSET_COUNT=$((ASSET_COUNT + 1))
done < <(find "$SRC_TPL" -type f -name "*.md" -print0)

# --- Summary ------------------------------------------------------------------

printf "Synced %d references, %d assets\n" "$REF_COUNT" "$ASSET_COUNT"
