# Best MCP Servers & Cursor Plugins (Professional Setup)

Use this as your install list. You already have several; **install** or **enable** the rest as needed.

---

## 1. MCP servers to install (recommended)

### You already have (keep these)
- **filesystem** — multi-root file access
- **github** — repos, PRs, issues
- **fetch** — HTTP fetch (JSON/HTML)
- **cursor-ide-browser** — built-in browser automation (critical for reverse-engineering)

### Bright Data replacement (recommended: Firecrawl)

Bright Data is no longer used (no balance). **Best alternative:**

| Option | Best for | Cost | MCP / Setup |
|--------|-----------|------|-------------|
| **Firecrawl** | Scraping, crawl, search, LLM-ready output; full-page/site. | **Free tier** (no card); then from ~$16/mo. | Add to `mcp.json` (see below) or install **Firecrawl** plugin. |
| **ScraperAPI** | General scraping, JS rendering, proxy rotation, CAPTCHA. | From $49/mo; has trial credits. | No official MCP; use via `fetch` or custom script. |
| **Zyte** | Enterprise, tough sites, high success rate. | Paid. | API via fetch or custom. |
| **cursor-ide-browser + fetch** | No extra cost: browse + capture HTTP. | Free. | Already available; good for HAR and manual flows. |

**Firecrawl MCP config** — add to `C:\Users\mello\.cursor\mcp.json` under `mcpServers`:

```json
"firecrawl": {
  "command": "npx",
  "args": ["-y", "firecrawl-mcp"],
  "env": {
    "FIRECRAWL_API_KEY": "your_api_key_here"
  }
}
```

Get a free API key: https://www.firecrawl.dev/app/api-keys (no credit card). You can also install the **Firecrawl** plugin from Cursor Marketplace for one-click setup.

### Add these for a professional setup

| MCP Server | Why | How to install |
|------------|-----|----------------|
| **Firecrawl** | **Primary scraping/crawl replacement for Bright Data.** Web scrape, docs, research, full-page/site. | Add to `mcp.json` (snippet above) or install Firecrawl plugin. |
| **GitLab** | Issues, MRs, CI — you use GitLab (melloenfrwrk-group). | Cursor: install **GitLab** plugin from Marketplace, then connect in MCP settings. |
| **Postgres (Neon)** | DB queries from the editor. | Cursor: install **Neon Postgres** plugin, connect via OAuth. |
| **Brave Search** or **Exa** | Real-time search for APIs/docs (optional). | Add to `mcp.json` with `npx -y @modelcontextprotocol/server-brave-search` (or Exa) + API key. |
| **Shell** | Run terminal commands from AI (optional). | `npx -y @modelcontextprotocol/server-shell` in `mcp.json` (use with care; scope to safe dirs). |

### Optional for reverse-engineering / HAR
- **Chrome DevTools MCP** — if you need deeper DevTools than cursor-ide-browser (screenshots, DOM, network).
- **Puppeteer/Playwright MCP** — if you need scripted browser flows; often covered by Firecrawl + cursor-ide-browser.

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
- **Firecrawl** — scrape, crawl, search (replaces Bright Data).
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
