# Gitx Architecture

## Overview

Gitx is a monorepo containing a full-stack code repository platform.

## Multi-Agent Development with Orca

Using the Orca Agent Development Environment (ADE), we parallelize development across isolated worktrees:

```
+---------------------------------------------------------+
|                    Orca Workspace                        |
|  +-------------+  +-------------+  +-----------------+  |
|  | worktree/   |  | worktree/   |  | worktree/       |  |
|  |   core      |  |   api       |  |   web           |  |
|  |             |  |             |  |                 |  |
|  | Git backend |  | REST API    |  | React Frontend  |  |
|  | SSH/HTTP    |  | Auth/PR/    |  | UI Components   |  |
|  | Protocol    |  | Issues      |  | Real-time       |  |
|  +------+------+  +------+------+  +--------+--------+  |
|         |                |                   |          |
|         +----------------+-------------------+          |
|                          |                              |
|                    +-----+-----+                         |
|                    |  main   |                         |
|                    | branch  |                         |
|                    +---------+                         |
+---------------------------------------------------------+
```

## Core Components

### 1. Git Backend (src/backend/git)

- Bare repository storage on the filesystem
- SSH Git protocol (via git-shell or a custom implementation)
- HTTP Smart Git protocol (git-upload-pack, git-receive-pack)
- Hook management (pre-receive, post-receive, update)

### 2. API Server (src/backend/api)

- RESTful API conforming to OpenAPI 3.0 specification
- JWT-based authentication and session management
- Repository CRUD operations
- Pull Request workflow (create, review, merge)
- Issue tracking (create, assign, label, close)
- Webhook system for third-party integrations

### 3. Frontend (src/frontend)

- React 19 with TypeScript strict mode
- Vite for fast builds and hot module replacement
- Tailwind CSS for utility-first styling
- Real-time updates via Server-Sent Events (SSE) or WebSocket
- Code viewer with syntax highlighting (PrismJS or Shiki)

### 4. Database Schema

- `users` -- user accounts, SSH public keys, OAuth provider links
- `repositories` -- repository metadata, visibility (public/private), fork relationships
- `pull_requests` -- PRs, review threads, merge status, CI checks
- `issues` -- issues, labels, milestones, assignees
- `organizations` -- teams, member roles, permission groups

## Development Phases

| Phase | Goal | Agent | Status |
|-------|------|-------|--------|
| 1 | Project scaffold, CI/CD, dev environment | `gitx-ops` | In Progress |
| 2 | Git backend, repo storage, protocol | `gitx-core` | Pending |
| 3 | API server, auth, core endpoints | `gitx-api` | Pending |
| 4 | Frontend UI, repository browser | `gitx-web` | Pending |
| 5 | Integration testing, performance tuning, polish | All agents | Pending |
