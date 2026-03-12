# Cursor Multi-Agent Workspace Setup

This directory contains the configuration and documentation for a professional multi-agent Cursor engineering workspace.

## Quick Reference

| Document | Purpose |
|----------|---------|
| [01-plugin-plan.md](01-plugin-plan.md) | Plugins to install (Neon, Snyk) |
| [02-mcp-configuration.md](02-mcp-configuration.md) | MCP servers and config |
| [03-agent-architecture.md](03-agent-architecture.md) | Agent roster and workflow |
| [04-rules-skills-hooks.md](04-rules-skills-hooks.md) | Rules, skills, hooks overview |
| [05-secrets-needed.md](05-secrets-needed.md) | Tokens and OAuth |

## Agent Definitions

- [architect](agents/architect.md)
- [backend-engineer](agents/backend-engineer.md)
- [frontend-engineer](agents/frontend-engineer.md)
- [test-engineer](agents/test-engineer.md)
- [security-reviewer](agents/security-reviewer.md)
- [reverse-engineering](agents/reverse-engineering.md)
- [monitoring](agents/monitoring.md)

## Activation

1. Install plugins: Neon, Snyk (Cursor Marketplace or `/add-plugin`)
2. Add GitHub MCP to `~/.cursor/mcp.json` (see 02-mcp-configuration.md)
3. Configure Datadog DD_MCP_DOMAIN
4. Complete OAuth for Slack, Linear, Cloudflare
5. Copy rules from `docs/cursor/rules/` to `.cursor/rules/` (already done)
6. Set up Git hooks (see hooks/on-commit-test-security.md)

## WSL Path

For WSL users: workspace maps to `/mnt/c/Users/mello/OneDrive/Documents/Slot` or your WSL home.
