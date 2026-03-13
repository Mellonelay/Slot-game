# MCP Configuration

## Authoritative Config Location

- **Global:** `C:\Users\mello\.cursor\mcp.json`
- **Project:** `<workspace>/.cursor/mcp.json` (overrides/extends for that project)

## Current MCP Servers (After Setup)

| Server | Type | Auth | Notes |
|--------|------|------|-------|
| filesystem | stdio | - | **FIXED:** Uses `npx @modelcontextprotocol/server-filesystem` with forward slashes |
| Bright Data | stdio | API_TOKEN | Scraping, browser |
| GitHub | stdio | GITHUB_TOKEN | **TODO:** Add to global mcp.json (see below) |
| cursor-ide-browser | Built-in | - | Browser automation |
| Cloudflare (4) | Plugin | OAuth | docs, bindings, builds, observability |
| Figma | Plugin | - | HTTP |
| Linear | Plugin | OAuth | HTTP |
| Slack | Plugin | OAuth | HTTP |
| Datadog | Plugin | DD_MCP_DOMAIN | **TODO:** Configure DD_MCP_DOMAIN in plugin |

**See `mcp-server-fixes.md` for detailed fix instructions.**

## GitHub MCP (Add Manually)

Add to `C:\Users\mello\.cursor\mcp.json` under `mcpServers`:

```json
"github": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"],
  "env": {
    "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_GITHUB_PAT>"
  }
}
```

Create a PAT at https://github.com/settings/tokens with `repo`, `read:org` scopes.

**Note:** The `@modelcontextprotocol/server-github` package is deprecated but still functional. For future use, consider GitHub's official remote MCP or `github/github-mcp-server`.

## Postgres (Use Neon Plugin)

Install Neon plugin; it provides its own MCP. No manual mcp.json entry needed.

## Redis (Optional)

If you need Redis MCP for query/connection:

```json
"redis": {
  "command": "npx",
  "args": ["-y", "@upstash/redis-mcp"],
  "env": {
    "UPSTASH_REDIS_REST_URL": "<YOUR_REDIS_URL>",
    "UPSTASH_REDIS_REST_TOKEN": "<YOUR_REDIS_TOKEN>"
  }
}
```

Or use a different Redis MCP package; verify compatibility.

## Datadog Configuration

Edit: `C:\Users\mello\.cursor\plugins\cache\cursor-public\datadog\fdce3e1db7c99b80939f2ad95c67f525bf0eee50\mcp.json`

Replace `${DD_MCP_DOMAIN}` with your region: `us1`, `us3`, `us5`, `eu1`, `ap1`, or `ap2`.
