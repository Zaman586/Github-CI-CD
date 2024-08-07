# Use the official Nginx base image
FROM nginx:latest

# Copy the index.html file to the default Nginx HTML directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 8080 to the outside world
EXPOSE 8080

# Update Nginx configuration to listen on port 8080
RUN sed -i 's/listen 80;/listen 8080;/' /etc/nginx/conf.d/default.conf
