---
name: value-validation
description: "Validate startup value propositions, market demand, customer pain, and business-model options with explicit evidence and invalidation logic. Use when the agent needs to assess problem-solution fit, compare business models, synthesize user and market evidence, or plan validation experiments before building or fundraising."
---

# Value Validation

## Purpose

Convert startup belief into a ranked evidence stack. Treat the market as a system to falsify, not a story to decorate.

## Operating Frame

- Prefer observed customer behavior over founder opinions.
- Generate multiple viable business-model candidates before narrowing.
- Record both supporting evidence and disconfirming evidence for every major claim.
- Label major claims as evidenced, inferred, or unverified.

## Minimum Inputs

- Customer segment
- Problem or painful workflow
- Existing signals such as interviews, usage, reviews, or competitor observations
- Any pricing, channel, or business-model constraints already known

If critical facts are missing, ask for the single highest-leverage unknown or mark the assumption as provisional and continue.

## Workflow

1. Frame the problem in customer language. Capture user segment, painful job, current workaround, urgency, and spending authority.
2. Build an evidence ledger with five columns: observation, hypothesis, evidence for, evidence against, and critical unknown.
3. Map the market from light to deep:
   - Use a light pass for surface competitor and category scanning.
   - Use a standard pass for synthesis of interviews, reviews, and adjacent substitutes.
   - Use a thorough pass for pricing, wedge, channel, and business-model choice.
4. Force at least three business-model candidates. For each one, write why it could work, what would kill it, and why it is not the default choice yet.
5. Rank the top assumptions by existential risk. Focus next experiments on the few assumptions that could destroy the company, not the ones that are easiest to test.
6. Produce a validation plan with experiment, owner, timebox, success threshold, failure threshold, and what decision changes afterward.

## Required Outputs

- Problem statement in customer language
- Evidence ledger
- Business-model comparison with rejected alternatives
- Top-risk assumption list
- Validation experiment queue

## Default Output Format

Use this section order unless the user asks for a memo, table, or slide form:

1. Customer problem statement
2. Evidence ledger
3. Market and substitute readout
4. Business-model comparison
5. Ranked assumptions
6. Validation experiment queue
7. Recommended next skill

## Verification Gate

Do not claim validation from TAM slides, founder conviction, or vanity signups alone. Require at least one concrete external signal per major claim, and explicitly label any claim still resting on inference.

## Handoff

- Use `$mvp-engine` when the riskiest assumptions are clear enough to build against.
- Use `$fundraising-kit` only after the market case has evidence and rejected alternatives.
