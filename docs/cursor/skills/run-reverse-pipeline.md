# run-reverse-pipeline Skill

## Purpose

Run the full reverse-to-code pipeline: Browser → Network Capture → Endpoint Extraction → Blueprint → Code Skeleton → Tests.

## When to Use

- "Run the reverse pipeline for [URL]"
- "Reverse engineer and build a service for [target]"
- "Extract the API from [URL] and implement it"
- "Browser → network → blueprint → code → tests"

## Pipeline

1. **reverse-engineering** — Browser automation (cursor-ide-browser), network capture, endpoint extraction
2. **architect** — Microservice blueprint from findings
3. **backend-engineer** — Code skeleton from blueprint
4. **test-engineer** — Automated tests
5. **verifier** — Confirm implementation works

## Orchestration

Delegate to `/pipeline-orchestrator` for full flow, or run agents sequentially:

- `/reverse-engineering` → extract endpoints
- `/architect` → create blueprint
- `/backend-engineer` → implement
- `/test-engineer` → add tests
- `/verifier` → validate

## References

- `docs/cursor/pipeline-reverse-to-code.md`
- `.cursor/agents/pipeline-orchestrator.md`
