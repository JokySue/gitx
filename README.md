# Gitx

> Gitx - A lightweight, self-hosted code repository platform inspired by GitHub.  
> Gitx is an AI-native code repository! It's completely open-source and free for everyone!
> Built with modern architecture and a multi-agent development workflow.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Vision

Gitx is a **simple, fast, and self-hostable** alternative to GitHub for teams that want full control over their source code. It focuses on doing the core things really well:

- Git repository hosting (create, clone, push, pull)
- Pull requests and code review
- Issue tracking
- Team collaboration
- Fine-grained access control

## Architecture (Multi-Agent Development)

This project is developed using the **Orca Agent Development Environment (ADE)** with a parallel multi-agent workflow:

| Agent | Responsibility | Worktree |
|-------|---------------|----------|
| `gitx-core` | Git backend, repository storage, SSH/HTTP Git protocol | `worktrees/core` |
| `gitx-api` | RESTful API, authentication, business logic | `worktrees/api` |
| `gitx-web` | Frontend UI, React SPA, real-time updates | `worktrees/web` |
| `gitx-ops` | DevOps, CI/CD pipeline, Docker, deployment | `worktrees/ops` |

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Backend** | Go (Gin or Echo) or Rust (Axum or Actix) |
| **Frontend** | React 19 + TypeScript + Vite |
| **Database** | PostgreSQL 16+ |
| **Cache** | Redis |
| **Git Storage** | Bare Git repositories + libgit2 |
| **Container** | Docker + Docker Compose |

## Project Structure

```
gitx/
├── README.md               # This file (English)
├── README.zh.md            # Chinese translation
├── LICENSE                 # MIT License
├── .gitignore              # Ignore rules
├── Makefile                # Common development tasks
├── docker-compose.yml      # Local development stack
├── docs/                   # Documentation
│   ├── ARCHITECTURE.md
│   ├── ARCHITECTURE.zh.md
│   ├── CONTRIBUTING.md
│   ├── CONTRIBUTING.zh.md
│   └── ADRs/               # Architecture Decision Records
├── .github/workflows/      # CI/CD pipelines
├── scripts/                # Utility scripts
└── src/                    # Source code
    ├── backend/            # API server and Git protocol handler
    ├── frontend/           # Web UI
    ├── cli/                # Command-line tool
    └── shared/             # Shared types and protobuf definitions
```

## Quick Start (Local Development)

```bash
# 1. Clone the repo
git clone https://github.com/YOUR_USERNAME/gitx.git
cd gitx

# 2. Start dependencies (Postgres, Redis)
docker-compose up -d db redis

# 3. Run the backend
cd src/backend
go run .

# 4. Run the frontend (in another terminal)
cd src/frontend
npm install
npm run dev
```

## Contributing

We use the **Orca multi-agent workflow** for development. Each major feature is built by a dedicated agent in its own isolated worktree, then merged via pull request.

See [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md) for details.

## License

[MIT](LICENSE) -- Free for personal and commercial use.
