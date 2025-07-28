.PHONY: help build up down logs clean dev prod

# Default target
help: ## Show this help message
	@echo "CSS Carousel Showcase - Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

build: ## Build Docker containers
	docker-compose -f docker-compose.dev.yml build

up: ## Start development environment
	docker-compose -f docker-compose.dev.yml up

dev: ## Start development environment (detached)
	docker-compose -f docker-compose.dev.yml up -d

prod: ## Start production environment
	docker-compose up -d

down: ## Stop all containers
	docker-compose -f docker-compose.dev.yml down
	docker-compose down

logs: ## View container logs
	docker-compose -f docker-compose.dev.yml logs -f

clean: ## Remove containers and images
	docker-compose -f docker-compose.dev.yml down --rmi all --volumes