# Git Commit Automation Guide

Automated commit script (bash only, no Node or other dependencies). Runs from the Git repo root so it works when invoked from `version/` or any subdirectory.

## Quick Start

### Using NPM Scripts (from repo root or from version/)

```bash
# Preview what will be committed (safe to run)
npm run commit:dry

# Commit each changed file with a generated message (repo-root aware)
npm run commit

# Limit concurrency
npm run commit:auto

# Single commit for all changes (from repo root)
npm run commit:all
```

### Direct Script Usage

```bash
# From version/ or repo root
bash scripts/parallel-commit.sh --dry-run
bash scripts/parallel-commit.sh
bash scripts/parallel-commit.sh --max 3
```

## What the Script Does

1. **Repo-root aware**: Finds the Git repo root (e.g. parent of `version/`) and runs all `git` commands there, so uncommitted changes at repo level are committed correctly from any subdir.
2. **Scan for changes**: Detects modified, added, and untracked paths from repo root.
3. **Generate commit messages**: One message per path (add / modify / delete / chore) with optional directory context.
4. **Batched processing**: Processes paths in configurable batches (default 5).
5. **No dependencies**: Pure bash; no Node.js or npm install required to run the script.
6. **Filtering**: Skips `node_modules/`, `.git/`, `*.log`, `.DS_Store`, etc.

## Commit Message Examples

The scripts generate intelligent commit messages:

- `feat: add README.md` - New file added
- `update: modify scripts/parallel-commit.js` - File modified
- `remove: delete old-file.txt` - File deleted
- `refactor: rename component.js in src/components` - File renamed with context

## Configuration

### Adjust Concurrency
```bash
# Limit to 3 concurrent commits
bash scripts/parallel-commit.sh --max 3
```

### Exclude paths
Edit the skip rules in `scripts/parallel-commit.sh` (lines with `[[ "$file" == *"node_modules"* ]]` etc.).

## Workflow Examples

### Daily Development
```bash
# 1. Make your changes
# 2. Preview what will be committed
npm run commit:dry

# 3. Commit all changes
npm run commit

# 4. Push to remote
git push
```

### Large Refactoring
```bash
# For many files, use limited concurrency
bash scripts/parallel-commit.sh --max 2

# Or commit everything at once
npm run commit:all
```

### Safe Testing
```bash
# Always test first with dry run
npm run commit:dry

# Then commit for real
npm run commit
```

## Troubleshooting

### Common Issues

1. **Script not found**: Run from repo root or from `version/` (e.g. `npm run commit` from `version/`).
2. **Permission denied**: Run `chmod +x scripts/parallel-commit.sh` (Unix).
3. **No dependencies**: The script is bash-only; no Node.js required.
4. **No changes**: Script reports when there are no uncommitted changes.

### Performance Tips

- Use `--max 3` for slower systems
- Use `npm run commit:all` for bulk changes
- Always run `--dry-run` first to preview

## Available Commands

| Command | Description |
|---------|-------------|
| `npm run commit` | Commit each change from repo root (bash script) |
| `npm run commit:dry` | Preview what would be committed |
| `npm run commit:sh` | Same as commit (bash script) |
| `npm run commit:sh:dry` | Same as commit:dry |
| `npm run commit:all` | Single commit for all changes |
| `npm run commit:auto` | Auto-commit with limited concurrency |
| `npm run status` | Show git status |
| `npm run changes` | Show changed files |
| `npm run staged` | Show staged files |

## Benefits

- **Speed**: Parallel processing commits multiple files simultaneously
- **Intelligence**: Automatic commit message generation
- **Safety**: Dry-run mode prevents accidental commits
- **Flexibility**: Multiple options for different use cases
- **Cross-platform**: Works on Windows, macOS, and Linux

For detailed documentation, see `scripts/README.md`.
