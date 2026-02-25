#!/usr/bin/env python3
"""
Patches a create-8004-agent project to use Anthropic Claude instead of OpenAI.

Usage:
    python scripts/patch_anthropic.py <projectDir>

Example:
    python scripts/patch_anthropic.py my-agent

- Overwrites src/agent.ts with the Anthropic template.
- Appends ANTHROPIC_API_KEY= to .env (user must set the value; do not commit .env).
- Does not install @anthropic-ai/sdk; user should run: npm install @anthropic-ai/sdk

Security: projectDir is resolved and must live under the current working directory
to prevent path traversal. Only writes to <projectDir>/src/agent.ts and <projectDir>/.env.
"""

import sys
from pathlib import Path


def main() -> None:
    if len(sys.argv) < 2:
        print("Usage: python patch_anthropic.py <projectDir>", file=sys.stderr)
        sys.exit(1)

    project_dir_arg = sys.argv[1].strip()
    if not project_dir_arg or ".." in project_dir_arg:
        print("Invalid projectDir: must be a single path segment (no '..').", file=sys.stderr)
        sys.exit(1)

    cwd = Path.cwd().resolve()
    project_root = (cwd / project_dir_arg).resolve()

    try:
        project_root.relative_to(cwd)
    except ValueError:
        print("Invalid projectDir: must resolve to a path under the current directory.", file=sys.stderr)
        sys.exit(1)

    skill_dir = Path(__file__).resolve().parent.parent
    template_path = skill_dir / "assets" / "agent-anthropic.ts"
    target_agent = project_root / "src" / "agent.ts"
    target_env = project_root / ".env"

    if not template_path.exists():
        print(f"Template not found: {template_path}", file=sys.stderr)
        sys.exit(1)

    if not target_agent.parent.exists():
        print(f"Project directory or src/ not found: {target_agent.parent}", file=sys.stderr)
        sys.exit(1)

    template = template_path.read_text(encoding="utf-8")
    target_agent.write_text(template, encoding="utf-8")
    print("Wrote src/agent.ts (Anthropic Claude).")

    env_line = "\n# Anthropic for LLM agent (do not commit .env)\nANTHROPIC_API_KEY=\n"
    if target_env.exists():
        content = target_env.read_text(encoding="utf-8")
        if "ANTHROPIC_API_KEY" not in content:
            target_env.write_text(content + env_line, encoding="utf-8")
            print("Appended ANTHROPIC_API_KEY to .env.")
    else:
        target_env.write_text("# Anthropic for LLM agent (do not commit .env)\nANTHROPIC_API_KEY=\n", encoding="utf-8")
        print("Created .env with ANTHROPIC_API_KEY.")

    print(f"\nNext: cd {project_dir_arg} && npm install @anthropic-ai/sdk")
    print("Then set ANTHROPIC_API_KEY in .env (keep .env out of version control).")


if __name__ == "__main__":
    main()
