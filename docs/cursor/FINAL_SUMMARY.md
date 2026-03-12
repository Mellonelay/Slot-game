# Cursor Setup — Final Summary

**Date:** 2026-03-12

---

## 1. What Was Detected

### Plugins (11 installed)
- Firecrawl, Cloudflare, Slack, Linear, Figma, Redis, Datadog, GitLab, Cursor Team Kit, Hugging Face Skills, Browserbase Functions

### MCP Servers
- **Global:** filesystem (Mytel bypass, npvtfiles), Bright Data
- **Plugin:** Cloudflare (4), Figma, Linear, Slack
- **Built-in:** cursor-ide-browser

### Extensions
- ESLint, Prettier, Tailwind, Prisma, Docker, Jupyter, Python, Thunder Client, etc.

### Gaps
- No GitHub MCP
- No Postgres MCP (Neon plugin not installed)
- No Snyk (security)
- Datadog unconfigured (DD_MCP_DOMAIN)
- Filesystem excluded Slot path

---

## 2. What Was Installed

- **Plugins:** None installed automatically (user must install Neon, Snyk via Cursor UI)
- **Rules:** 4 rules copied to `.cursor/rules/`
- **Docs:** Full documentation in `docs/cursor/`

---

## 3. What Was Configured

| Change | Location |
|--------|----------|
| Added Slot to filesystem paths | `C:\Users\mello\.cursor\mcp.json` |
| Backup created | `C:\Users\mello\.cursor\mcp.json.backup.20260312` |
| Project rules | `.cursor/rules/*.mdc` |

---

## 4. What Still Requires Manual Action

1. **Install plugins:** Neon Postgres, Snyk (Cursor Marketplace or `/add-plugin`)
2. **Add GitHub MCP:** Edit `C:\Users\mello\.cursor\mcp.json`, add GitHub server with `GITHUB_PERSONAL_ACCESS_TOKEN`
3. **Configure Datadog:** Set `DD_MCP_DOMAIN` in Datadog plugin mcp.json
4. **OAuth:** Complete Slack, Linear, Cloudflare if not already done
5. **Git hooks:** Optional — set up pre-commit (see `docs/cursor/hooks/`)

---

## 5. Final Recommended Plugin Set

| Plugin | Status |
|--------|--------|
| Firecrawl | Keep |
| Cloudflare | Keep |
| Slack | Keep |
| Linear | Keep |
| Figma | Keep |
| Redis | Keep |
| Datadog | Keep (configure) |
| GitLab | Keep |
| Cursor Team Kit | Keep |
| Hugging Face Skills | Keep |
| Browserbase Functions | Keep |
| **Neon Postgres** | **Install** |
| **Snyk** | **Install** |

---

## 6. Final Recommended MCP Set

| Server | Source |
|--------|--------|
| filesystem | Global (Slot, Mytel bypass, npvtfiles) |
| Bright Data | Global |
| GitHub | Global (add manually) |
| Postgres | Neon plugin |
| cursor-ide-browser | Built-in |
| Cloudflare (4) | Plugin |
| Figma | Plugin |
| Linear | Plugin |
| Slack | Plugin |
| Datadog | Plugin (configure) |

---

## 7. Final Agent List

1. Architect Agent
2. Backend Engineer Agent
3. Frontend Engineer Agent
4. Test Engineer Agent
5. Security Reviewer Agent
6. Reverse Engineering Agent
7. Monitoring Agent

---

## 8. Final Manual Secrets Needed

| Secret | Purpose |
|--------|---------|
| GITHUB_PERSONAL_ACCESS_TOKEN | GitHub MCP |
| DD_MCP_DOMAIN | Datadog region (us1, us3, us5, eu1, ap1, ap2) |
| Bright Data API_TOKEN | Already set; consider env var |

---

## 9. Next Steps to Activate Multi-Agent Workflow

1. Install Neon and Snyk plugins.
2. Add GitHub MCP with PAT.
3. Configure Datadog DD_MCP_DOMAIN.
4. Complete OAuth for Slack, Linear, Cloudflare.
5. Reload Cursor window (Ctrl+Shift+P → "Reload Window").
6. Reference `docs/cursor/agents/*.md` when delegating to agents.
7. Use `mcp_task` with subagent_type for explore/shell/generalPurpose when needed.
