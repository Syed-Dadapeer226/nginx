FROM nginx:alpine-slim

# Create non-root user
RUN addgroup -S nginxgroup && \
    adduser -S nginxuser -G nginxgroup

# Remove default content
RUN rm -rf /usr/share/nginx/html/*

# Copy application files
COPY index.html /usr/share/nginx/html/

# Set permissions
RUN chown -R nginxuser:nginxgroup \
    /usr/share/nginx/html \
    /var/cache/nginx \
    /var/log/nginx \
    /etc/nginx/conf.d

# Create PID directory and make it writable
RUN touch /var/run/nginx.pid && \
    chown -R nginxuser:nginxgroup /var/run/nginx.pid

# Configure nginx to listen on 8080
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

USER nginxuser

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
