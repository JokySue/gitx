# ADR 001: Project Initialization

## Status

Accepted

## Context

We need to build a self-hosted code repository platform similar to GitHub. The project must be:

- Open source under the MIT license
- Developed using a multi-agent parallel workflow via Orca ADE
- Accessible to global contributors
- Well-documented in both English and Chinese

## Decision

1. **Monorepo structure**: All components (backend, frontend, CLI, shared types) live in a single repository for atomic changes and simplified CI/CD.
2. **MIT License**: Maximizes adoption and allows commercial use.
3. **Orca ADE multi-agent workflow**: Four dedicated agents (`gitx-core`, `gitx-api`, `gitx-web`, `gitx-ops`) work in parallel worktrees.
4. **Bilingual documentation**: Every English document has a corresponding Chinese translation (`.zh.md`) to support the Chinese-speaking project lead and future Chinese contributors.
5. **Tech stack**: Go/Rust backend, React 19 frontend, PostgreSQL, Redis, Docker.

## Consequences

- Positive: Clear separation of concerns, parallel development, global accessibility.
- Negative: Monorepo requires careful dependency management; bilingual docs double maintenance overhead.

## Related Documents

- [ARCHITECTURE.md](../ARCHITECTURE.md)
- [CONTRIBUTING.md](../CONTRIBUTING.md)
