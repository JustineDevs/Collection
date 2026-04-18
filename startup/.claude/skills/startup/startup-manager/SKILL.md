---
name: startup-manager
description: Startup bundle manager for routing founder requests to the most practical startup module. Use when a startup request is broad, ambiguous, spans multiple phases, or mentions several founder needs at once and the agent must decide which bundled module should be used first and which should stay unused for now.
license: MIT
---

# Startup Manager

## Purpose

Act as the control layer for the `startup` bundle. Classify the user's request, choose the most practical primary module, and avoid dragging in unrelated startup modules.

## Core Rules

- Choose one primary module by default.
- Add one secondary module only when the primary output clearly depends on it.
- If multiple startup stages are mentioned, start with the earliest blocking stage.
- Prefer practical sequence over founder excitement.
- Do not route to fundraising before proof exists.
- Do not route to growth before a stable launch or funnel exists.
- Do not route to founder-ops unless there is a real legal, equity, governance, or compliance decision.

## Routing Table

- Founder motivation, founder role, personal fit, commitment, cofounder alignment -> `founder-foundation`
- Customer pain, market proof, pricing, business model, validation experiments -> `value-validation`
- MVP scoping, feature cuts, release slicing, shipping gates -> `mvp-engine`
- Investor narrative, deck logic, projections, diligence -> `fundraising-kit`
- Launch planning, messaging, channels, launch metrics -> `gtm-launch`
- Funnel analysis, experiments, conversion, scale decisions -> `growth-engine`
- Legal process, equity, cap table, governance, compliance -> `founder-ops`

## Practical Selection Logic

1. Identify the user's actual bottleneck, not just the artifact they asked for.
2. Check whether the request is pre-validation, pre-build, pre-launch, post-launch, fundraising, or founder-ops.
3. Pick the earliest module that would unblock correct work.
4. Name the next module only if there is a clear follow-on step.
5. Keep the answer grounded in the chosen module's output format.

## Tie-Break Rules

- If the user asks for both validation and MVP, use `value-validation` first unless the validation proof already exists.
- If the user asks for both MVP and fundraising, use `mvp-engine` first unless investor materials are the immediate task and proof is already available.
- If the user asks for both launch and growth, use `gtm-launch` first unless the launch motion is already stable and the problem is funnel optimization.
- If the user asks for founder strategy plus equity or governance, use `founder-ops` only when a real operating decision is pending now.

## Output Contract

Start with a short routing decision:

- `Primary module: <module>`
- `Why this module: <one sentence>`
- `Not using now: <modules intentionally excluded>`
- `Next module later: <optional>`

Then execute using only the selected module's structure.

## Escalation

Ask a clarifying question only when the request could reasonably route to two different early-stage modules and the wrong choice would materially change the output.
