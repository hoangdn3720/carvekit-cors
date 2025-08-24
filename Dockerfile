# Dockerfile to enable CORS via nginx proxy for CarveKit
FROM anodev/carvekit:latest-cpu

# Use root user to install packages
USER root

# Install nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Remove default site configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy custom nginx configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Set environment variables
ENV CARVEKIT_PORT=5000
ENV CARVEKIT_AUTH_ENABLE=0

ENV CARVEKIT_PORT=5000
EXPOSE 80

# Copy start script and run it
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
