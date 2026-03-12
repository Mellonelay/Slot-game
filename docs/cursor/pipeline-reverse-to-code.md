# Reverse-to-Code Pipeline

End-to-end pipeline from browser automation to production-ready microservice. Each step is owned by a Cursor subagent.

## Pipeline Flow

```
Browser Automation MCP (cursor-ide-browser)
      ↓
Network/API Capture (HAR, request logs)
      ↓
Endpoint Extraction (structured JSON/markdown)
      ↓
Microservice Blueprint (Architect)
      ↓
Code Skeleton (Backend Engineer)
      ↓
Automated Tests (Test Engineer)
```

## Agent Mapping

| Step | Agent | Tools | Output |
|------|-------|-------|--------|
| 1. Browser Automation | reverse-engineering | cursor-ide-browser | Session, DOM snapshots |
| 2. Network/API Capture | reverse-engineering | cursor-ide-browser (DevTools), user-fetch | HAR, request/response logs |
| 3. Endpoint Extraction | reverse-engineering | Firecrawl, Bright Data | `endpoints.json`, payloads |
| 4. Microservice Blueprint | architect | Filesystem | API spec, data model, service boundaries |
| 5. Code Skeleton | backend-engineer | Filesystem, Prisma | `generated_services/<name>/` |
| 6. Automated Tests | test-engineer | Filesystem, cursor-ide-browser | Unit, integration, E2E |

## How to Run

### Full pipeline (orchestrated)

> Run the reverse-to-code pipeline for [URL or target]

Agent delegates in sequence:
1. `/reverse-engineering` — Pipeline steps 1–3 (browser automation → network capture → endpoint extraction)
2. `/architect` — Pipeline step 4 (microservice blueprint)
3. `/backend-engineer` — Pipeline step 5 (code skeleton)
4. `/test-engineer` — Pipeline step 6 (automated tests)
5. `/verifier` — Post-pipeline validation (confirm implementation works)

### Step-by-step

- "Reverse engineer the API from https://example.com" → reverse-engineering
- "Create a microservice blueprint from the extracted endpoints" → architect
- "Implement the service skeleton from the blueprint" → backend-engineer
- "Add tests for the new service" → test-engineer

## Output Locations

| Artifact | Path |
|----------|------|
| Endpoint findings | `docs/reverse_pipeline/<target>/endpoints.json` |
| Blueprint/spec | `docs/reverse_pipeline/<target>/blueprint.md` |
| Code skeleton | `generated_services/<service-name>/` |
| Tests | `generated_services/<service-name>/__tests__/` |

## References

- `.cursor/agents/reverse-engineering.md`
- `.cursor/agents/architect.md`
- `.cursor/agents/backend-engineer.md`
- `.cursor/agents/test-engineer.md`
- `docs/cursor/skills/reverse-engineer-flow.md`
