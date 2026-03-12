# Cursor Plugin Plan

## Current Plugins (Keep)

| Plugin | Purpose |
|--------|---------|
| Firecrawl | Web scraping, crawling, search |
| Cloudflare | Workers, Durable Objects, Agents SDK, observability |
| Slack | Channel search, messaging |
| Linear | Issues, projects, documents |
| Figma | Design-to-code, Code Connect |
| Redis | Development best practices (skills) |
| Datadog | Logs, metrics, traces (configure DD_MCP_DOMAIN) |
| GitLab | Issues, MRs, pipelines |
| Cursor Team Kit | TypeScript rules |
| Hugging Face Skills | ML workflows |
| Browserbase Functions | Serverless browser automation |

## Plugins to Install

| Plugin | Install Command | Purpose |
|--------|-----------------|---------|
| **Neon Postgres** | Cursor: `/add-plugin neon-postgres` or Marketplace | Postgres integration, branching, SQL |
| **Snyk** | Cursor Marketplace | Security scanning, vulnerability fixes |

## Plugins Not Available (Alternatives)

| Requested | Alternative |
|------------|-------------|
| Grafana | Use Datadog or Cloudflare observability MCP |
| PostHog | Use Datadog; or custom MCP |
| Semgrep | Use Snyk for security scanning |
| Browserbase | Browserbase Functions plugin exists; cursor-ide-browser for local |

## Configuration Required

- **Datadog:** Set `DD_MCP_DOMAIN` in plugin mcp.json (us1, us3, us5, eu1, ap1, ap2)
- **Slack / Linear / Cloudflare:** OAuth via Cursor (one-time)
- **Neon:** Auth via plugin
- **Snyk:** Auth via Snyk login
