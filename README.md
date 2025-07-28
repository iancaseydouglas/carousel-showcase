
# CSS Carousel Showcase

A demonstration of three modern CSS carousel implementations with auto-rotation, hover pause functionality, and accessibility features.

## 🚀 Quick Start

### Option 1: Docker with Makefile (Recommended)

**Prerequisites:** Git, Docker, Docker Compose, and Make installed

```bash
# Clone or download the project
git clone https://github.com/iancaseydouglas/carousel-showcase.git
cd carousel-showcase

# Show available commands
make help

# Build and start development server
make build
make up

# Or start in background
make dev

# View logs
make logs

# Stop containers
make down
```

### Option 2: Docker Compose Direct

**Prerequisites:** Docker and Docker Compose installed

```bash
# Clone or download the project
git clone https://github.com/iancaseydouglas/carousel-showcase.git
cd carousel-showcase

# Start development server
docker-compose -f docker-compose.dev.yml up --build

# Or run in background
docker-compose -f docker-compose.dev.yml up -d

# Stop containers
docker-compose -f docker-compose.dev.yml down
```

### Option 3: Local Web Server

**Prerequisites:** Python, Node.js, or any local web server

#### Using Python (Built-in)
```bash
# Navigate to the static site directory
cd carousel-showcase/static-site/src

# Python 3
python -m http.server 3000

# Python 2
python -m SimpleHTTPServer 3000

# Open browser
open http://localhost:3000
```

#### Using Node.js
```bash
# Install a simple server globally
npm install -g http-server

# Navigate to the static site directory
cd carousel-showcase/static-site/src

# Start server
http-server -p 3000

# Open browser
open http://localhost:3000
```

## 🎯 What's Included

### Three Carousel Implementations

1. **CSS Scroll Snap Carousel** (`/scroll-snap.html`)
   - Native browser scrolling with snap points
   - Excellent performance and mobile support
   - Auto-rotation with smooth progress indicator

2. **Radio Button Carousel** (`/radio-button.html`)
   - Pure CSS core with JavaScript enhancements
   - Maximum browser compatibility
   - Accessible radio button controls

3. **Grid/Flexbox Interactive Carousel** (`/grid-flexbox.html`)
   - Modern layout with rich hover effects
   - Multiple cards visible simultaneously
   - Advanced animations and interactions

### Features

- ✅ **Auto-rotation** (4-5 second intervals)
- ✅ **Hover to pause** functionality
- ✅ **Keyboard navigation** (arrow keys, spacebar)
- ✅ **Touch/swipe gestures** on mobile
- ✅ **Accessibility compliant** (WCAG 2.1)
- ✅ **Responsive design** for all screen sizes
- ✅ **Reduced motion support**
- ✅ **High contrast mode** compatibility

## 🛠️ Development

### Makefile Commands

```bash
make help      # Show all available commands
make build     # Build Docker containers
make up        # Start development environment
make dev       # Start development (detached)
make prod      # Start production environment
make down      # Stop all containers
make logs      # View container logs
make clean     # Remove containers and images
```

### File Structure

```
carousel-showcase/
├── Makefile                        # Build automation
├── docker-compose.yml             # Production config
├── docker-compose.dev.yml         # Development config
├── nginx/
│   ├── nginx.conf                 # Main Nginx config
│   └── dev.conf                   # Development config
└── static-site/src/
    ├── index.html                 # Main showcase page
    ├── scroll-snap.html           # Scroll snap demo
    ├── radio-button.html          # Radio button demo
    ├── grid-flexbox.html          # Grid/flexbox demo
    └── assets/
        ├── css/main.css           # Global styles
        └── js/main.js             # Global JavaScript
```

## 🌐 Browser Support

- **Modern browsers**: Full feature support
- **IE 11+**: Basic functionality with graceful degradation
- **Mobile browsers**: Native touch support
- **Screen readers**: Full accessibility support

## 📱 Access

Once running, access the showcase at:
- **Development**: http://localhost:3000
- **Production**: http://localhost

Navigate between different carousel implementations using the main page or direct URLs.