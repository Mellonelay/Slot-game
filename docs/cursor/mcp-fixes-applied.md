# MCP Fixes Applied

**Date:** 2026-03-13

---

## Fixes Applied

### 1. Filesystem MCP — Path Format

**Problem:** `mcp-server-filesystem` not found; paths reported as "invalid or inaccessible"

**Fix:**
- Switched to `npx @modelcontextprotocol/server-filesystem` (already done earlier)
- Updated paths to use **forward slashes** (`C:/Users/...`) for Windows compatibility
- Removed WSL path (`\\wsl.localhost\...`) — not accessible from Windows Node
- Added `C:/Users/mello` as fallback root

**Current paths:**
- `C:/Users/mello/OneDrive/Documents/Slot`
- `C:/Users/mello/OneDrive/Documents/Mytel bypass`
- `C:/Users/mello/OneDrive/Documents/Desktop/npvtfiles`
- `C:/Users/mello`

---

## Non-Critical (No Config Change)

### user-fetch — "Method not found" for resources

Cursor tries to list MCP resources; fetch doesn't expose them. **Tools still work** (fetch_json, fetch_html, etc.). Harmless warning.

### Bright Data — "error" in logs

Logs show "Required zone already exists" and "Starting server" — these are informational. Server is running.

### GitHub MCP — Deprecated package

`@modelcontextprotocol/server-github` is deprecated. It still works. For future: consider GitHub's remote MCP or `github/github-mcp-server`.

---

## Manual Steps (OAuth)

These need you to complete OAuth in Cursor:

| Plugin | Action |
|--------|--------|
| **Neon Postgres** | Connect via Cursor MCP OAuth |
| **Figma** | Connect via Cursor MCP OAuth |
| **Hugging Face** | Connect via Cursor MCP OAuth |
| **Linear** | Connect via Cursor MCP OAuth |
| **Cloudflare** | Connect via Cursor MCP OAuth |

---

## Next Step

**Reload Window:** Ctrl+Shift+P → "Reload Window" to apply the filesystem fix.
