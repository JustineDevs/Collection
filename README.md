# JustineDevs Skills Collection

A collection of AI agent skills for project development and execution.

## Installation Collection

| Bash | Skills (URL) | Description |
|------|--------------|-------------|
| `npx skills add https://github.com/justinedevs/collection --skill blueprintkit` | [justinedevs/collection/blueprintkit](https://skills.sh/justinedevs/collection/blueprintkit) | Complete project planning and execution framework: 14 planning sections plus 9 specialized execution capabilities, from initial vision through deployment and continuous improvement. |
| `npx skills add https://github.com/justinedevs/collection --skill erc8004-agent-creator` | [justinedevs/collection/erc8004-agent-creator](https://skills.sh/justinedevs/collection/erc8004-agent-creator) | Usage and installation for [create-8004-agent](https://github.com/Eversmile12/create-8004-agent): how to create ERC-8004/8004 agents, wizard options, chains (EVM and Solana), and post-generation steps. Optional script to switch generated project to Anthropic Claude. |
| `npx skills add https://github.com/justinedevs/collection --skill core-engineering` | [justinedevs/collection/core-engineering](https://skills.sh/justinedevs/collection/core-engineering) | Core Engineering: OOP four pillars (Abstraction, Encapsulation, Inheritance, Polymorphism), SOLID, composition over inheritance, DRY/KISS/YAGNI/Law of Demeter, and association/aggregation/composition with example code. |
| `npx skills add https://github.com/justinedevs/collection --skill context-engineering` | [justinedevs/collection/context-engineering](https://skills.sh/justinedevs/collection/context-engineering) | Context Engineering: Skeleton-of-Thought, token-efficient diff updates, XML tagging, symbolic rule variables, and negative constraints, plus guidance on LLMBundle-style context packaging. |
| `npx skills add https://github.com/justinedevs/collection --skill co-star-ui` | [justinedevs/collection/co-star-ui](https://skills.sh/justinedevs/collection/co-star-ui) | CO STAR UI: structured CO-STAR prompting for building/integrating React UI (shadcn, Magic UI, Aceternity, Newsprint) or creating custom CO-STAR prompts; discovery first, then plan and implementation. |

Each skill is installed independently - you only download what you need.

## How Monorepo Installation Works

This repository uses a monorepo structure where multiple skills can coexist. When you install a skill:

- **Selective Download**: Only the specific skill directory is downloaded
- **Independent Installation**: Each skill can be installed/updated/removed separately
- **Shared Resources**: Skills can share common documentation or utilities at the collection level

**Example usage in your workspace (prompts):**

- **BlueprintKit:** After installing, ask your agent: *"Create a project plan using BlueprintKit: scope, timeline, and risk section"* or *"Run the tech-stack selector and suggest a stack for a real-time dashboard."*
- **erc8004-agent-creator:** After installing, ask: *"How do I create an ERC-8004 agent?"* or *"What options does the create-8004-agent wizard have?"* or *"How do I register my agent and start the A2A server?"* The skill explains installation (`npx create-8004-agent`), wizard options, chains, and usage after generation.
- **core-engineering:** After installing, ask: *"Explain SOLID with code examples"* or *"What is the difference between aggregation and composition?"* or *"Refactor this to follow Single Responsibility."* The skill provides OOP, SOLID, clean code, and relationship types with TypeScript snippets.
- **context-engineering:** After installing, ask: *"Show me a Skeleton-of-Thought skeleton for this file,"* or *"Give me SEARCH/REPLACE diffs only for this function,"* or *"Wrap my repo into XML tags and define reusable [RULE_*] blocks."* The skill guides you to structure prompts with SoT, diffs, XML, symbolic rules, and negative constraints (and optionally how to apply llmbundle output).
- **co-star-ui:** After installing, ask: *"Add a hero section using CO STAR"* or *"Help me integrate the Newsprint design system"* or *"I want to create my own CO-STAR prompt for our product."* The skill runs discovery questions first, then an integration plan and code (or guides you through creating a custom CO-STAR prompt).

**Result URL:** `https://skills.sh/justinedevs/collection/`

## Repository Structure

This is a monorepo containing multiple skills. Each skill can be installed independently. For the full file tree and directory layout, see [STRUCTURE.md](./STRUCTURE.md).

## Adding New Skills

To add a new skill to this collection:

1. Create a new directory (e.g., `playbook/`)
2. Add `SKILL.md` with the skill definition
3. Add `README.md` with skill documentation
4. Add skill content in `.claude/skills/[skill-name]/` if needed
5. Update this README.md: add a row to the Installation Collection table

## License

MIT License - See [LICENSE](./LICENSE) file for details.
