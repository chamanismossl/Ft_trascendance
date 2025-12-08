.PHONY: all build up dev prod down logs restart clean clean-db clean-volumes clone pull status help

REPOS = Chat_BackEnd Vanilla_FrontEnd Login_BackEnd Notification_BackEnd User_BackEnd Match_BackEnd

BASE_URL = git@github.com:chamanismossl

# Detect architecture and set DOCKER_DEFAULT_PLATFORM so builds target the host arch
UNAME_S := $(shell uname -s)
UNAME_M := $(shell uname -m)

# Determine the platform based on OS and architecture
ifeq ($(UNAME_S),Darwin)
  ifeq ($(UNAME_M),arm64)
    DOCKER_PLATFORM := linux/arm64
  else
    DOCKER_PLATFORM := linux/amd64
  endif
else ifeq ($(UNAME_S),Linux)
  ifeq ($(UNAME_M),x86_64)
    DOCKER_PLATFORM := linux/amd64
  else ifeq ($(UNAME_M),aarch64)
    DOCKER_PLATFORM := linux/arm64
  else
    DOCKER_PLATFORM := 
  endif
else
  DOCKER_PLATFORM :=
endif

# Default target
all: up

# Build all services
build:
	@echo "🔨 Building all services..."
	DOCKER_DEFAULT_PLATFORM=$(DOCKER_PLATFORM) docker-compose build

# Start all services
up:
	@echo "🚀 Starting all services..."
	@echo "📦 Frontend: http://localhost:3000"
	@echo "💬 Chat: http://localhost:5002"
	@echo "🔐 Login: http://localhost:5001"
	@echo "🔔 Notifications: http://localhost:3001"
	@echo "👤 Users: http://localhost:3003"
	@echo "🎮 Matches: http://localhost:3004"
	@echo ""
	DOCKER_DEFAULT_PLATFORM=$(DOCKER_PLATFORM) FRONT_PORT=3000 docker-compose up --build

# Start all services in production mode (detached)
prod:
	@echo "🚀 Starting all services in production mode (detached)..."
	DOCKER_DEFAULT_PLATFORM=$(DOCKER_PLATFORM) NODE_ENV=production FRONT_PORT=3000 docker-compose up --build --detach
	@echo "✅ All services started in background"

# Stop all services
down:
	@echo "🛑 Stopping all services..."
	docker-compose down
	@echo "✅ All services stopped"

# View logs
logs:
	docker-compose logs -f

# View logs for specific service
logs-%:
	docker-compose logs -f $*

# Restart all services
restart: down up

# Show status of all containers
status:
	@echo "📊 Container status:"
	@docker-compose ps
	
rm:
	@echo "🗑️  Removing services directory..."
	rm -rf services
	@echo "✅ Services directory removed"

clone:
	@echo "📥 Cloning all repositories..."
	@mkdir -p services
	@for repo in $(REPOS); do \
		if [ ! -d "services/$$repo" ]; then \
			case $$repo in \
				Chat_BackEnd) BRANCH=dev ;; \
				Login_BackEnd) BRANCH=dev ;; \
				*) BRANCH=main ;; \
			esac; \
			echo "📦 Clonando $$repo desde rama $$BRANCH..."; \
			git clone --branch $$BRANCH --single-branch $(BASE_URL)/$$repo.git services/$$repo; \
		else \
			echo "⏭️  $$repo ya existe, omitiendo..."; \
		fi \
	done
	@echo "✅ All repositories cloned"

pull:
	@echo "🔄 Updating all repositories..."
	@for repo in $(REPOS); do \
		if [ -d "services/$$repo" ]; then \
			echo "📦 Actualizando $$repo..."; \
			cd services/$$repo && git pull && cd -; \
		else \
			echo "⚠️  $$repo no existe, ejecuta 'make clone' primero."; \
		fi \
	done
	@echo "✅ All repositories updated"

# Clean database files
clean-db:
	@echo "🗑️  Cleaning database files..."
	find . -type f -name '*.db' -exec rm -f {} +
	@echo "✅ Database files cleaned"

# Clean Docker volumes
clean-volumes:
	@echo "🗑️  Cleaning Docker volumes..."
	docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@echo "✅ Docker volumes cleaned"

# Full clean: stop containers, remove volumes, clean databases
clean: down clean-db clean-volumes
	@echo "🧹 Full cleanup completed"

# Remove all containers, images, and volumes (nuclear option)
fclean: down
	@echo "💣 Nuclear cleanup: removing all Docker artifacts..."
	docker-compose down -v --rmi all --remove-orphans
	@echo "✅ All Docker artifacts removed"
