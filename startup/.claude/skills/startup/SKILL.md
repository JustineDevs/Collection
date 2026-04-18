---
name: startup
description: Curated startup operating system for founders. Automatically includes startup-manager, founder-foundation, value-validation, mvp-engine, fundraising-kit, gtm-launch, growth-engine, and founder-ops. Use when the user needs end-to-end founder support across startup thesis, validation, MVP scoping, fundraising prep, launch planning, growth experiments, or founder operations as one bundled skill install. The startup-manager routes ambiguous or broad requests to the most practical module instead of forcing all modules at once.
license: MIT
---

# Startup

Curated founder operating system for validating, building, launching, funding, and operating an early-stage startup.

## Included Modules

When this skill is installed, all of these module folders are available under `.claude/skills/startup/`:

- `startup-manager/` - request triage, module routing, and practical handoff logic
- `founder-foundation/` - founder thesis, founder-market fit, role map, kill criteria
- `value-validation/` - evidence ledger, market validation, business-model comparison
- `mvp-engine/` - MVP promise, release slices, ship checks, post-launch read plan
- `fundraising-kit/` - proof inventory, investor narrative, diligence gaps
- `gtm-launch/` - launch brief, channels, metric tree, iterate-or-expand logic
- `growth-engine/` - funnel bottlenecks, growth experiments, scale decisions
- `founder-ops/` - equity, governance, compliance, legal review gates

## How To Use This Bundle

1. Start with `startup-manager` for broad, messy, or multi-stage startup requests.
2. Use `founder-foundation` when founder intent and role clarity are still weak.
3. Move to `value-validation` to pressure-test the market and business model.
4. Use `mvp-engine` once the riskiest assumptions are clear enough to build against.
5. Use `fundraising-kit` only when proof is strong enough to support investor claims.
6. Use `gtm-launch` and `growth-engine` for launch execution and repeatable growth.
7. Use `founder-ops` for legal, equity, governance, and compliance discipline.

## Routing Guidance

- Route all ambiguous, broad, or stage-mixed requests through `startup-manager` first.
- Use exactly one primary module by default. Add a secondary module only when the output clearly depends on it.
- Do not inject all startup modules into a response just because the bundle is installed.
- If the request spans multiple startup phases, choose the earliest blocking phase first and name the next module afterward.
- If the request is ambiguous, clarify the startup stage first, then use the nearest practical module.
- Preserve evidence labels: `evidenced`, `inferred`, `unverified`, or `aspirational` where applicable.

## Manager Decision Rules

`startup-manager` should classify requests like this:

- Founder identity, commitment, role confusion, or founder-market fit -> `founder-foundation`
- Problem validation, customer pain, demand proof, pricing hypotheses, or business-model choice -> `value-validation`
- MVP scope, feature pruning, release slicing, ship criteria, or early product sequencing -> `mvp-engine`
- Deck narrative, investor proof, projections, or diligence packaging -> `fundraising-kit`
- Launch planning, channels, messaging, launch metrics, or read-period decisions -> `gtm-launch`
- Funnel bottlenecks, experiment prioritization, conversion movement, or scale decisions -> `growth-engine`
- Equity, governance, legal process, compliance, or operating checklists -> `founder-ops`

For mixed requests:

- Validation before build -> `value-validation` primary, `mvp-engine` next
- Build before fundraising -> `mvp-engine` primary, `fundraising-kit` next only if proof exists
- Launch plus growth -> `gtm-launch` primary if launch is not yet repeatable; `growth-engine` primary if a stable funnel already exists
- Founder dispute plus equity or governance -> `founder-ops` primary if a real legal or equity decision is pending; otherwise `founder-foundation` primary

## File Map

- `.claude/skills/startup/SKILL.md` - this bundle entrypoint
- `.claude/skills/startup/startup-manager/SKILL.md`
- `.claude/skills/startup/founder-foundation/SKILL.md`
- `.claude/skills/startup/value-validation/SKILL.md`
- `.claude/skills/startup/mvp-engine/SKILL.md`
- `.claude/skills/startup/fundraising-kit/SKILL.md`
- `.claude/skills/startup/gtm-launch/SKILL.md`
- `.claude/skills/startup/growth-engine/SKILL.md`
- `.claude/skills/startup/founder-ops/SKILL.md`
