# MCP Configuration

## Authoritative Config Location

- **Global:** `C:\Users\mello\.cursor\mcp.json`
- **Project:** `<workspace>/.cursor/mcp.json` (overrides/extends for that project)

## Current MCP Servers (After Setup)

| Server | Type | Auth | Notes |
|--------|------|------|-------|
| filesystem | stdio | - | Uses `npx @modelcontextprotocol/server-filesystem` with forward slashes |
| Bright Data | stdio | API_TOKEN | Scraping, browser |
| GitHub | stdio | GITHUB_PERSONAL_ACCESS_TOKEN | Configured in global mcp.json |
| fetch | stdio | - | @tokenizin/mcp-npx-fetch |
| cursor-ide-browser | Built-in | - | Browser automation |
| Cloudflare (4) | Plugin | OAuth | docs, bindings, builds, observability |
| Figma | Plugin | - | HTTP |
| Linear | Plugin | OAuth | HTTP |
| Slack | Plugin | OAuth | HTTP |
| Datadog | Plugin | domain | Set region in plugin mcp.json (see below) |

**See `mcp-server-fixes.md` for detailed fix instructions.**

## GitHub MCP

Already configured in `C:\Users\mello\.cursor\mcp.json` with `GITHUB_PERSONAL_ACCESS_TOKEN`. To add or change: create a PAT at https://github.com/settings/tokens with `repo`, `read:org` scopes. The `@modelcontextprotocol/server-github` package is deprecated but still functional.

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

Edit the plugin MCP config and set your region so the plugin uses the correct Datadog site:

- **Path:** `C:\Users\mello\.cursor\plugins\cache\cursor-public\datadog\fdce3e1db7c99b80939f2ad95c67f525bf0eee50\mcp.json`
- **Add or set** `domain` to one of: `us1`, `us3`, `us5`, `eu1`, `ap1`, `ap2`
- Then reload Cursor: `Ctrl+Shift+P` → "Developer: Reload Window"
