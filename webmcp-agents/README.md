# webmcp-agents

Portable WebMCP skills for Claude Code, Codex, Cursor, GitHub Copilot, Gemini CLI, Windsurf, Cline, Amp, OpenCode, and other Agent Skills-compatible runtimes.

## Install

```sh
npx skills add JustineDevs/collection/webmcp-agents
```

For unattended global installation to the detected agent:

```sh
npx skills add JustineDevs/collection/webmcp-agents -y -g
```

The root [`SKILL.md`](SKILL.md) is the public bundle entrypoint. The specialized skills under [`skills/`](skills/) are bundled resources and share the same WebMCP authority and agent-browser-style operating loop.

## Source authority

- [`index.bs`](index.bs) is the normative WebMCP source.
- [`docs/webmcp-explainer.md`](docs/webmcp-explainer.md) is the developer-facing explainer.
- [`skills/catalog.md`](skills/catalog.md) inventories the bundled specialists.
- [`ARCHITECTURE.md`](ARCHITECTURE.md) explains the package boundaries and data flow.

WebMCP is under active development. Verify browser support and preview behavior against the [official Chrome WebMCP documentation](https://developer.chrome.com/docs/ai/webmcp).
