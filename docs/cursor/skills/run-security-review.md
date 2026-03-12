# run-security-review Skill

## Purpose

Run security checks on code, especially auth, payment, and API handling.

## When to Use

- "Security review for X"
- "Audit the auth flow"
- "Check for vulnerabilities"

## Steps

1. Use Snyk plugin to scan for vulnerabilities.
2. Check for hardcoded secrets (grep, manual review).
3. Validate auth and authorization logic.
4. Document findings and remediation steps.

## References

- Security Reviewer agent
- security-review rule
