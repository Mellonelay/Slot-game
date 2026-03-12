# On Save: Lint

## Proposal

Run ESLint and Prettier on file save.

## Implementation

- **Cursor:** Check if Cursor supports `editor.codeActionsOnSave` with ESLint/Prettier.
- **VSCode:** Add to `settings.json`:

```json
{
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": "explicit"
  }
}
```

## Scope

- `.ts`, `.tsx`, `.js`, `.jsx` files
