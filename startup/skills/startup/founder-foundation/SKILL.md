---
name: founder-foundation
description: "Clarify founder purpose, founder-market fit, role ownership, and an evidence-backed founder thesis. Use when the agent needs to pressure-test why this founder should pursue this startup, define roles and learning loops, or produce a grounded founder foundation before market validation, MVP work, fundraising, or operations planning."
---

# Founder's Foundation

## Purpose

Turn founder motivation into a testable operating thesis. Push past identity statements and force concrete proof, role clarity, and kill criteria.

## Operating Frame

- Proceed autonomously on reversible next steps.
- Separate observation, hypothesis, evidence for, evidence against, and critical unknown.
- Refuse to call the foundation solid until invalidation conditions are explicit.
- Label major claims as evidenced, inferred, or unverified.

## Minimum Inputs

- Founder background and lived insight
- Target market or problem area
- Current constraints, runway, or commitments
- Desired role, company shape, or personal outcome

If critical facts are missing, ask for the single highest-leverage unknown or mark the assumption as provisional and continue.

## Workflow

1. Start with intent. If the founder's goal, scope, or constraints are vague, run `$deep-interview --quick` before drafting anything else.
2. Build a founder thesis with these fields: mission, lived insight, market proximity, unfair advantages, current constraints, and reason to care for the next five years.
3. Pressure-test founder-market fit. Ask what the founder knows that outsiders do not, what they can access faster than others, and what signals would prove they are solving a real problem instead of performing founder identity.
4. Define the role map in three time horizons: now, next, later. Name what the founder owns directly, what should be delegated only after traction, and what should stay intentionally unstaffed for now.
5. Create a learning backlog. List capability gaps, the shortest loop to close each gap, and the evidence that would show the gap is no longer blocking progress.
6. Write kill criteria. Name the facts that would invalidate the founder thesis, force a pivot, or stop the company entirely.

## Required Outputs

- Founder thesis
- Role map
- Learning backlog
- Decision boundaries the agent may decide without confirmation
- Kill criteria and no-go conditions

## Default Output Format

Use this section order unless the user requests another artifact shape:

1. Founder thesis
2. Evidence ledger
3. Role map
4. Learning backlog
5. Decision boundaries
6. Kill criteria
7. Recommended next skill

## Verification Gate

Do not mark this complete until each core claim has an attached proof status: evidenced, inferred, or unverified. If more than half of the thesis is still inferred, treat the output as a draft and hand off to `$value-validation`.

## Handoff

- Use `$value-validation` to test the problem, market, and model.
- Use `$mvp-engine` only after the founder thesis survives first-pass pressure.
