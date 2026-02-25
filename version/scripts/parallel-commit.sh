#!/usr/bin/env bash
#
# Parallel Git Commit Script (no dependencies)
# Runs from Git repo root so it works when invoked from version/ or any subdir.
# Scans uncommitted changes and commits each file with a generated message.
#
# Usage: run from repo root or from version/ (e.g. npm run commit or bash scripts/parallel-commit.sh)

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BRIGHT='\033[1m'
NC='\033[0m'

MAX_CONCURRENT=5
DRY_RUN=false
COMMIT_PREFIX="feat"

# Resolve script dir and repo root (works from version/ or repo root)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-.}")" && pwd)"
# Git repo root: run from script dir so we find .git in parent if we're inside version/
if git -C "$SCRIPT_DIR" rev-parse --show-toplevel >/dev/null 2>&1; then
  REPO_ROOT="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"
else
  echo -e "${RED}Not in a Git repository.${NC}" >&2
  exit 1
fi

# All git commands run from repo root
cd "$REPO_ROOT"

print_color() {
  local color="$1"
  local msg="$2"
  echo -e "${color}${msg}${NC}"
}

show_help() {
  print_color "$CYAN" "Parallel Git Commit (repo-root aware)"
  print_color "$CYAN" "======================================="
  echo ""
  print_color "$CYAN" "Usage: $0 [options]"
  print_color "$CYAN" "Runs from Git repo root so safe to run from version/ or any subdir."
  echo ""
  print_color "$CYAN" "Options:"
  print_color "$CYAN" "  --dry-run       Show what would be committed (no writes)"
  print_color "$CYAN" "  --help, -h      This help"
  print_color "$CYAN" "  --max N         Max concurrent commits (default: $MAX_CONCURRENT)"
  echo ""
  print_color "$CYAN" "Examples:"
  print_color "$CYAN" "  $0"
  print_color "$CYAN" "  $0 --dry-run"
  print_color "$CYAN" "  $0 --max 3"
}

# One-line commit message for a path and status
get_commit_message() {
  local file="$1"
  local status="$2"
  file="${file%/}"
  local filename="${file##*/}"
  local dirname="${file%/*}"
  [[ "$dirname" == "$file" ]] && dirname="."
  dirname="${dirname##*/}"

  local msg=""
  case "$status" in
    *A*) msg="${COMMIT_PREFIX}: add ${filename}" ;;
    *M*) msg="update: modify ${filename}" ;;
    *D*) msg="remove: delete ${filename}" ;;
    *R*) msg="refactor: rename ${filename}" ;;
    *)   msg="chore: update ${filename}" ;;
  esac
  if [[ -n "$dirname" && "$dirname" != "." && ! "$dirname" =~ \. ]]; then
    msg="${msg} in ${dirname}"
  fi
  echo "$msg"
}

commit_one() {
  local file="$1"
  local status="$2"
  local msg
  msg="$(get_commit_message "$file" "$status")"

  if [[ "$DRY_RUN" == "true" ]]; then
    print_color "$YELLOW" "[DRY RUN] Would commit: \"$file\" -> \"$msg\""
    return 0
  fi

  if git add "$file" 2>/dev/null; then
    if git commit -m "$msg" 2>/dev/null; then
      print_color "$GREEN" "Committed: \"$file\""
      return 0
    fi
  fi
  print_color "$RED" "Failed: \"$file\""
  return 1
}

# Parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)   DRY_RUN=true; shift ;;
    -h|--help)   show_help; exit 0 ;;
    --max)       MAX_CONCURRENT="$2"; shift 2 ;;
    *)           print_color "$RED" "Unknown option: $1"; show_help; exit 1 ;;
  esac
done

print_color "$BRIGHT" "Parallel Git Commit"
print_color "$BRIGHT" "Repo root: $REPO_ROOT"
echo ""

if [[ "$DRY_RUN" == "true" ]]; then
  print_color "$YELLOW" "DRY RUN - no commits will be made"
fi

# Collect changed paths (from repo root)
changed=()
while IFS= read -r line; do
  [[ -z "$line" ]] && continue
  status="${line:0:2}"
  file="${line:3}"
  file="${file#\"}"
  file="${file%\"}"
  # Skip excludes
  [[ "$file" == *"node_modules"* ]] && continue
  [[ "$file" == *".git/"* ]] && continue
  [[ "$file" == *".log" ]] && continue
  [[ "$file" == *".tmp" ]] && continue
  [[ "$file" == *".DS_Store" ]] && continue
  [[ "$file" == *"Thumbs.db" ]] && continue
  changed+=("$file|$status")
done < <(git status --porcelain)

if [[ ${#changed[@]} -eq 0 ]]; then
  print_color "$GREEN" "No uncommitted changes."
  exit 0
fi

print_color "$BLUE" "Found ${#changed[@]} uncommitted item(s):"
for entry in "${changed[@]}"; do
  f="${entry%|*}"
  s="${entry#*|}"
  case "$s" in
    *A*) icon="add" ;;
    *M*) icon="mod" ;;
    *D*) icon="del" ;;
    *R*) icon="ren" ;;
    *)   icon="??" ;;
  esac
  print_color "$BLUE" "  [$icon] $f"
done
echo ""

# Process in batches (sequential within batch to avoid race on .git)
success=0
fail=0
batch=()
for entry in "${changed[@]}"; do
  batch+=("$entry")
  if [[ ${#batch[@]} -eq $MAX_CONCURRENT ]]; then
    for be in "${batch[@]}"; do
      f="${be%|*}"
      s="${be#*|}"
      if commit_one "$f" "$s"; then success=$((success+1)); else fail=$((fail+1)); fi
    done
    batch=()
  fi
done
for be in "${batch[@]}"; do
  f="${be%|*}"
  s="${be#*|}"
  if commit_one "$f" "$s"; then success=$((success+1)); else fail=$((fail+1)); fi
done

echo ""
print_color "$BRIGHT" "Summary:"
print_color "$BLUE" "  Total: ${#changed[@]}"
print_color "$GREEN" "  Committed: $success"
if [[ $fail -gt 0 ]]; then
  print_color "$RED" "  Failed: $fail"
fi
