# JustineDevs Skills Collection

A collection of AI agent skills for project development and execution across Codex, Claude, Composer, and similar agent runtimes.

## Installation Collection

| Install | Skills (URL) | Category | Codex | Purpose | Demo Prompt |
|------|--------------|----------|-------|---------|-------------|
| `npx skills add https://github.com/justinedevs/collection --skill blueprintkit` | [justinedevs/collection/blueprintkit](https://skills.sh/justinedevs/collection/blueprintkit) | Planning | Yes | Complete project planning and execution framework: 14 planning sections plus 9 specialized execution capabilities, from initial vision through deployment and continuous improvement. | `Create a project plan using BlueprintKit: scope, timeline, risk section, and recommended execution workflow.` |
| `npx skills add https://github.com/justinedevs/collection --skill erc8004-agent-creator` | [justinedevs/collection/erc8004-agent-creator](https://skills.sh/justinedevs/collection/erc8004-agent-creator) | Agents | Yes | Usage and installation for [create-8004-agent](https://github.com/Eversmile12/create-8004-agent): how to create ERC-8004/8004 agents, wizard options, chains (EVM and Solana), and post-generation steps. Optional script to switch generated project to Anthropic Claude. | `How do I create an ERC-8004 agent, what wizard options matter, and how do I register and run it after generation?` |
| `npx skills add https://github.com/justinedevs/collection --skill core-engineering` | [justinedevs/collection/core-engineering](https://skills.sh/justinedevs/collection/core-engineering) | Engineering | Yes | Core Engineering: OOP four pillars (Abstraction, Encapsulation, Inheritance, Polymorphism), SOLID, composition over inheritance, DRY/KISS/YAGNI/Law of Demeter, and association/aggregation/composition with example code. | `Explain SOLID with code examples, then refactor this class to follow Single Responsibility.` |
| `npx skills add https://github.com/justinedevs/collection --skill context-engineering` | [justinedevs/collection/context-engineering](https://skills.sh/justinedevs/collection/context-engineering) | Prompting | Yes | Context Engineering: Skeleton-of-Thought, token-efficient diff updates, XML tagging, symbolic rule variables, and negative constraints, plus guidance on LLMBundle-style context packaging. | `Show me a Skeleton-of-Thought outline for this repo and give me SEARCH/REPLACE diffs only for the changed function.` |
| `npx skills add https://github.com/justinedevs/collection --skill co-star-ui` | [justinedevs/collection/co-star-ui](https://skills.sh/justinedevs/collection/co-star-ui) | UI | Yes | CO STAR UI: structured CO-STAR prompting for building/integrating React UI (shadcn, Magic UI, Aceternity, Newsprint) or creating custom CO-STAR prompts; discovery first, then plan and implementation. | `Add a hero section using CO STAR and help me integrate the Newsprint design system into this React app.` |
| `npx skills add https://github.com/justinedevs/collection --skill agent-hub` | [justinedevs/collection/agent-hub](https://skills.sh/justinedevs/collection/agent-hub) | Orchestration | Yes | **agent-hub:** orchestration canon for the monorepo (architecture layers 00–10, indexes, diagrams, templates, command specs, agent operating rules). Machine entry: `agent-hub/SKILL.md`. | `Use agent-hub to decide the correct orchestration path, architecture layer, and command flow for this repo task.` |
| `npx skills add JustineDevs/collection/webmcp-agents` | [justinedevs/collection/webmcp-agents](https://skills.sh/justinedevs/collection/webmcp-agents) | Web & Agents | Yes | Unified WebMCP agent skill bundle with agent-browser-style discovery, execution, UI↔UX state verification, security, DESIGN.md workflows, evaluations, framework integration, and maintenance guidance. | `Use webmcp-agents to design or review a WebMCP tool and its complete user and agent journey.` |
| `npx skills add https://github.com/justinedevs/collection --skill startup` | [justinedevs/collection/startup](https://skills.sh/justinedevs/collection/startup) | Startup | Yes | Curated startup operating system bundle with startup-manager for request routing across founder thesis, validation, MVP scoping, fundraising, launch, growth, and founder ops. | `Pick the one practical startup module I should use for this request, then help me validate the idea or scope the next blocking step.` |

Each skill is installed independently - you only download what you need.

`Category` groups similar skills. `Codex = Yes` means the published package includes a runtime skill folder that can be installed into `~/.codex/skills/`.

## Codex

Codex can use these published skills too. After downloading or copying a skill package, place the runtime skill folder into `~/.codex/skills/<skill-name>/`.

Example for the `startup` bundle:

```bash
mkdir -p ~/.codex/skills/startup
cp -R startup/skills/startup/. ~/.codex/skills/startup/
```

The same idea applies to other agent runtimes: install the published package, then place the runtime-specific skill folder where that host discovers skills.

## How Monorepo Installation Works

This repository uses a monorepo structure where multiple skills can coexist. When you install a skill:

- **Selective Download**: Only the specific skill directory is downloaded
- **Independent Installation**: Each skill can be installed/updated/removed separately
- **Shared Resources**: Skills can share common documentation or utilities at the collection level

The Installation Collection table above includes a demo prompt for each skill so users can quickly understand the real use case and expected workflow.

**Result URL:** `https://skills.sh/justinedevs/collection/`

## Repository Structure

This is a monorepo containing multiple skills. Each skill can be installed independently. For the full file tree and directory layout, see [STRUCTURE.md](./STRUCTURE.md).

## Contributing

See **[CONTRIBUTING.md](./CONTRIBUTING.md)** for how to contribute to **any** skill, keep collection docs (**README**, **STRUCTURE**) accurate, and use optional workspace tooling (**version/**, **.cursor/**) in line with this repo.

## Adding New Skills

To add a new skill to this collection:

1. Create a new directory (e.g., `playbook/`)
2. Add `SKILL.md` with the skill definition
3. Add `README.md` with skill documentation
4. Add skill content in `.claude/skills/[skill-name]/` if needed
5. Update this README.md: add a row to the Installation Collection table
6. Update [STRUCTURE.md](./STRUCTURE.md) and follow [CONTRIBUTING.md](./CONTRIBUTING.md)

## License

MIT License - See [LICENSE](./LICENSE) file for details.
