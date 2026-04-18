---
name: growth-engine
description: "Design, run, and interpret growth experiments with funnel evidence and scale discipline. Use when Codex needs to identify a growth bottleneck, prioritize experiments, analyze conversion movement, or decide whether a startup has earned the right to scale a channel or tactic."
---

# Growth Engine

## Purpose

Scale only after finding a real causal improvement. Treat growth as a disciplined experiment system, not a collection of hacks.

## Operating Frame

- Start at the bottleneck instead of brainstorming channels blindly.
- Change one important variable at a time when causality matters.
- Verify that gains survive a hold period before scaling spend or headcount.
- Label major claims as evidenced, inferred, or unverified.

## Minimum Inputs

- Funnel stages and baseline metrics
- Current bottleneck
- Candidate channels or interventions
- Guardrail metrics and test window

If critical facts are missing, ask for the single highest-leverage unknown or mark the assumption as provisional and continue.

## Workflow

1. Map the funnel from acquisition to retained value. Identify the current bottleneck and quantify its baseline.
2. Build an experiment card for each idea: hypothesis, target metric, guardrail metric, segment, intervention, expected mechanism, timebox, and stop rule.
3. Prioritize experiments by expected impact, confidence, and speed to learning. Penalize ideas that create activity without new information.
4. Run the smallest credible test. Capture raw results, confounders, and what changed in the environment during the test.
5. Classify outcomes as signal, noise, mixed, or broken instrumentation. Do not scale from mixed or noisy results.
6. Promote only the experiments that clear both the target metric and the hold-period check, then fold the winners back into the standing growth system.

## Required Outputs

- Funnel map
- Ranked experiment backlog
- Experiment cards
- Result readouts with causal confidence
- Scale or stop decisions

## Default Output Format

Use this section order unless the user asks for a spreadsheet or experiment tracker:

1. Funnel map and bottleneck
2. Baseline metrics
3. Ranked experiment backlog
4. Experiment cards
5. Result interpretation
6. Scale or stop decisions
7. Recommended next skill

## Verification Gate

Do not recommend scaling because a chart moved once. Require baseline comparison, guardrail review, and a believable mechanism for why the lift happened.

## Handoff

- Use `$gtm-launch` when a growth lesson should become part of a broader launch motion.
- Use `$fundraising-kit` after the growth system produces defensible traction proof.
