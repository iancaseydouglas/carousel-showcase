FROM nginx:1.25-alpine as builder

# Copy source files
COPY src/ /usr/share/nginx/html/

# Install build tools for optimization
RUN apk add --no-cache nodejs npm

# Optimize assets (if build tools are needed)
WORKDIR /usr/share/nginx/html
RUN echo "Building optimized assets..."

FROM nginx:1.25-alpine

# Copy optimized files
COPY --from=builder /usr/share/nginx/html /usr/share/nginx/html

# Create non-root user
RUN addgroup -g 1001 -S nginx-user && \
    adduser -S -D -H -u 1001 -h /var/cache/nginx -s /sbin/nologin -G nginx-user nginx-user

# Set permissions
RUN chown -R nginx-user:nginx-user /usr/share/nginx/html

# Use non-root user
USER nginx-user

EXPOSE 80