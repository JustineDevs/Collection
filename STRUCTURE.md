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
├── LICENSE                             # Collection license (MIT)
├── README.md                           # Collection overview
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

## Key Points

1. **Each skill is self-contained** in its own directory
2. **Root level** contains collection overview (README.md) and shared resources (LICENSE)
3. **Skill directories** contain SKILL.md, README.md, and all skill-specific content
4. **Selective installation** - users only download the skill directory they need
5. **Easy to extend** - just add new skill directories following the same pattern

