#!/usr/bin/env bash
# build-skill-zip.sh
#
# Builds a chat-skill ZIP from the canonical skill location for upload to
# Claude.ai (Settings -> Customize -> Skills -> Upload).
#
# Source:  research-planning/skills/research-planning/
# Output:  dist/research-planning.zip
#
# The ZIP excludes evals/ (development artifact; not skill-runtime content).
#
# USAGE
#   From repo root:
#       ./scripts/build-skill-zip.sh
#
#   Exits 0 on success, non-zero on any failure. Idempotent (overwrites prior ZIP).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

SKILL_SRC="${REPO_ROOT}/research-planning/skills/research-planning"
DIST_DIR="${REPO_ROOT}/dist"
OUTPUT_ZIP="${DIST_DIR}/research-planning.zip"

if [ ! -d "${SKILL_SRC}" ]; then
  echo "ERROR: skill source not found at ${SKILL_SRC}" >&2
  echo "       Run this script from the user-interviews/research-skills repo root." >&2
  exit 1
fi

if [ ! -f "${SKILL_SRC}/SKILL.md" ]; then
  echo "ERROR: SKILL.md missing from ${SKILL_SRC}" >&2
  exit 1
fi

mkdir -p "${DIST_DIR}"
rm -f "${OUTPUT_ZIP}"

# Zip with the research-planning/ folder as the ZIP root (Claude.ai requires this).
# Exclude evals/ (development artifact).
(cd "${SKILL_SRC}/.." && zip -r "${OUTPUT_ZIP}" research-planning -x '*/evals/*' '*.DS_Store' >/dev/null)

if [ ! -f "${OUTPUT_ZIP}" ]; then
  echo "ERROR: ZIP build failed; ${OUTPUT_ZIP} not created" >&2
  exit 1
fi

file_count=$(unzip -l "${OUTPUT_ZIP}" | awk 'END { print NR - 4 }')
size=$(ls -lh "${OUTPUT_ZIP}" | awk '{ print $5 }')

echo "Built: ${OUTPUT_ZIP#${REPO_ROOT}/}"
echo "  Files: ${file_count}"
echo "  Size:  ${size}"
echo "  Source: research-planning/skills/research-planning/ (excluding evals/)"
echo ""
echo "Upload at Claude.ai: Settings -> Customize -> Skills -> Upload a skill"
