# Contributing to Gitx

## Multi-Agent Workflow

This project uses the **Orca Agent Development Environment (ADE)** for parallel development.

### Starting a New Feature

1. **Create a worktree** in Orca:
   ```
   /orchestrate feature/user-auth
   ```

2. **Assign an agent** to the worktree:
   - The agent receives an isolated copy of the codebase
   - It works independently without affecting the `main` branch

3. **Develop and test** inside the worktree

4. **Create a pull request** when ready:
   ```
   /pr create --title "feat: user authentication"
   ```

### Agent Responsibilities

| Agent Prefix | Scope |
|-------------|-------|
| `gitx-core` | Git operations, storage, protocol implementation |
| `gitx-api` | Backend API, database schema, business logic |
| `gitx-web` | Frontend, UI/UX, client-side state management |
| `gitx-ops` | Infrastructure, Docker, CI/CD, documentation |

### Commit Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add OAuth2 login support
fix: resolve race condition in PR merge logic
docs: update API endpoint documentation
refactor: simplify repository permission check
test: add integration tests for git push hook
chore: update dependency versions
```

### Code Style

- **Go**: `gofmt`, `golint`, `go vet`
- **TypeScript**: ESLint + Prettier
- **Documentation**: American English, clear and concise
