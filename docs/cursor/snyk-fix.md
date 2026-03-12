# Snyk MCP Plugin — Fix for Windows ARM64

## Root Cause

**Windows ARM64 is not supported by Snyk CLI.** Your Surface Laptop 7 (ARM64) triggers a "degraded" fallback that outputs text instead of JSON, causing:

- `Unexpected token 'U', "Unknown co"... is not valid JSON`
- `Unexpected token 'R', "Run \`snyk "... is not valid JSON`
- `You are currently running a degraded version of the Snyk CLI`

## Workarounds

### 1. Use Snyk via Docker (recommended)

Run Snyk in an x64 container:

```powershell
docker run --rm -v "${PWD}:/project" -e SNYK_TOKEN=<your-token> snyk/snyk:node test
```

Authenticate first: https://app.snyk.io/account → API Token

### 2. Use Snyk in CI (GitHub Actions)

Add to `.github/workflows/security.yml`:

```yaml
- uses: snyk/actions/node@master
  env:
    SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
  with:
    command: test
```

### 3. Disable Snyk Plugin Temporarily

If the plugin errors are noisy: Cursor Settings → Plugins → Disable "Snyk Secure Development".

### 4. Use Snyk Web UI

Run scans at https://app.snyk.io/ by connecting your repo.

## Status

- **Snyk CLI:** Installed globally (`npm install -g snyk`) ✓
- **Platform:** Windows ARM64 — not supported by Snyk
- **Plugin:** Will keep erroring until Snyk adds Windows ARM64 support

## Reference

- https://docs.snyk.io/developer-tools/snyk-cli/install-or-update-the-snyk-cli
- https://support.snyk.io/
