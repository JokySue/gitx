#!/usr/bin/env bash
# setup.sh -- One-command development environment bootstrap for Gitx
# Usage: ./scripts/setup.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "[Gitx Setup] Bootstrapping development environment..."

# Check prerequisites
echo "[Gitx Setup] Checking prerequisites..."
command -v docker >/dev/null 2>&1 || { echo "Error: Docker is required but not installed."; exit 1; }
command -v docker-compose >/dev/null 2>&1 || { echo "Error: Docker Compose is required but not installed."; exit 1; }

# Start infrastructure services
echo "[Gitx Setup] Starting Postgres and Redis..."
cd "$PROJECT_ROOT"
docker-compose up -d db redis

# Wait for Postgres to be ready
echo "[Gitx Setup] Waiting for Postgres to accept connections..."
until docker-compose exec -T db pg_isready -U gitx >/dev/null 2>&1; do
    sleep 1
done
echo "[Gitx Setup] Postgres is ready."

# Create placeholder directories if they do not exist
echo "[Gitx Setup] Ensuring source directories exist..."
mkdir -p src/backend src/frontend src/shared src/cli

echo "[Gitx Setup] Done. Next steps:"
echo "  1. cd src/backend && go run ."
echo "  2. cd src/frontend && npm install && npm run dev"
