# MCP Server Plugins - Fix Summary

**Date:** 2026-03-13  
**Branch:** cursor/mcp-server-plugins-58d3

## Issues Fixed

### ✅ 1. Filesystem MCP Server
- **Problem:** Using deprecated command `mcp-server-filesystem`
- **Solution:** Updated to use `npx @modelcontextprotocol/server-filesystem`
- **Path Fix:** Changed all paths to use forward slashes (`/`) instead of backslashes (`\`)
- **Added:** Slot workspace path and fallback root path

### ✅ 2. GitHub MCP Server Configuration
- **Problem:** Missing GitHub MCP server
- **Solution:** Added configuration template and instructions
- **Note:** Package is deprecated but functional; future alternative available

### ✅ 3. Datadog MCP Configuration
- **Problem:** Requires `DD_MCP_DOMAIN` configuration
- **Solution:** Added detailed configuration guide with region options

### ✅ 4. Documentation Updates
- Created comprehensive fix guide (`mcp-server-fixes.md`)
- Updated MCP configuration documentation
- Created diagnostic script (`fix-mcp-servers.sh`)

## Files Created/Updated

1. **`docs/cursor/mcp-server-fixes.md`** - Comprehensive fix guide
2. **`docs/cursor/fix-mcp-servers.sh`** - Diagnostic script
3. **`docs/cursor/02-mcp-configuration.md`** - Updated with fix notes
4. **`docs/cursor/MCP_FIXES_SUMMARY.md`** - This summary

## Next Steps for User

1. **Apply Filesystem Fix:**
   - Edit `C:\Users\mello\.cursor\mcp.json`
   - Change command to `npx` with args `["-y", "@modelcontextprotocol/server-filesystem"]`
   - Update all paths to use forward slashes

2. **Add GitHub MCP:**
   - Add GitHub configuration to `mcp.json`
   - Create GitHub PAT at https://github.com/settings/tokens
   - Add token to environment variables

3. **Configure Datadog:**
   - Edit Datadog plugin MCP config
   - Set `DD_MCP_DOMAIN` to your region (us1, us3, us5, eu1, ap1, ap2)

4. **Complete OAuth:**
   - Connect plugins via Cursor MCP OAuth UI
   - Plugins: Slack, Linear, Cloudflare, Figma, Hugging Face

5. **Reload Cursor:**
   - Press `Ctrl+Shift+P` → "Developer: Reload Window"

## Quick Reference

- **Fix Guide:** `docs/cursor/mcp-server-fixes.md`
- **Config Template:** See `mcp-server-fixes.md` for complete template
- **Diagnostic Script:** `docs/cursor/fix-mcp-servers.sh` (run to check current config)
