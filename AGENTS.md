# Multi-Agent Orchestration

This project uses Cursor's subagent system. Custom agents live in `.cursor/agents/`. Delegate to them explicitly or let Agent route automatically based on task type.

## Available Subagents

| Subagent | Invoke with | When to use |
|----------|-------------|-------------|
| pipeline-orchestrator | `/pipeline-orchestrator` | Full reverse-to-code pipeline (browser → blueprint → code → tests) |
| reverse-engineering | `/reverse-engineering` | Browser automation, network capture, endpoint extraction |
| architect | `/architect` | System design, API contracts, microservice blueprint |
| backend-engineer | `/backend-engineer` | APIs, DB, services, code skeleton |
| frontend-engineer | `/frontend-engineer` | UI, components, styling |
| test-engineer | `/test-engineer` | Tests, coverage, E2E, fix failures |
| security-reviewer | `/security-reviewer` | Auth, payments, vulnerability review |
| monitoring | `/monitoring` | Dashboards, alerts, observability |
| verifier | `/verifier` | Validate completed work, run tests, confirm implementations |

## Reverse-to-Code Pipeline

End-to-end flow from browser to production-ready service:

```
Browser Automation MCP → Network/API Capture → Endpoint Extraction
      ↓
Microservice Blueprint (architect)
      ↓
Code Skeleton (backend-engineer)
      ↓
Automated Tests (test-engineer)
```

**Run full pipeline:** `/pipeline-orchestrator` or "Run the reverse pipeline for [URL]"

See `docs/cursor/pipeline-reverse-to-code.md` for details.

## Orchestration Flow

1. **Architect first** — For new features or services, route to Architect before implementation.
2. **Backend/Frontend** — Implement based on spec; hand off to Test when done.
3. **Test Engineer** — Add tests; fix failures; report gaps.
4. **Security Reviewer** — Review auth, payment, API key code before merge.
5. **Monitoring** — Set up dashboards/alerts after new service deployment.
6. **Verifier** — Use after tasks are marked done to confirm they actually work.

## Parallel Execution

Launch multiple subagents concurrently when appropriate:

- "Review the API changes and update the documentation in parallel"
- "Add tests for the backend and frontend in parallel"

## GitLab Duo

GitLab MCP is enabled. Use it for issues, MRs, and CI context when delegating work.
