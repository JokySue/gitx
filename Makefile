.PHONY: dev build test lint clean migrate-up migrate-down

# Default target: start the development environment
all: dev

# Start the development environment (Postgres + Redis)
dev:
	docker-compose up -d db redis
	@echo "Dependencies are up. Run the backend and frontend separately."

# Build all components (backend binary + frontend bundle)
build:
	cd src/backend && go build -o ../../bin/gitx-server ./cmd/server
	cd src/frontend && npm run build

# Run all tests across the monorepo
test:
	cd src/backend && go test ./...
	cd src/frontend && npm test

# Lint all code (Go + TypeScript)
lint:
	cd src/backend && golangci-lint run
	cd src/frontend && npm run lint

# Clean build artifacts and Docker volumes
clean:
	rm -rf bin/ dist/ build/
	docker-compose down -v

# Run database migrations (up)
migrate-up:
	cd src/backend && migrate -path migrations -database "postgres://gitx:gitx@localhost:5432/gitx?sslmode=disable" up

# Rollback database migrations (down)
migrate-down:
	cd src/backend && migrate -path migrations -database "postgres://gitx:gitx@localhost:5432/gitx?sslmode=disable" down
