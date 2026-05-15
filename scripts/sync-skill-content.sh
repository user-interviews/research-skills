#!/usr/bin/env bash
# sync-skill-content.sh
#
# Copies canonical research content from the Claude Code plugin
# (research-planning/) into the Claude.ai skill (skills/research-planning/),
# applying the templates/ -> assets/ path rewrite required by the claude.ai
# skill layout convention (per agentskills.io).
#
# WHEN TO RUN
#   Run this manually whenever canonical content under
#   research-planning/references/** or research-planning/templates/** changes.
#   The script is idempotent — running it twice in a row produces no diff.
#
# WHAT IT DOES
#   Plugin source (canonical)              -> Skill destination
#   ─────────────────────────────────────────────────────────────
#   research-planning/references/*.md      -> skills/research-planning/references/*.md
#     (recursive, including patterns/methods/ and patterns/contexts/)
#   research-planning/templates/default-brief.md
#                                          -> skills/research-planning/assets/default-brief.md
#
#   Path references inside the synced content are rewritten:
#     templates/default-brief.md           -> assets/default-brief.md
#
# WHAT IS DELIBERATELY NOT SYNCED (chat-skill authors its own versions)
#   - skills/research-planning/SKILL.md
#       Authored fresh for the chat surface (4-phase workflow, operating
#       principles, plain-language voice). Plugin's agents/research-planner.md
#       is the analog; they intentionally diverge — see PAP-205 design memo.
#   - skills/research-planning/references/team-context.md
#       Authored as a template-with-commented-example by PAP-206. The plugin's
#       team-context/team-context.md has a different schema (README + populated
#       overrides) and is not a 1:1 mapping.
#   - skills/research-planning/assets/VERSION.md
#       Skill-specific self-report metadata (semver + last-synced date).
#   - research-planning/agents/*, research-planning/commands/*,
#     research-planning/.claude-plugin/*, research-planning/evals/* — plugin-only
#     artifacts with no claude.ai analog. Chat skill grows its own
#     skills/research-planning/evals/ in PAP-209.
#
# USAGE
#   From repo root:
#       ./scripts/sync-skill-content.sh
#
#   Exits 0 on success, non-zero on any failure.

set -euo pipefail

# Resolve repo root (assumes script lives in scripts/).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

PLUGIN_REFS="${REPO_ROOT}/research-planning/references"
PLUGIN_TPL="${REPO_ROOT}/research-planning/templates"
SKILL_REFS="${REPO_ROOT}/skills/research-planning/references"
SKILL_ASSETS="${REPO_ROOT}/skills/research-planning/assets"

# Sanity check: required source paths exist.
if [ ! -d "${PLUGIN_REFS}" ]; then
  echo "ERROR: plugin references directory not found at ${PLUGIN_REFS}" >&2
  echo "       Run this script from the user-interviews/research-skills repo root." >&2
  exit 1
fi
if [ ! -f "${PLUGIN_TPL}/default-brief.md" ]; then
  echo "ERROR: canonical brief template not found at ${PLUGIN_TPL}/default-brief.md" >&2
  exit 1
fi

# Ensure destination directories exist.
mkdir -p "${SKILL_REFS}"
mkdir -p "${SKILL_REFS}/patterns/methods"
mkdir -p "${SKILL_REFS}/patterns/contexts"
mkdir -p "${SKILL_ASSETS}"

# Track counts for the final summary.
copied=0
skipped=0
rewrote=0

# rewrite_paths_in_place applies the templates/ -> assets/ rewrite on a single
# file in the destination tree. Use sed -i with portable two-arg syntax (works
# on BSD sed / macOS without GNU extensions).
rewrite_paths_in_place() {
  local file="$1"
  # Backup-less in-place edit, portable across BSD/GNU sed.
  if grep -q 'templates/default-brief\.md' "${file}" 2>/dev/null; then
    # Two-arg form: empty backup suffix on BSD, ignored on GNU.
    sed -i.bak 's|templates/default-brief\.md|assets/default-brief.md|g' "${file}"
    rm -f "${file}.bak"
    rewrote=$((rewrote + 1))
  fi
}

# sync_one copies a single source file to a single destination file. Always
# overwrites (idempotent). After copy, applies the templates/ -> assets/ rewrite.
sync_one() {
  local src="$1"
  local dst="$2"
  local label="$3"

  if [ ! -f "${src}" ]; then
    echo "SKIP (not found in source): ${label}"
    skipped=$((skipped + 1))
    return 0
  fi

  mkdir -p "$(dirname "${dst}")"
  cp "${src}" "${dst}"
  rewrite_paths_in_place "${dst}"
  echo "COPY: ${src#${REPO_ROOT}/}  ->  ${dst#${REPO_ROOT}/}"
  copied=$((copied + 1))
}

echo "Syncing canonical research content from research-planning/ -> skills/research-planning/"
echo "Repo root: ${REPO_ROOT}"
echo

# --- references/ top-level ----------------------------------------------------
# Sync every .md file at the top of research-planning/references/, EXCLUDING
# nothing at this level (team-context.md does not live here — the plugin
# stores it under research-planning/team-context/team-context.md, which we
# intentionally never sync).
while IFS= read -r src; do
  base="$(basename "${src}")"
  sync_one "${src}" "${SKILL_REFS}/${base}" "references/${base}"
done < <(find "${PLUGIN_REFS}" -maxdepth 1 -type f -name '*.md' | sort)

# --- references/patterns/methods/ ---------------------------------------------
if [ -d "${PLUGIN_REFS}/patterns/methods" ]; then
  while IFS= read -r src; do
    base="$(basename "${src}")"
    sync_one "${src}" "${SKILL_REFS}/patterns/methods/${base}" "references/patterns/methods/${base}"
  done < <(find "${PLUGIN_REFS}/patterns/methods" -maxdepth 1 -type f -name '*.md' | sort)
fi

# --- references/patterns/contexts/ --------------------------------------------
if [ -d "${PLUGIN_REFS}/patterns/contexts" ]; then
  while IFS= read -r src; do
    base="$(basename "${src}")"
    sync_one "${src}" "${SKILL_REFS}/patterns/contexts/${base}" "references/patterns/contexts/${base}"
  done < <(find "${PLUGIN_REFS}/patterns/contexts" -maxdepth 1 -type f -name '*.md' | sort)
fi

# --- templates/default-brief.md -> assets/default-brief.md --------------------
# Renamed on the way in (templates/ is plugin convention; assets/ is the
# claude.ai skill convention per agentskills.io).
sync_one \
  "${PLUGIN_TPL}/default-brief.md" \
  "${SKILL_ASSETS}/default-brief.md" \
  "assets/default-brief.md (renamed from templates/default-brief.md)"

echo
echo "Done. Copied ${copied} file(s); rewrote path refs in ${rewrote} file(s); skipped ${skipped}."
echo "Note: skills/research-planning/SKILL.md, references/team-context.md, and"
echo "      assets/VERSION.md are deliberately not touched (authored fresh for chat)."
