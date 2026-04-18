# Monorepo Structure

This document shows the file tree structure of the JustineDevs Skills Collection monorepo.

```
collection/
├── blueprintkit/                      # BlueprintKit skill directory
│   ├── SKILL.md                       # Root skill definition (for skills.sh)
│   ├── README.md                      # Skill-specific documentation
│   ├── .claude/                       # Claude skills directory
│   │   └── skills/
│   │       └── blueprintkit/
│   │           ├── SKILL.md           # Main skill definition
│   │           ├── LICENSE.txt
│   │           ├── planning/          # 14 planning sections
│   │           │   ├── 0-Master-Index.md
│   │           │   ├── 1-Executive-Summary.md
│   │           │   ├── 2-Objectives-Success-Metrics.md
│   │           │   ├── 3-Scope-Definition.md
│   │           │   ├── 4-System-Architecture-Design.md
│   │           │   ├── 5-Technical-Execution-Workflow.md
│   │           │   ├── 6-Project-Phases-Timeline.md
│   │           │   ├── 7-Resource-Planning.md
│   │           │   ├── 8-Risk-Management.md
│   │           │   ├── 9-Execution-Strategy.md
│   │           │   ├── 10-Monitoring-Reporting.md
│   │           │   ├── 11-ROI-Value-Realization.md
│   │           │   ├── 12-Governance-Decision-Making.md
│   │           │   ├── 13-Lessons-Learned-Continuous-Improvement.md
│   │           │   ├── SKILL-INTERNAL.md
│   │           │   ├── references/
│   │           │   └── scripts/
│   │           ├── tech-stack-selector/        # Skill 1
│   │           ├── architecture-decisions/     # Skill 2
│   │           ├── code-standards-enforcer/    # Skill 3
│   │           ├── ci-cd-pipeline-builder/    # Skill 4
│   │           ├── agile-executor/            # Skill 5
│   │           ├── project-risk-identifier/   # Skill 6
│   │           ├── automation-orchestrator/    # Skill 7
│   │           ├── webapp-testing/            # Skill 8
│   │           └── web-artifacts-builder/     # Skill 9
│   └── .claude-plugin/                # Claude Code plugin
│       ├── plugin.mdc
│       ├── marketplace.json
│       └── README.md
├── erc8004-agent-creator/              # ERC-8004 / 8004 agent scaffold skill
│   ├── SKILL.md                        # Skill definition (create-8004-agent wrapper)
│   ├── .claude-plugin/
│   │   └── marketplace.json            # Claude marketplace listing
│   ├── scripts/
│   │   └── patch_anthropic.py           # Patch generated project to use Claude (Python)
│   ├── references/
│   │   └── wizard-options.md           # Wizard order and chain/feature reference
│   └── assets/
│       └── agent-anthropic.ts           # Anthropic agent template
├── core-engineering/                    # Core Engineering / OOP & SOLID skill
│   ├── SKILL.md                         # OOP, SOLID, clean code, relationship types + examples
│   └── .claude-plugin/
│       └── marketplace.json             # Claude marketplace listing
├── context-engineering/                 # Context Engineering / prompt structure skill
│   ├── SKILL.md                         # Skeleton-of-Thought, diffs, XML tags, symbolic rules, constraints
│   └── .claude-plugin/
│       └── marketplace.json             # Claude marketplace listing
├── co-star-ui/                          # CO STAR UI Creator skill
│   ├── SKILL.md                         # Decision logic (UI build vs prompt creator), flow, pre-actions
│   ├── references/
│   │   ├── co-star-prompt.md            # Modern React UI (registries, shadcn, Magic UI, etc.)
│   │   └── co-star-creator.md           # Newsprint UI Creator (design system integration)
│   └── .claude-plugin/
│       └── marketplace.json             # Claude marketplace listing
├── agent-hub/                           # Orchestration knowledge hub (docs + skill entry)
│   ├── README.md
│   ├── COMMANDS.md                      # Paste-into-chat: AI wires .cursor/commands launchers
│   ├── SKILL.md                         # Canonical machine-readable orchestration entry
│   ├── architecture/                    # 00-scope … 10-observability (layered canon)
│   ├── indexes/                         # command-index, service-index, orchestration-map, glossary
│   ├── diagrams/                        # Text / Mermaid flow docs
│   ├── templates/                       # Inspection and sequence scaffolds
│   ├── commands/                        # Project-native command specs
│   ├── agent/                           # Operating model and editing rules for agents
│   └── .claude-plugin/                  # Plugin metadata for compatible hosts
├── startup/                             # Curated startup operating system bundle
│   ├── SKILL.md                         # Root skill definition (for skills.sh)
│   ├── README.md                        # Skill-specific documentation
│   ├── skills/
│   │   └── startup/
│   │           ├── SKILL.md             # Bundle entrypoint and module routing guide
│   │           ├── LICENSE.txt
│   │           ├── startup-manager/
│   │           │   └── SKILL.md
│   │           ├── founder-foundation/
│   │           │   └── SKILL.md
│   │           ├── value-validation/
│   │           │   └── SKILL.md
│   │           ├── mvp-engine/
│   │           │   └── SKILL.md
│   │           ├── fundraising-kit/
│   │           │   └── SKILL.md
│   │           ├── gtm-launch/
│   │           │   └── SKILL.md
│   │           ├── growth-engine/
│   │           │   └── SKILL.md
│   │           └── founder-ops/
│   │               └── SKILL.md
│   └── .claude-plugin/
│       └── marketplace.json             # Claude marketplace listing
│       └── marketplace.json             # Claude marketplace listing
│       └── marketplace.json             # Claude marketplace listing
│       └── marketplace.json             # Claude marketplace listing
│       └── marketplace.json             # Claude marketplace listing
│       └── marketplace.json             # Claude marketplace listing
│       └── marketplace.json             # Claude marketplace listing
│       └── marketplace.json             # Claude marketplace listing
├── LICENSE                             # Collection license (MIT)
├── README.md                           # Collection overview
├── CONTRIBUTING.md                     # How to add skills and maintain agent-hub
└── STRUCTURE.md                        # This file

# Future Skills Structure
# When adding new skills, follow this pattern:
#
# collection/
# ├── blueprintkit/
# ├── playbook/                         # New skill example
# │   ├── SKILL.md
# │   ├── README.md
# │   └── .claude/
# │       └── skills/
# │           └── playbook/
# └── other-skill/                       # Another skill example
#     ├── SKILL.md
#     ├── README.md
#     └── .claude/
#         └── skills/
#             └── other-skill/
```

## Installation Paths

When users install skills, they use:
- `npx skills add justinedevs/collection/blueprintkit` → Downloads only `blueprintkit/` directory
- `npx skills add justinedevs/collection/playbook` → Downloads only `playbook/` directory (when added)
- `npx skills add justinedevs/collection/startup` → Downloads only `startup/` directory

## Key Points

1. **Each skill is self-contained** in its own directory
2. **Root level** contains collection overview (README.md) and shared resources (LICENSE)
3. **Skill directories** contain SKILL.md, README.md, and all skill-specific content
4. **Selective installation** - users only download the skill directory they need
5. **Easy to extend** - just add new skill directories following the same pattern
