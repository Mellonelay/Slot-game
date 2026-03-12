# On Commit: Test + Security Checks

## Proposal

Run tests and security checks before allowing commit.

## Implementation

**Git pre-commit hook** (`.git/hooks/pre-commit`):

```bash
#!/bin/sh
npm run test
npm run lint
# Optional: npx snyk test
```

Make executable: `chmod +x .git/hooks/pre-commit`

**Alternative:** Use Husky + lint-staged:

```bash
npx husky init
npx husky add .husky/pre-commit "npm run test && npx lint-staged"
```

## Scope

- All commits
