# Secrets and Manual Configuration

## Required Secrets

| Secret | Where | How to Obtain |
|--------|-------|---------------|
| **GITHUB_PERSONAL_ACCESS_TOKEN** | mcp.json (GitHub MCP) | https://github.com/settings/tokens — scopes: `repo`, `read:org` |
| **Bright Data API_TOKEN** | mcp.json (already set) | Keep existing; consider moving to env var |
| **DD_MCP_DOMAIN** | Datadog plugin mcp.json | Your Datadog region: us1, us3, us5, eu1, ap1, ap2 |

## OAuth (One-Time)

| Service | Action |
|---------|--------|
| Slack | Connect via Cursor MCP OAuth when first using Slack tools |
| Linear | Connect via Cursor MCP OAuth when first using Linear tools |
| Cloudflare | Connect via Cursor MCP OAuth when first using Cloudflare tools |

## Optional (If Used)

| Secret | Purpose |
|--------|---------|
| Neon API key | If using Neon plugin (may use browser auth) |
| Snyk auth | Snyk plugin login |
| Redis URL/Token | If adding Redis MCP |
| Postgres connection string | If using stdio Postgres MCP instead of Neon |

## Security Notes

- Never commit tokens to git.
- Use environment variables where supported.
- Rotate Bright Data token if exposed.
- Prefer OAuth over long-lived tokens where possible.
