#!/bin/bash

# Carousel Showcase Repository Structure Generator
# This script creates the complete directory structure and placeholder files

set -e  # Exit on any error

echo "Creating carousel-showcase repository structure..."

# Create main project directory
mkdir -p carousel-showcase
cd carousel-showcase

# Create root level files
touch docker-compose.yml
touch docker-compose.dev.yml
touch README.md

# Create nginx directory structure
mkdir -p nginx/sites-available
mkdir -p nginx/ssl

# Create nginx configuration files
touch nginx/nginx.conf
touch nginx/sites-available/default.conf

# Add .gitkeep to ssl directory (typically empty in development)
touch nginx/ssl/.gitkeep

# Create static-site directory structure
mkdir -p static-site/src/assets/css
mkdir -p static-site/src/assets/js
mkdir -p static-site/src/assets/images
mkdir -p static-site/src/components

# Create static-site files
touch static-site/Dockerfile
touch static-site/Dockerfile.dev

# Create HTML files
touch static-site/src/index.html
touch static-site/src/scroll-snap.html
touch static-site/src/radio-button.html
touch static-site/src/grid-flexbox.html

# Create CSS files
touch static-site/src/assets/css/main.css
touch static-site/src/assets/css/scroll-snap.css
touch static-site/src/assets/css/radio-button.css
touch static-site/src/assets/css/grid-flexbox.css

# Create JavaScript files
touch static-site/src/assets/js/main.js
touch static-site/src/assets/js/grid-carousel.js

# Add .gitkeep to images and components directories
touch static-site/src/assets/images/.gitkeep
touch static-site/src/components/.gitkeep

# Create docs directory
mkdir -p docs
touch docs/SETUP.md

echo "Repository structure created successfully!"
echo ""
echo "Directory tree:"
echo "carousel-showcase/"
echo "├── docker-compose.yml"
echo "├── docker-compose.dev.yml"
echo "├── README.md"
echo "├── nginx/"
echo "│   ├── nginx.conf"
echo "│   ├── sites-available/"
echo "│   │   └── default.conf"
echo "│   └── ssl/ (.gitkeep)"
echo "├── static-site/"
echo "│   ├── Dockerfile"
echo "│   ├── Dockerfile.dev"
echo "│   └── src/"
echo "│       ├── index.html"
echo "│       ├── scroll-snap.html"
echo "│       ├── radio-button.html"
echo "│       ├── grid-flexbox.html"
echo "│       ├── assets/"
echo "│       │   ├── css/"
echo "│       │   │   ├── main.css"
echo "│       │   │   ├── scroll-snap.css"
echo "│       │   │   ├── radio-button.css"
echo "│       │   │   └── grid-flexbox.css"
echo "│       │   ├── js/"
echo "│       │   │   ├── main.js"
echo "│       │   │   └── grid-carousel.js"
echo "│       │   └── images/ (.gitkeep)"
echo "│       └── components/ (.gitkeep)"
echo "└── docs/"
echo "    └── SETUP.md"
echo ""
echo "All files and directories have been created with appropriate .gitkeep files for empty directories."