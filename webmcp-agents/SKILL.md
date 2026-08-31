---
name: webmcp-agents
description: Curated WebMCP agent skill bundle for designing, implementing, operating, securing, evaluating, and maintaining page-local browser tools with agent-browser-style discovery, execution, observation, and verification. Use when building WebMCP integrations, connecting UI and UX state to agent actions, designing DESIGN.md workflows, or reviewing browser-agent safety and recovery.
license: See repository LICENSE.md
---

# webmcp-agents

Use this bundle as the entrypoint for WebMCP work. It keeps one page-local operating model while routing specialized work to the smallest relevant skill under [`skills/`](skills/).

## Route the request

- `webmcp-agent-browser` — inspect, discover, execute, refresh, and verify like an agent browser.
- `webmcp-core` — normative registration, discovery, execution, lifecycle, and cancellation.
- `webmcp-tool-design` — tool schemas, UI↔UX journeys, state, confirmation, and recovery.
- `webmcp-declarative` — exploratory HTML-form tools and preview behavior.
- `webmcp-frameworks` — React, Angular, TypeScript, SSR, and lifecycle integration.
- `webmcp-design-md` — DESIGN.md tokens, Lexer → AST → semantic model → Renderer workflows.
- `webmcp-security` — origin, permissions, privacy, untrusted content, and consequential actions.
- `webmcp-evals` — selection, chaining, outputs, reliability, and prompt-injection evaluation.
- `webmcp-service-workers` — exploratory background routing and multi-tab architecture.
- `webmcp-setup` — browser flags, origin trials, support checks, and fallback behavior.
- `webmcp-maintainer` — source authority, validation, publication, and stale-content checks.

## Shared operating loop

```text
intent → observe live page → discover semantic tools → validate input
→ execute page-owned action → observe fresh state → verify result or recover
```

Prefer WebMCP tools when they cover the user goal. Keep DOM observation and direct browser actuation as explicit fallback and recovery primitives. Human-visible UI, accessibility, loading, errors, confirmation, cancellation, and agent results must remain one coherent journey.

## Authority

Use [`index.bs`](index.bs) for normative behavior. Treat the declarative API, service-worker material, and external DESIGN.md format as exploratory or version-gated unless the source says otherwise.
