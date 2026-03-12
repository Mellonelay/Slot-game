# Rules, Skills, and Hooks

## Rules (Recommended)

Place in `.cursor/rules/` or `docs/cursor/rules/` (reference).

| Rule | File | When to Apply |
|------|------|---------------|
| Architecture before implementation | `architecture-first.mdc` | Before any new service/feature |
| Tests required for backend | `backend-tests.mdc` | Backend changes |
| Security review for auth/payment/API | `security-review.mdc` | Auth, payment, API key code |
| Observability for new services | `observability-required.mdc` | New services, endpoints |

## Skills (Recommended)

Place in `.cursor/skills/` or `C:\Users\mello\.cursor\skills-cursor\`.

| Skill | Purpose |
|-------|---------|
| implement-service | Backend service scaffolding, DB, API |
| add-tests | Unit, integration, E2E test generation |
| run-security-review | Snyk, auth checks, secret scanning |
| reverse-engineer-flow | Firecrawl/Bright Data flow extraction |
| generate-monitoring-config | Datadog/Cloudflare dashboard/alerts |

## Hooks (Recommended)

Cursor hooks run at specific events. Configure via Cursor settings or `.cursor/hooks/`.

| Hook | Event | Action |
|------|-------|--------|
| on-save | File save | Lint (ESLint, Prettier) |
| on-commit | Git commit | Run tests, security checks |
| on-pr | PR opened | Full validation, CI |

**Note:** Cursor's native hook system may vary. Use `cursor.hooks` or equivalent if available. Fallback: Git hooks (`.git/hooks/pre-commit`) for commit-time checks.

## Plugin-Provided Rules/Skills (Already Active)

- **Firecrawl:** install rule, firecrawl skill
- **Cloudflare:** workers rule, 10+ skills
- **Redis:** 30+ rules
- **GitLab:** gitlab-workflow rule, gitlab-ci-author skill
- **Datadog:** datadog-mcp-setup skill
- **Figma:** implement-design, code-connect-components, create-design-system-rules
