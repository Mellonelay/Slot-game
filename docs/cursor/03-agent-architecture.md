# Multi-Agent Architecture

## Overview

This workspace is configured for a professional multi-agent engineering workflow. Each agent has a defined purpose, responsibilities, and handoff rules.

## Agent Roster

| Agent | Purpose | Primary Tools |
|-------|---------|---------------|
| Architect | System design, tech decisions, API contracts | Filesystem, Linear, Figma |
| Backend Engineer | Services, APIs, DB, business logic | Filesystem, Postgres (Neon), Redis, GitHub |
| Frontend Engineer | UI, components, styling | Filesystem, Figma, cursor-ide-browser |
| Test Engineer | Tests, coverage, E2E | Filesystem, cursor-ide-browser, Thunder Client |
| Security Reviewer | Auth, payments, vuln checks | Snyk, Datadog, Filesystem |
| Reverse Engineering Agent | Flow analysis, scraping, protocol discovery | Firecrawl, Bright Data, cursor-ide-browser |
| Monitoring Agent | Observability, alerts, dashboards | Datadog, Cloudflare observability |

## Workflow Triggers

| Trigger | Primary Agent | Handoff To |
|---------|--------------|------------|
| "Design the architecture for X" | Architect | Backend/Frontend when spec ready |
| "Implement API endpoint X" | Backend Engineer | Test Engineer when done |
| "Build the login UI" | Frontend Engineer | Test Engineer when done |
| "Add tests for X" | Test Engineer | - |
| "Review auth/payment code" | Security Reviewer | Backend if issues found |
| "Reverse engineer flow for URL X" | Reverse Engineering Agent | Backend/Frontend for implementation |
| "Set up monitoring for service X" | Monitoring Agent | - |

## Handoff Rules

1. **Architect → Backend/Frontend:** Provide spec (API contract, data model, component hierarchy) before implementation.
2. **Backend/Frontend → Test Engineer:** All new code requires tests; handoff with file paths and expected behavior.
3. **Any → Security Reviewer:** Auth, payment, API key handling, or user data code must be reviewed.
4. **Backend → Monitoring Agent:** New services require dashboards/alerts.
5. **Reverse Engineering → Backend/Frontend:** Provide structured findings (endpoints, payloads, flows) for implementation.

## Subagent Configuration

Custom subagents are defined in `.cursor/agents/` (YAML frontmatter + prompt). Agent delegates automatically or via `/name` (e.g. `/architect`, `/backend-engineer`).

Built-in subagents (mcp_task):
- `subagent_type: "explore"` — Codebase exploration
- `subagent_type: "shell"` — Command execution, git, npm
- `subagent_type: "generalPurpose"` — Research, multi-step tasks

Custom subagents: pipeline-orchestrator, reverse-engineering, architect, backend-engineer, frontend-engineer, test-engineer, security-reviewer, monitoring, verifier. See `AGENTS.md` for orchestration flow. Full reverse-to-code pipeline: `docs/cursor/pipeline-reverse-to-code.md`.
