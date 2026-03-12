# On PR: Full Validation

## Proposal

Run full validation (tests, lint, build, security) when PR is opened.

## Implementation

**GitHub Actions** (`.github/workflows/pr.yml`):

```yaml
name: PR Validation
on:
  pull_request:
    branches: [main, develop]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
      - run: npm ci
      - run: npm run lint
      - run: npm run test
      - run: npm run build
      # - run: npx snyk test (if Snyk configured)
```

**GitLab:** Use `.gitlab-ci.yml` with equivalent pipeline.

## Scope

- All PRs to main/develop
