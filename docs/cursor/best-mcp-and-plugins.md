# Best MCP Servers & Cursor Plugins (Professional Setup)

Use this as your install list. You already have several; **install** or **enable** the rest as needed.

---

## 1. MCP servers to install (recommended)

### You already have (keep these)
- **filesystem** — multi-root file access
- **Bright Data** — scraping, browser, ecommerce
- **github** — repos, PRs, issues
- **fetch** — HTTP fetch (JSON/HTML)
- **cursor-ide-browser** — built-in browser automation (critical for reverse-engineering)

### Add these for a professional setup

| MCP Server | Why | How to install |
|------------|-----|----------------|
| **GitLab** | Issues, MRs, CI — you use GitLab (melloenfrwrk-group). | Cursor: install **GitLab** plugin from Marketplace, then connect in MCP settings. |
| **Firecrawl** | Web scrape, docs, research; better than generic fetch for full-page/site. | Add to `mcp.json` or install Firecrawl plugin if available. |
| **Postgres (Neon)** | DB queries from the editor. | Cursor: install **Neon Postgres** plugin, connect via OAuth. |
| **Brave Search** or **Exa** | Real-time search for APIs/docs (optional). | Add to `mcp.json` with `npx -y @modelcontextprotocol/server-brave-search` (or Exa) + API key. |
| **Shell** | Run terminal commands from AI (optional). | `npx -y @modelcontextprotocol/server-shell` in `mcp.json` (use with care; scope to safe dirs). |

### Optional for reverse-engineering / HAR
- **Chrome DevTools MCP** — if you need deeper DevTools than cursor-ide-browser (screenshots, DOM, network).
- **Puppeteer/Playwright MCP** — if you need scripted browser flows; often covered by Bright Data + cursor-ide-browser.

---

## 2. Cursor plugins to install (Marketplace)

Open **Cursor → Settings → Plugins / Extensions** and install:

| Plugin | Use |
|--------|-----|
| **GitLab** | MRs, issues, CI — required for melloenfrwrk-project workflow. |
| **Cloudflare** | Workers, docs, bindings, builds, observability. |
| **Figma** | Design-to-code, specs, screenshots. |
| **Linear** | Issues and tasks (if your team uses Linear). |
| **Slack** | Search conversations for context. |
| **Neon Postgres** | Query Postgres from the editor. |
| **Datadog** | Logs, metrics, traces (set `domain` in plugin mcp.json). |
| **Hugging Face** | Models, datasets, Spaces (if you do ML). |
| **Firecrawl** | Web scraping and research (if available as plugin). |

---

## 3. Minimal “professional” set

If you want the smallest set that still feels professional:

1. **MCP:** filesystem, GitHub, fetch, **GitLab (plugin)**, **cursor-ide-browser**, **Neon (plugin)**.
2. **Plugins:** **GitLab**, **Neon Postgres**, **Cloudflare**, **Figma** (if you use designs).

For **reverse-engineering (A80444)** specifically:

- **cursor-ide-browser** — navigate, snapshot, interact.
- **Bright Data** — scraping/browser when needed.
- **fetch** — capture or replay HTTP.
- **Filesystem** — save HAR/raw/normalized/screenshots under `reverse_engineering/`.
- **GitLab** — link evidence to issues/MRs.

---

## 4. Where to install

- **Global MCP config:** `C:\Users\mello\.cursor\mcp.json` (add stdio MCPs here).
- **Project MCP:** `<workspace>\.cursor\mcp.json` (overrides/extends for that project).
- **Plugins:** Cursor Settings → Plugins / Extensions → search by name → Install.
- **OAuth (GitLab, Figma, Cloudflare, etc.):** After installing plugin, open MCP section and click Connect/Authorize.

---

## 5. After installing

1. **Reload Cursor:** `Ctrl+Shift+P` → “Developer: Reload Window”.
2. **Check MCP:** Settings → MCP — all servers should show as connected (or prompt for OAuth).
3. **Datadog:** If you use it, set `domain` (e.g. `us1`) in the Datadog plugin’s `mcp.json` as in `mcp-server-fixes.md`.

---

## 6. Quick reference: add a new stdio MCP

Edit `C:\Users\mello\.cursor\mcp.json` under `mcpServers`:

```json
"server-name": {
  "command": "npx",
  "args": ["-y", "package-name"],
  "env": {
    "API_KEY": "your-key-if-needed"
  }
}
```

Use forward slashes in paths. Reload Cursor after changes.
