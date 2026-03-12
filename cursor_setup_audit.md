# Cursor Workspace Setup Audit

**Date:** 2026-03-12  
**Environment:** Windows 10 + WSL (kali-linux)  
**Workspace:** c:\Users\mello\OneDrive\Documents\Slot  
**WSL path:** `/mnt/c/Users/mello/OneDrive/Documents/Slot` (or `/home/kali` in WSL home)

---

## 1. Installed Cursor Plugins

| Plugin | Version | Status | MCP | Notes |
|--------|---------|--------|-----|-------|
| **Firecrawl** | 0.1.0 | Installed | CLI-based | Web scraping, crawling, search. Requires Firecrawl CLI. |
| **Cloudflare** | 1.0.0 | Installed | Yes (docs, bindings, builds, observability) | Skills for Workers, Durable Objects, Agents SDK, Wrangler. |
| **Slack** | - | Installed | Yes (OAuth) | Search channels, send messages. Requires OAuth. |
| **Linear** | 1.0.0 | Installed | Yes (OAuth) | Issues, projects, documents. |
| **Figma** | 1.2.0 | Installed | Yes (HTTP) | Design-to-code, Code Connect. |
| **Redis** | 1.0.0 | Installed | No (skills only) | Redis development best practices. Skills only, no MCP. |
| **Datadog** | 0.5.0 | Installed | Yes (HTTP) | Logs, metrics, traces, dashboards. Requires DD_MCP_DOMAIN. |
| **GitLab** | 0.1.0 | Installed | Yes | Issues, MRs, pipelines. |
| **Cursor Team Kit** | - | Installed | No | TypeScript rules. |
| **Hugging Face Skills** | - | Installed | Yes (via .mcp.json) | Skills for ML workflows. |
| **Browserbase Functions** | 1.0.0 | Installed | No | Deploy serverless browser automation. |

---

## 2. MCP Configuration

### Main config

**Path:** `C:\Users\mello\.cursor\mcp.json`

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "mcp-server-filesystem",
      "args": [
        "C:\\Users\\mello\\OneDrive\\Documents\\Mytel bypass",
        "C:\\Users\\mello\\OneDrive\\Documents\\Desktop\\npvtfiles"
      ]
    },
    "Bright Data": {
      "command": "npx",
      "args": ["-y", "@brightdata/mcp"],
      "env": {
        "API_TOKEN": "<redacted>",
        "GROUPS": "advanced_scraping,ecommerce,browser,finance,business,research,app_stores"
      }
    }
  }
}
```

**Note:** Filesystem paths are project-specific (Mytel bypass, npvtfiles). Slot workspace is not in the list.

### Plugin-provided MCP servers (auto-registered when enabled)

| Server | Source | Auth | Transport |
|--------|--------|------|-----------|
| plugin-cloudflare-cloudflare-docs | Cloudflare plugin | OAuth | HTTP |
| plugin-cloudflare-cloudflare-bindings | Cloudflare plugin | OAuth | HTTP |
| plugin-cloudflare-cloudflare-builds | Cloudflare plugin | OAuth | HTTP |
| plugin-cloudflare-cloudflare-observability | Cloudflare plugin | OAuth | HTTP |
| plugin-figma-figma | Figma plugin | - | HTTP |
| plugin-linear-linear | Linear plugin | OAuth | HTTP |
| user-filesystem | Global mcp.json | - | stdio |
| user-Bright Data | Global mcp.json | API_TOKEN | stdio |
| cursor-ide-browser | Built-in | - | - |

### Project-specific MCP

**Mytel bypass:** `C:\Users\mello\OneDrive\Documents\Mytel bypass\.cursor\mcp.json`  
- Uses `npx @modelcontextprotocol/server-filesystem` with project path.

---

## 3. Rules, Skills, Hooks

### Rules (from plugins)

- **Firecrawl:** `install.mdc` (Firecrawl CLI setup)
- **Cloudflare:** `workers.mdc`
- **Redis:** 30+ rules (vector search, caching, security, etc.)
- **GitLab:** `gitlab-workflow.mdc`
- **Cursor Team Kit:** `typescript-exhaustive-switch.mdc`, `no-inline-imports.mdc`

### Skills (from plugins)

- **Firecrawl:** firecrawl SKILL

- **Cloudflare:** 10+ skills (cloudflare, SKILL, durable-objects, wrangler, etc.)

- **Datadog:** datadog-mcp-setup (requires DD_MCP_DOMAIN)

- **Figma:** code-connect-components, create-design-system-rules, implement-design

- **GitLab:** gitlab-ci-author

- **Hugging Face:** hugging-face-trackio, hugging-face-tool-builder, etc.

### Hooks

- No explicit Cursor hooks found (e.g. `cursor.hooks.json`).
- Logs mention `cursor.hooks.log`; likely default or empty.

### Subagents

- No custom subagent definitions found.
- Cursor supports `chat.customAgentInSubagent.enabled` (enabled in settings).

---

## 4. Settings

**Path:** `C:\Users\mello\AppData\Roaming\Cursor\User\settings.json`

| Key | Value |
|-----|-------|
| chat.mcp.gallery.enabled | true |
| security.workspace.trust.untrustedFiles | open |
| chat.agent.maxRequests | 50 |
| chat.tools.global.autoApprove | true |
| chat.customAgentInSubagent.enabled | true |
| terminal.integrated.defaultProfile.windows | kali-linux (WSL) |
| files.autoSave | afterDelay |

---

## 5. Installed Extensions (VSCode-compatible)

- anysphere.cursorpyright
- anysphere.remote-wsl
- bradlc.vscode-tailwindcss
- christian-kohler.npm-intellisense
- dbaeumer.vscode-eslint
- esbenp.prettier-vscode
- google.geminicodeassist
- googlecloudtools.cloudcode
- ms-azuretools.vscode-containers
- ms-azuretools.vscode-docker
- ms-python.debugpy
- ms-python.python
- ms-toolsai.jupyter (+ renderers, cell-tags, slideshow)
- ms-vscode.hexeditor
- ms-vscode.powershell
- prisma.prisma
- rangav.vscode-thunder-client (HTTP/API testing)
- redhat.vscode-yaml
- shd101wyy.markdown-preview-enhanced
- usernamehw.errorlens

---

## 6. Integrations Status

| Integration | Status | Notes |
|-------------|--------|-------|
| GitHub | Partial | vscode.github, vscode.github-authentication in logs. No dedicated GitHub MCP. |
| Slack | Plugin installed | MCP requires OAuth. CLIENT_ID in plugin config. |
| Cloudflare | Plugin installed | Docs, bindings, builds, observability MCPs. OAuth. |
| Browser automation | Yes | cursor-ide-browser (built-in), Bright Data (scraping). |
| Postgres | Missing | No plugin or MCP. |
| Redis | Skills only | No Redis MCP (connection/query). |
| Datadog | Plugin installed | Requires DD_MCP_DOMAIN configuration. |
| Linear | Plugin installed | OAuth. |
| Figma | Plugin installed | HTTP MCP. |

---

## 7. Workspace Structure

- **Slot:** Currently empty or minimal.
- **Backup workspaces:** WSL kali-linux (/home/kali), Slot, others.

---

## 8. Config File Locations (Authoritative)

| Config | Path | Scope |
|--------|------|-------|
| MCP (global) | `C:\Users\mello\.cursor\mcp.json` | User |
| MCP (project) | `<project>/.cursor/mcp.json` | Project |
| Settings | `C:\Users\mello\AppData\Roaming\Cursor\User\settings.json` | User |
| Plugins | `C:\Users\mello\.cursor\plugins\cache\cursor-public\` | User |

---

## 9. Security Notes

- Bright Data API_TOKEN is stored in mcp.json (consider env vars).
- OAuth tokens for Slack, Linear, Cloudflare are managed by Cursor.
- Datadog requires manual DD_MCP_DOMAIN setup.
