# Carousel Showcase

## Project Overview

This is a complete Docker Compose setup for a carousel showcase website featuring three different CSS carousel implementations. The architecture uses Nginx as a reverse proxy with a static website container, optimized for both development and production environments.

## Architecture

- **Nginx Reverse Proxy**: Load balancer and SSL termination
- **Static Website Container**: Serves HTML/CSS/JS files  
- **Development Environment**: Hot reload and live development
- **Production Environment**: Performance optimized with caching

## Project Structure

```
carousel-showcase/
├── docker-compose.yml              # Production configuration
├── docker-compose.dev.yml          # Development configuration
├── README.md                       # Setup documentation
├── nginx/
│   ├── nginx.conf                  # Main Nginx configuration
│   ├── sites-available/
│   │   └── default.conf           # Site-specific configuration
│   └── ssl/                       # SSL certificates (production)
├── static-site/
│   ├── Dockerfile                 # Static site container
│   ├── Dockerfile.dev             # Development container
│   └── src/
│       ├── index.html             # Main landing page
│       ├── scroll-snap.html       # CSS Scroll Snap showcase
│       ├── radio-button.html      # Radio Button carousel
│       ├── grid-flexbox.html      # Grid/Flexbox carousel
│       ├── assets/
│       │   ├── css/
│       │   │   ├── main.css       # Global styles
│       │   │   ├── scroll-snap.css
│       │   │   ├── radio-button.css
│       │   │   └── grid-flexbox.css
│       │   ├── js/
│       │   │   ├── main.js        # Global JavaScript
│       │   │   └── grid-carousel.js
│       │   └── images/            # Sample images
│       └── components/            # Reusable components
└── docs/
    └── SETUP.md                   # Detailed setup guide
```

## Setup Instructions

### Quick Start (Development)
```bash
# Clone or create the project structure
mkdir carousel-showcase && cd carousel-showcase

# Start development environment
docker-compose -f docker-compose.dev.yml up --build

# Access the site at http://localhost:3000
```

### Production Deployment
```bash
# Build and start production environment
docker-compose up --build -d

# Access the site at http://localhost
```

### Development Workflow
```bash
# Development with hot reload
docker-compose -f docker-compose.dev.yml up

# View logs
docker-compose -f docker-compose.dev.yml logs -f

# Stop services
docker-compose -f docker-compose.dev.yml down

# Rebuild after major changes
docker-compose -f docker-compose.dev.yml up --build
```

## Key Features Implemented

### 🚀 **Performance Optimizations**
- Nginx reverse proxy with caching
- Gzip compression enabled
- Static asset optimization
- Resource limits and health checks
- Core Web Vitals optimization

### 🔒 **Security Features**
- Security headers implementation
- Rate limiting configuration
- Non-root container users
- Read-only file systems where appropriate
- SSL/TLS ready configuration

### ♿ **Accessibility Compliance**
- WCAG 2.1 AA compliant
- Semantic HTML structure
- Keyboard navigation support
- Screen reader optimization
- Focus management
- Reduced motion support

### 📱 **Mobile-First Design**
- Responsive breakpoints
- Touch-friendly interface
- Progressive enhancement
- Mobile performance optimization

### 🎨 **Modern CSS Features**
- CSS Custom Properties (variables)
- CSS Grid and Flexbox layouts
- Container queries ready
- Modern color schemes
- Dark mode support

## **Makefile Features**

### 🔧 **Development Commands**

- `make dev` - Start development with hot reload
- `make dev-detached` - Run development in background
- `make dev-logs` - View development logs
- `make dev-shell` - Access container shell
- `make nginx-config-test` - Test your nginx configurations
- `make urls` - Shows all available demo pages
- `make backup` - Creates timestamped backups of src/ and nginx/
- `make restore BACKUP_FILE=static-site_20250128_143000.tar.gz` - Restore website
- `make restore BACKUP_FILE=nginx-config_20250128_143000.tar.gz` - Restore nginx

### 🚀 **Production Commands**
- `make prod` - Start production environment
- `make prod-logs` - View production logs  
- `make prod-restart` - Restart production services

### 🏗️ **Build & Maintenance**
- `make build` - Build all Docker images
- `make clean` - Clean up containers and volumes
- `make reset` - Clean and rebuild everything
- `make test` - Run health checks

### 📊 **Monitoring & Debug**
- `make status` - Show service status
- `make stats` - Show resource usage
- `make nginx-config-test` - Test Nginx config
- `make benchmark` - Performance testing

### 💾 **Backup & Restore**
- `make backup` - Create volume backups
- `make restore BACKUP_FILE=filename` - Restore from backup

### 🔒 **Security & Quality**
- `make lint-docker` - Lint Dockerfiles with hadolint
- `make security-scan` - Security scan with trivy
- `make ssl-setup` - Generate SSL certificates

### 📦 **Deployment**
- `make tag` - Tag images for registry
- `make push` - Push to container registry
- `make deploy` - Deploy to production

## **Usage Examples**

```bash
# Start development
make dev

# Start production in background  
make prod

# Run health checks
make test

# Clean up everything
make clean-all

# Create backup
make backup

# Restore from backup
make restore BACKUP_FILE=static-content_20250101_120000.tar.gz

# Show all available commands
make help
```

### **Helpful Makefile Features**

1. **Color-coded output** for better readability
2. **Comprehensive help system** with `make help`
3. **Environment detection** - automatically detects running services
4. **Safety checks** - confirms before destructive operations
5. **Resource monitoring** - shows container stats and health
6. **Backup automation** - timestamped backups with easy restore
7. **Performance testing** - built-in benchmarking with Apache Bench
8. **Security scanning** - integration with security tools
