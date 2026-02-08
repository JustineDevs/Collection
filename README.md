# JustineDevs Skills Collection

A collection of AI agent skills for project development and execution.

## Available Skills

### @blueprintkit
Complete project planning and execution framework.

**Installation:**
```bash
npx skills add justinedevs/collection/blueprintkit
```

This skill provides comprehensive guidance across 14 planning sections plus 9 specialized execution capabilities, covering everything from initial vision through deployment and continuous improvement.

## Install Multiple Skills

You can install any combination of skills from this collection:

```bash
# Install only blueprintkit
npx skills add justinedevs/collection/blueprintkit

# Install multiple skills (example)
npx skills add justinedevs/collection/blueprintkit
npx skills add justinedevs/collection/playbook
```

Each skill is installed independently - you only download what you need.

## How Monorepo Installation Works

This repository uses a monorepo structure where multiple skills can coexist. When you install a skill:

- **Selective Download**: Only the specific skill directory is downloaded
- **Independent Installation**: Each skill can be installed/updated/removed separately
- **Shared Resources**: Skills can share common documentation or utilities at the collection level

**Example:**
```bash
# User only wants blueprintkit
npx skills add justinedevs/collection/blueprintkit
# → Only downloads blueprintkit/ directory

# User wants multiple skills
npx skills add justinedevs/collection/blueprintkit
npx skills add justinedevs/collection/playbook
# → Downloads only the selected skills
```

**Result URL:** `https://skills.sh/justinedevs/collection/blueprintkit`

## Repository Structure

This is a monorepo containing multiple skills. Each skill can be installed independently.

```
collection/
├── blueprintkit/                  # BlueprintKit skill
│   ├── SKILL.md                   # Skill definition
│   ├── README.md                  # Skill documentation
│   ├── .claude/
│   │   └── skills/
│   │       └── blueprintkit/
│   │           ├── SKILL.md
│   │           ├── planning/      # 14 planning sections
│   │           └── [9 skills]/   # Individual skill definitions
│   └── .claude-plugin/            # Claude Code plugin
│       ├── plugin.mdc
│       ├── marketplace.json
│       └── README.md
├── LICENSE                         # Collection license
└── README.md                       # Collection overview (this file)
```

**Note:** When users install `justinedevs/collection/blueprintkit`, only the `blueprintkit/` directory is downloaded.

## Adding New Skills

To add a new skill to this collection:

1. Create a new directory (e.g., `playbook/`)
2. Add `SKILL.md` with the skill definition
3. Add `README.md` with skill documentation
4. Add skill content in `.claude/skills/[skill-name]/` if needed
5. Update this README.md to list the new skill in "Available Skills"

## License

MIT License - See [LICENSE](./LICENSE) file for details.
