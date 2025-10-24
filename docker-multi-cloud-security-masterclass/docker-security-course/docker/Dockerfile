# Start with minimal base image
FROM alpine:3.18

# Security: Update packages first
RUN apk update && apk upgrade

# Create non-root user for security
RUN adduser -D -u 1000 appuser

# Switch to non-root user
USER appuser

# Set working directory
WORKDIR /app

# Run a simple command
CMD ["echo", "Hello from secure container!"]
