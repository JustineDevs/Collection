---
name: mvp-engine
description: "Scope, sequence, and verify an MVP with founder constraints, market evidence, and shipping gates. Use when Codex needs to define the smallest useful product, turn validation insights into build loops, manage iterative MVP delivery, or decide whether a feature is ready to ship."
---

# MVP Engine

## Purpose

Build the smallest product that can learn something decisive. Optimize for validated learning and constrained execution, not feature completeness.

## Operating Frame

- Reuse evidence from founder and market work before inventing scope.
- Keep one measurable learning objective per release slice.
- Refuse to ship without an explicit architect-style review of risks, shortcuts, and missing proof.
- Label major claims as evidenced, inferred, or unverified.

## Minimum Inputs

- User segment and painful workflow
- Riskiest assumption to test
- Technical constraints and available build capacity
- Desired post-launch signal

If critical facts are missing, ask for the single highest-leverage unknown or mark the assumption as provisional and continue.

## Workflow

1. Start with a context snapshot: user segment, painful workflow, riskiest assumption, technical constraints, and the one outcome this MVP must test.
2. Define the smallest useful promise. Write what the product must let a user achieve end to end, and list everything that feels attractive but is not required for that promise.
3. Slice the MVP into build loops: first useful path, instrumentation, reliability hardening, and post-launch learning hooks.
4. For each slice, record the assumption it tests, the artifact to build, the acceptance criteria, and the evidence expected after release.
5. Treat execution as a persistence loop. Keep iterating until the slice is shipped or a real blocker is proven. When implementation work exists, hand off to `$ralph` or an execution lane that preserves the acceptance criteria.
6. Run a ship review before release. Check architecture shortcuts, failure modes, analytics coverage, and whether the release still tests the intended assumption.

## Required Outputs

- MVP promise statement
- In-scope and explicitly rejected scope
- Release slices with learning goals
- Ship checklist and post-launch read plan

## Default Output Format

Use this section order unless the user needs tickets or a roadmap instead:

1. MVP promise
2. User and assumption context
3. In-scope
4. Out-of-scope
5. Release slices
6. Ship checklist
7. Post-launch read plan
8. Recommended next skill

## Verification Gate

Do not call the MVP ready because the backlog is empty or the UI looks complete. Mark it ready only when the end-to-end path works, the intended signal is measurable, and the release still tests the startup question it was built to answer.

## Handoff

- Use `$gtm-launch` after the MVP has a measurable post-launch signal plan.
- Loop back to `$value-validation` if the build reveals the wrong problem or the wrong customer.
