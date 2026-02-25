---
name: erc8004-agent-creator
description: Scaffolds ERC-8004 and 8004 AI agents (EVM and Solana) with A2A, MCP, and x402 using create-8004-agent. Use when the user wants to create an 8004/ERC-8004 agent, choose chain (e.g. Base Sepolia, Ethereum Sepolia, Polygon Amoy, Solana Devnet), features (A2A, MCP, x402), and optionally LLM provider (OpenAI or Anthropic/Claude). Handles running the generator and patching agent.ts for Claude when requested.
---

# ERC-8004 Agent Creator

## Overview

This skill scaffolds production-ready ERC-8004 (EVM) or 8004 (Solana) agents using the [create-8004-agent](https://github.com/Eversmile12/create-8004-agent) CLI. It generates a project with optional A2A server, MCP server, and x402 payments, and can patch the default OpenAI agent to use Anthropic Claude instead.

## When to Use

- User asks to create an ERC-8004 or 8004 agent, or to scaffold an AI agent for Base Sepolia, Ethereum Sepolia, Polygon Amoy, Monad, or Solana Devnet.
- User specifies chain, features (A2A, MCP, x402), and optionally "using Claude" or "with Anthropic."

## Inferred Parameters

From the user's request, infer or ask for:

| Parameter | Type | Notes |
|-----------|------|--------|
| `projectDir` | string | Project directory name (e.g. `my-agent`). Default `my-agent`. |
| `agentName` | string | Display name of the agent. |
| `agentDescription` | string | Short description of what the agent does. |
| `chain` | enum | One of: `eth-sepolia`, `base-sepolia`, `polygon-amoy`, `monad-testnet`, `solana-devnet` (and mainnets if needed). |
| `features` | list | Subset of `a2a`, `mcp`, `x402`. x402 only on Base/Polygon (not Ethereum, Monad). |
| `a2aStreaming` | boolean | Enable A2A SSE streaming. Default false. Only if A2A enabled. |
| `llm_provider` | enum | `openai` (default) or `anthropic`. If user says "Claude" or "Anthropic", use `anthropic`. |
| `agentWallet` | string | Optional. Leave empty to let the wizard generate a new wallet. |

See [references/wizard-options.md](references/wizard-options.md) for full wizard order and chain/feature matrix.

## Execution Steps

1. **Prerequisites**
   - Ensure Node.js 18+ and npm/pnpm/bun are available.
   - User must have (or generate) a wallet; the CLI can generate one if wallet is left empty.

2. **Run the generator**
   - Run: `npx create-8004-agent`
   - The wizard will prompt for: project directory, agent name, description, image URL, chain, wallet, features (A2A, MCP, x402), A2A streaming, trust models.
   - Either guide the user to answer the prompts, or run the CLI and provide answers in the same order as the wizard (projectDir, agentName, agentDescription, agentImage, chain, agentWallet, features, a2aStreaming, trustModels).

3. **Patch for Anthropic (if requested)**
   - If the user asked for Claude/Anthropic, after the project is generated run the skill's patch script so the agent uses Anthropic instead of OpenAI:
     - From the workspace root: `python erc8004-agent-creator/scripts/patch_anthropic.py <projectDir>`
     - Or from the skill directory: `python scripts/patch_anthropic.py <projectDir>`
   - The script overwrites `src/agent.ts` with the Anthropic template and appends `ANTHROPIC_API_KEY` to `.env`. Ensure the project's `package.json` includes `@anthropic-ai/sdk` (the script does not install it; add it manually or document for the user: `npm install @anthropic-ai/sdk`).

4. **Return next steps**
   - Tell the user:
     - `cd <projectDir>`
     - Configure `.env`: add `OPENAI_API_KEY` (or `ANTHROPIC_API_KEY` if patched), `PINATA_JWT`; if a wallet was generated, back up `.env`.
     - Fund the wallet (testnet ETH or devnet SOL per chain).
     - If A2A: run `npm run start:a2a`, then update registration with the public URL, then run `npm run register`.
     - If MCP: run `npm run start:mcp`.
     - Register on-chain: `npm run register`.

## Resources

### scripts/patch_anthropic.py

Overwrites `src/agent.ts` in the given project directory with an Anthropic Claude implementation and appends `ANTHROPIC_API_KEY=` to `.env`. Usage:

```bash
python scripts/patch_anthropic.py <projectDir>
```

Example: `python scripts/patch_anthropic.py my-agent`

### references/wizard-options.md

Wizard prompt order, chain keys, and feature availability (including x402 support per chain). Read when you need to map user intent to exact wizard answers or to automate piping.

### assets/agent-anthropic.ts

Template source for the Anthropic agent used by `patch_anthropic.py`. You can read it to understand the patched agent shape or to customize the script.
