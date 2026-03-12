# Cursor Setup Gap Analysis

**Date:** 2026-03-12  
**Target:** Professional multi-agent engineering workspace

---

## 1. Target vs Current State

### Capability Areas

| Capability | Target | Current | Gap |
|------------|--------|---------|-----|
| **GitHub automation** | Yes | Partial (vscode.github only) | No dedicated GitHub MCP; use official GitHub MCP or plugin |
| **Filesystem access** | Yes | Yes (filesystem MCP) | Paths exclude Slot; add Slot or use project mcp.json |
| **Browser automation** | Yes | Yes (cursor-ide-browser, Bright Data) | Adequate |
| **Web scraping/crawling** | Yes | Yes (Firecrawl, Bright Data) | Adequate |
| **Postgres integration** | Yes | No | Install Neon plugin or add postgres MCP |
| **Redis integration** | Yes | Skills only | Add Redis MCP for connection/query |
| **HTTP/API testing** | Yes | Thunder Client extension | No MCP; Thunder Client is sufficient for manual testing |
| **Monitoring/observability** | Yes | Datadog (unconfigured), Cloudflare observability | Configure Datadog DD_MCP_DOMAIN |
| **Slack notifications** | Yes | Plugin installed | OAuth required; verify connection |
| **Security scanning** | Yes | No | Install Snyk plugin |
| **Cloudflare/infra** | Yes | Yes (Cloudflare plugin) | Adequate |

---

## 2. Missing Plugins

| Plugin | Status | Action |
|--------|--------|--------|
| **Neon (Postgres)** | Available | Install via Cursor Marketplace or `/add-plugin neon-postgres` |
| **Snyk** | Available | Install via Cursor Marketplace |
| **Grafana** | Unknown | No Cursor plugin found; use Datadog or Cloudflare for metrics |
| **PostHog** | Unknown | No Cursor plugin found; alternative: custom MCP or Datadog |
| **Semgrep** | Unknown | No Cursor plugin; Snyk covers security scanning |

---

## 3. Missing MCP Servers

| MCP | Priority | Action |
|-----|----------|--------|
| **GitHub** | High | Add via `@modelcontextprotocol/server-github` or official GitHub MCP |
| **Postgres** | High | Use Neon plugin (includes MCP) or `@modelcontextprotocol/server-postgres` |
| **Redis** | Medium | Add `@upstash/redis-mcp` or similar; Redis plugin has skills only |
| **Slack** | Low | Plugin provides MCP; ensure OAuth complete |
| **HTTP** | Low | Thunder Client or custom; not critical for agent workflow |
| **Datadog** | Medium | Configure DD_MCP_DOMAIN in Datadog plugin mcp.json |

---

## 4. Redundant / Conflicting Components

| Component | Issue | Recommendation |
|-----------|-------|----------------|
| **Filesystem paths** | Global mcp.json points to Mytel bypass, npvtfiles | Add Slot path or use project-level mcp.json for Slot |
| **Bright Data vs Firecrawl** | Both scraping | Keep both; Bright Data for browser, Firecrawl for crawl/search |
| **GitLab vs GitHub** | GitLab plugin installed | Add GitHub MCP if using GitHub; GitLab for GitLab repos |

---

## 5. Recommended Final Stack

### Plugins (Keep + Add)

- **Keep:** Firecrawl, Cloudflare, Slack, Linear, Figma, Redis, Datadog, GitLab, Cursor Team Kit, Hugging Face, Browserbase
- **Add:** Neon (Postgres), Snyk (security)

### MCP Servers (Final Set)

| Server | Source | Config |
|--------|--------|--------|
| filesystem | Global | Add Slot path |
| Bright Data | Global | Keep (move API_TOKEN to env) |
| GitHub | Global | Add (needs GITHUB_TOKEN) |
| Postgres | Neon plugin | Via Neon plugin |
| Redis | Global | Add if needed |
| Slack | Plugin | OAuth |
| Linear | Plugin | OAuth |
| Figma | Plugin | HTTP |
| Cloudflare (4) | Plugin | OAuth |
| cursor-ide-browser | Built-in | - |
| Datadog | Plugin | Configure DD_MCP_DOMAIN |

### Agents (To Define)

- Architect Agent
- Backend Engineer Agent
- Frontend Engineer Agent
- Test Engineer Agent
- Security Reviewer Agent
- Reverse Engineering Agent
- Monitoring Agent

---

## 6. Manual Actions Required

1. **Secrets/tokens:** GitHub PAT, Neon API key (if not using plugin auth), Datadog region
2. **OAuth:** Slack, Linear, Cloudflare (if not already connected)
3. **Datadog:** Provide DD_MCP_DOMAIN (us1, us3, us5, eu1, ap1, ap2)
4. **Plugin install:** Neon, Snyk via Cursor UI
