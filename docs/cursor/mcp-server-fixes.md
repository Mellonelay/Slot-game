# MCP Server Fixes

**Date:** 2026-03-13  
**Branch:** cursor/mcp-server-plugins-58d3

---

## Issues Fixed

### 1. Filesystem MCP Server

**Problem:** 
- Using deprecated command `mcp-server-filesystem`
- Path format issues (backslashes vs forward slashes)

**Fix:**
Update `C:\Users\mello\.cursor\mcp.json`:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "C:/Users/mello/OneDrive/Documents/Slot",
        "C:/Users/mello/OneDrive/Documents/Mytel bypass",
        "C:/Users/mello/OneDrive/Documents/Desktop/npvtfiles",
        "C:/Users/mello"
      ]
    }
  }
}
```

**Changes:**
- ✅ Changed command from `mcp-server-filesystem` to `npx` with `@modelcontextprotocol/server-filesystem`
- ✅ Changed all paths to use forward slashes (`/`) instead of backslashes (`\`)
- ✅ Added Slot workspace path
- ✅ Added fallback root path (`C:/Users/mello`)

---

### 2. GitHub MCP Server

**Problem:** Missing GitHub MCP server configuration

**Fix:**
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

**Setup Steps:**
1. Create GitHub PAT at https://github.com/settings/tokens
2. Required scopes: `repo`, `read:org`
3. Replace `<YOUR_GITHUB_PAT>` with your actual token

**Note:** The `@modelcontextprotocol/server-github` package is deprecated but still functional. For future use, consider GitHub's official remote MCP or `github/github-mcp-server`.

---

### 3. Datadog MCP Configuration

**Problem:** Datadog plugin requires `DD_MCP_DOMAIN` configuration

**Fix:**
Edit the Datadog plugin MCP config:
`C:\Users\mello\.cursor\plugins\cache\cursor-public\datadog\fdce3e1db7c99b80939f2ad95c67f525bf0eee50\mcp.json`

Add a `domain` property (or set `DD_MCP_DOMAIN` if the plugin uses env) to your Datadog region:
- `us1` (US1 - US East)
- `us3` (US3 - US West)
- `us5` (US5 - US Central)
- `eu1` (EU1 - Europe)
- `ap1` (AP1 - Asia Pacific)
- `ap2` (AP2 - Asia Pacific 2)

**Example:**
```json
{
  "mcpServers": {
    "datadog": {
      "url": "https://api.datadoghq.com",
      "domain": "us1"
    }
  }
}
```

---

### 4. Plugin OAuth Setup

These plugins require OAuth authentication via Cursor UI:

| Plugin | Action |
|--------|--------|
| **Neon Postgres** | Connect via Cursor MCP OAuth (if installed) |
| **Figma** | Connect via Cursor MCP OAuth |
| **Hugging Face** | Connect via Cursor MCP OAuth |
| **Linear** | Connect via Cursor MCP OAuth |
| **Cloudflare** | Connect via Cursor MCP OAuth (4 servers: docs, bindings, builds, observability) |
| **Slack** | Connect via Cursor MCP OAuth |

**Steps:**
1. Open Cursor Settings
2. Go to MCP section
3. Find the plugin and click "Connect" or "Authorize"
4. Complete OAuth flow in browser

---

## Complete MCP Configuration Template

Here's a complete `mcp.json` template with all fixes applied:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "C:/Users/mello/OneDrive/Documents/Slot",
        "C:/Users/mello/OneDrive/Documents/Mytel bypass",
        "C:/Users/mello/OneDrive/Documents/Desktop/npvtfiles",
        "C:/Users/mello"
      ]
    },
    "Bright Data": {
      "command": "npx",
      "args": ["-y", "@brightdata/mcp"],
      "env": {
        "API_TOKEN": "<YOUR_BRIGHT_DATA_TOKEN>",
        "GROUPS": "advanced_scraping,ecommerce,browser,finance,business,research,app_stores"
      }
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_GITHUB_PAT>"
      }
    }
  }
}
```

---

## Verification Steps

After applying fixes:

1. **Reload Cursor Window:** `Ctrl+Shift+P` → "Developer: Reload Window"
2. **Check MCP Status:** Open Cursor Settings → MCP section
3. **Test Filesystem:** Try accessing files from the configured paths
4. **Test GitHub:** Try using GitHub MCP tools
5. **Check Plugin MCPs:** Verify plugin-provided MCP servers are listed

---

## Known Non-Critical Issues

### user-fetch — "Method not found" for resources
- **Status:** Harmless warning
- **Reason:** Cursor tries to list MCP resources; fetch doesn't expose them
- **Impact:** Tools still work (fetch_json, fetch_html, etc.)

### Bright Data — "error" in logs
- **Status:** Informational messages
- **Reason:** "Required zone already exists" and "Starting server" are normal
- **Impact:** Server is running correctly

---

## Next Steps

1. ✅ Apply filesystem MCP fix (command + paths)
2. ✅ Add GitHub MCP configuration
3. ⚠️ Configure Datadog DD_MCP_DOMAIN (manual)
4. ⚠️ Complete OAuth for plugins (manual)
5. ✅ Reload Cursor window to apply changes

---

## Troubleshooting

### MCP Server Not Found
- Ensure `npx` is available in PATH
- Check Node.js is installed: `node --version`
- Try running command manually: `npx -y @modelcontextprotocol/server-filesystem`

### Path Access Denied
- Verify paths exist and are accessible
- Check Windows permissions for the directories
- Use forward slashes (`/`) in paths, not backslashes (`\`)

### Plugin MCP Not Appearing
- Ensure plugin is installed via Cursor Marketplace
- Check plugin cache directory exists
- Reload Cursor window after plugin installation
