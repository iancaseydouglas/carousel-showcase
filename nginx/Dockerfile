FROM nginx:1.25-alpine

# Install security updates
RUN apk update && apk upgrade

# Copy configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY sites-available/ /etc/nginx/sites-available/

# Create cache directory
RUN mkdir -p /var/cache/nginx/static

# Set proper permissions
RUN chown -R nginx:nginx /var/cache/nginx

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD curl -f http://localhost/health || exit 1

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]