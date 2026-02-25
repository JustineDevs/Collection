# Security and Trust

This document describes how to use this skill and the create-8004-agent ecosystem safely.

## Scope of This Skill

- This skill is **documentation and guidance only**. It does not execute `npx`, run the patch script, or perform any financial operations.
- Users run all commands themselves in their own environment. Wallet creation, funding, and on-chain registration are user actions, not automated by the skill.

## Verifying the CLI (create-8004-agent)

- **Official source:** [Eversmile12/create-8004-agent](https://github.com/Eversmile12/create-8004-agent) on GitHub.
- **npm:** The package is published as `create-8004-agent`. Verify at [npmjs.com](https://www.npmjs.com/package/create-8004-agent) before running.
- **Pinning:** Prefer a pinned version when available to reduce supply-chain risk, e.g. `npx create-8004-agent@<version>`.

## Optional Patch Script (patch_anthropic.py)

- **Purpose:** Overwrites `src/agent.ts` and appends `ANTHROPIC_API_KEY=` to `.env` in a project directory you specify.
- **Path safety:** The script accepts a single project directory name (e.g. `my-agent`). It rejects paths containing `..` and resolves the target under the current working directory only, preventing path traversal.
- **Inspection:** You can read the script in `scripts/patch_anthropic.py` before running. It only writes to `<projectDir>/src/agent.ts` and `<projectDir>/.env`.
- **Secrets:** `.env` contains API keys and private keys. Do not commit `.env` to version control. Use a secrets manager or environment variables in production.

## Wallet and On-Chain Operations

- The skill documents workflows that involve testnet/devnet funding and on-chain registration. No funds are moved by the skill; users fund their own wallets and run `npm run register` themselves.
- For production, use appropriate key management and restrict who can run registration or payment-related commands.

## Reporting Issues

If you find a security concern in this skill or in the create-8004-agent tool, report it to the maintainers of the relevant project (this repo or [Eversmile12/create-8004-agent](https://github.com/Eversmile12/create-8004-agent)).
