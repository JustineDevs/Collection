#!/usr/bin/env python3
"""
Patches a create-8004-agent project to use Anthropic Claude instead of OpenAI.

Usage:
    python scripts/patch_anthropic.py <projectDir>

Example:
    python scripts/patch_anthropic.py my-agent

- Overwrites src/agent.ts with the Anthropic template.
- Appends ANTHROPIC_API_KEY= to .env (user must set the value).
- Does not install @anthropic-ai/sdk; user should run: npm install @anthropic-ai/sdk
"""

import sys
from pathlib import Path


def main() -> None:
    if len(sys.argv) < 2:
        print("Usage: python patch_anthropic.py <projectDir>", file=sys.stderr)
        sys.exit(1)

    project_dir = sys.argv[1]
    skill_dir = Path(__file__).resolve().parent.parent
    template_path = skill_dir / "assets" / "agent-anthropic.ts"
    target_agent = Path.cwd() / project_dir / "src" / "agent.ts"
    target_env = Path.cwd() / project_dir / ".env"

    if not template_path.exists():
        print(f"Template not found: {template_path}", file=sys.stderr)
        sys.exit(1)

    if not target_agent.parent.exists():
        print(f"Project directory or src/ not found: {target_agent.parent}", file=sys.stderr)
        sys.exit(1)

    template = template_path.read_text(encoding="utf-8")
    target_agent.write_text(template, encoding="utf-8")
    print("Wrote src/agent.ts (Anthropic Claude).")

    env_line = "\n# Anthropic for LLM agent\nANTHROPIC_API_KEY=\n"
    if target_env.exists():
        content = target_env.read_text(encoding="utf-8")
        if "ANTHROPIC_API_KEY" not in content:
            target_env.write_text(content + env_line, encoding="utf-8")
            print("Appended ANTHROPIC_API_KEY to .env.")
    else:
        target_env.write_text("# Anthropic for LLM agent\nANTHROPIC_API_KEY=\n", encoding="utf-8")
        print("Created .env with ANTHROPIC_API_KEY.")

    print(f"\nNext: cd {project_dir} && npm install @anthropic-ai/sdk")
    print("Then set ANTHROPIC_API_KEY in .env")


if __name__ == "__main__":
    main()
