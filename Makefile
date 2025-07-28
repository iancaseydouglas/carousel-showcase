# Simple Carousel Showcase Makefile
# Basic Docker Compose operations only

# Project configuration
COMPOSE_FILE := docker-compose.yml
COMPOSE_FILE_DEV := docker-compose.dev.yml

# Colors for output
GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
RED := \033[0;31m
NC := \033[0m # No Color

.DEFAULT_GOAL := help

##@ Development Commands

.PHONY: dev
dev: ## Start development environment
	@echo -e "$(GREEN)Starting development environment...$(NC)"
	docker-compose -f $(COMPOSE_FILE_DEV) up --build

.PHONY: dev-bg
dev-bg: ## Start development environment in background
	@echo -e "$(GREEN)Starting development environment in background...$(NC)"
	docker-compose -f $(COMPOSE_FILE_DEV) up --build -d

.PHONY: dev-stop
dev-stop: ## Stop development environment
	@echo -e "$(YELLOW)Stopping development environment...$(NC)"
	docker-compose -f $(COMPOSE_FILE_DEV) down

.PHONY: dev-logs
dev-logs: ## View development logs
	docker-compose -f $(COMPOSE_FILE_DEV) logs -f

##@ Production Commands

.PHONY: prod
prod: ## Start production environment
	@echo -e "$(GREEN)Starting production environment...$(NC)"
	docker-compose -f $(COMPOSE_FILE) up --build -d

.PHONY: prod-stop
prod-stop: ## Stop production environment
	@echo -e "$(YELLOW)Stopping production environment...$(NC)"
	docker-compose -f $(COMPOSE_FILE) down

.PHONY: prod-logs
prod-logs: ## View production logs
	docker-compose -f $(COMPOSE_FILE) logs -f

##@ Build Commands

.PHONY: build
build: ## Build all images
	@echo -e "$(BLUE)Building all images...$(NC)"
	docker-compose -f $(COMPOSE_FILE) build
	docker-compose -f $(COMPOSE_FILE_DEV) build

.PHONY: build-dev
build-dev: ## Build development images
	docker-compose -f $(COMPOSE_FILE_DEV) build

.PHONY: build-prod
build-prod: ## Build production images
	docker-compose -f $(COMPOSE_FILE) build

.PHONY: build-no-cache
build-no-cache: ## Build all images without cache
	@echo -e "$(BLUE)Building all images without cache...$(NC)"
	docker-compose -f $(COMPOSE_FILE) build --no-cache
	docker-compose -f $(COMPOSE_FILE_DEV) build --no-cache

##@ Cleanup Commands

.PHONY: stop
stop: ## Stop all environments
	@echo -e "$(YELLOW)Stopping all environments...$(NC)"
	docker-compose -f $(COMPOSE_FILE) down
	docker-compose -f $(COMPOSE_FILE_DEV) down

.PHONY: clean
clean: ## Stop and remove containers, networks
	@echo -e "$(YELLOW)Cleaning up containers and networks...$(NC)"
	docker-compose -f $(COMPOSE_FILE) down --remove-orphans
	docker-compose -f $(COMPOSE_FILE_DEV) down --remove-orphans

.PHONY: purge
purge: ## Remove everything including volumes and images
	@echo -e "$(RED)Purging all containers, networks, volumes, and images...$(NC)"
	docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans --rmi all
	docker-compose -f $(COMPOSE_FILE_DEV) down --volumes --remove-orphans --rmi all

.PHONY: prune
prune: ## Remove unused Docker resources
	@echo -e "$(YELLOW)Removing unused Docker resources...$(NC)"
	docker system prune -f

##@ Info Commands

.PHONY: status
status: ## Show container status
	@echo -e "$(BLUE)=== Development Status ===$(NC)"
	@docker-compose -f $(COMPOSE_FILE_DEV) ps 2>/dev/null || echo "Development not running"
	@echo -e "$(BLUE)=== Production Status ===$(NC)"
	@docker-compose -f $(COMPOSE_FILE) ps 2>/dev/null || echo "Production not running"

.PHONY: logs
logs: ## View logs (dev or prod)
	@echo -e "$(BLUE)Choose environment:$(NC)"
	@echo "1) Development"
	@echo "2) Production"
	@read -p "Enter choice [1-2]: " choice; \
	case $$choice in \
		1) docker-compose -f $(COMPOSE_FILE_DEV) logs -f ;; \
		2) docker-compose -f $(COMPOSE_FILE) logs -f ;; \
		*) echo -e "$(RED)Invalid choice$(NC)" ;; \
	esac

.PHONY: urls
urls: ## Show application URLs
	@echo -e "$(BLUE)Application URLs:$(NC)"
	@echo -e "Development: http://localhost:3000"
	@echo -e "Production:  http://localhost"

.PHONY: help
help: ## Display this help
	@echo -e "$(BLUE)Carousel Showcase Makefile$(NC)"
	@echo -e "=========================="
	@echo
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@echo
	@echo -e "$(YELLOW)Quick Start:$(NC)"
	@echo -e "  make dev      # Start development"
	@echo -e "  make prod     # Start production"
	@echo -e "  make stop     # Stop everything"
	@echo -e "  make clean    # Clean up"