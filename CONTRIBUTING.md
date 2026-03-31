# Contributing to the JustineDevs Skills Collection

This file sits at the **collection root**. It is **not** copied when someone installs a single skill. Clone the **full repository** to follow governance, change multiple skills, or update shared docs.

This guide covers the **whole project**: published skills, collection-level documentation, optional maintainer tooling, and optional workspace assets. It does **not** prioritize one skill over the others.

**Related docs:** [README.md](./README.md), [STRUCTURE.md](./STRUCTURE.md), [LICENSE](./LICENSE). Skill-specific entry points live in each skill’s **README.md** and **SKILL.md**.

---

## What this repository is

- A **monorepo of installable skills** (Skills.sh-style: one folder per skill, selective download).
- **Collection root** files that describe the set and how to extend it.
- Optional **non-skill** folders used only in full checkouts (**`version/`**, sometimes **`external/`**, **`.cursor/`**).

---

## Project map (skills in this collection)

| Skill folder (target name) | What contributors usually change |
|----------------------------|----------------------------------|
| **blueprintkit/** | Planning templates under `.claude/skills/blueprintkit/`, bundled sub-skills, root **SKILL.md** pointer, **`.claude-plugin/`** if marketplace metadata changes. |
| **erc8004-agent-creator/** | **SKILL.md**, **references/** (wizard, chains), **scripts/** (e.g. Anthropic patch), **assets/**, **`.claude-plugin/`**. Keep aligned with upstream **create-8004-agent** where this skill documents it. |
| **core-engineering/** | **SKILL.md** body (OOP, SOLID, examples). Prefer small, reviewable edits; large rewrites need clear rationale. |
| **context-engineering/** | **SKILL.md** (SoT, diffs, XML, constraints). Same discipline as other single-file-heavy skills. |
| **co-star-ui/** | **SKILL.md**, **references/** (CO-STAR variants). Preserve “discovery first” flow described in the skill. |
| **agent-hub/** | **SKILL.md**, **README.md**, **architecture/**, **indexes/**, **diagrams/**, **templates/**, **agent/**, **commands/**, optional **`.claude-plugin/`**. Normative workflows live in **commands/**; optional Cursor launchers belong at **collection root** **`.cursor/commands/`**, not inside **agent-hub/**. Same rules as other skills: self-contained folder, relative links, update **STRUCTURE.md** when layout changes. |

Folder names on disk should match the **slug** in [README.md](./README.md) (lowercase, hyphens). If yours differ (for example `Core-Engineering/` vs `core-engineering`), fix casing when you can and update [STRUCTURE.md](./STRUCTURE.md) in the same change.

---

## Collection root (shared documentation)

When you change what the collection **is** or how it is **installed**:

| File | Update when |
|------|-------------|
| **README.md** | New skill, install command, or user-facing description of the set. |
| **STRUCTURE.md** | Any new skill folder or meaningful layout change. |
| **CONTRIBUTING.md** | Contribution process or project scope changes (this file). |
| **LICENSE** | Rare; legal/license changes only. |

Keep the **Installation Collection** table in **README.md** in sync with real folder names and skills.sh paths.

---

## Conventions for every skill

- **Self-contained:** A skill install must include everything needed under that directory. Do not require another skill’s files unless you say so in that skill’s **README.md**.
- **SKILL.md:** Required at skill root for packaging. Use YAML frontmatter (`name`, `description`, `license`) consistent with other skills in this repo. If the real content lives under `.claude/skills/...`, the root **SKILL.md** should point there clearly (see **blueprintkit**).
- **README.md:** Human-oriented: what it does, sample prompts, limits, and links **relative to the skill folder** so installs do not break.
- **Links:** Prefer relative paths inside a skill. For links to the collection root, use `../README.md` style only when the skill doc is explicitly for full-repo contributors.
- **Plugins:** **`.claude-plugin/marketplace.json`** should follow the same structure as sibling skills (**owner**, **metadata**, **plugins** array) and match the published skill name and description.
- **Tone and UI:** Match project rules: clear, professional wording; avoid unnecessary emoji in skill bodies where rules ask for it.

---

## Adding a new skill

1. Create a directory named like the slug you will publish (URL-friendly, usually `lowercase-with-hyphens`).
2. Add **SKILL.md** and **README.md** at the skill root.
3. Add **`.claude-plugin/`**, **`.claude/skills/...`**, **references/**, **scripts/**, **assets/**, only if needed.
4. Update **README.md** (installation table) and **STRUCTURE.md** (tree).
5. If the new skill affects how users pick between skills, say so in that skill’s **README.md** and update any **indexes** inside whichever skill owns the cross-skill routing doc (same idea as updating **references/** in **erc8004-agent-creator** or the planning index in **blueprintkit**).

---

## Changing an existing skill (checklist)

- [ ] **SKILL.md** and **README.md** still match behavior and install paths.
- [ ] No new dependency on another skill’s files without documenting it in **README.md**.
- [ ] Collection **README.md** installation table still accurate if the slug or description changed.
- [ ] **STRUCTURE.md** updated if folders or major files moved.
- [ ] **`.claude-plugin/`** updated if marketplace or capability metadata changed.

For skills with **large nested trees** (**blueprintkit**, **agent-hub**): use that skill’s **README.md** as the map; verify internal cross-links and indexes after moves.

For **erc8004-agent-creator**, verify **references/** and scripts still match the upstream tool you document.

---

## Workspace and tooling (full checkout only)

These are **not** skills.sh install units unless you explicitly document otherwise.

| Path | Role |
|------|------|
| **version/** | Maintainer npm scripts (for example parallel git helpers). See **version/package.json**. Do not put skill content here. |
| **external/** | Often **gitignored**. Optional local mirror of third-party source for study; **not** part of the published collection. |
| **.cursor/** (collection root) | Cursor rules, optional **commands/**, **llm/** docs, **skills/** (for example skill-creator). If tracked, keep **[.cursor/rules/AGENT.mdc](./.cursor/rules/AGENT.mdc)** consistent with paths documented in collection and skill **README** files. If **gitignored**, only local machines have these files. |

---

## License

Contributions are accepted under the same license as the collection. See [LICENSE](./LICENSE).
