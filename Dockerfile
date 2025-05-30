# Use an official Nginx image as the base
FROM nginx:alpine

# Create a custom Nginx configuration
# (Your Nginx configuration looks fine for this purpose)
RUN echo 'worker_processes 1; \
events { worker_connections 1024; } \
http { \
    include       mime.types; \
    default_type  application/octet-stream; \
    access_log /dev/stdout; \
    error_log /dev/stderr warn; \
    sendfile        on; \
    server { \
        listen       80; \
        server_name  localhost; \
        location / { \
            root   /usr/share/nginx/html; \
            index  index.html; \
            try_files $uri $uri/ /index.html; # Added try_files for robustness if needed (optional for this simple case) \
        } \
        # Optional: Explicitly tell Nginx about mp4 mime type, though it should know from mime.types
        # location ~ \.mp4$ { \
        #     types { video/mp4 mp4; } \
        #     root   /usr/share/nginx/html; \
        # } \
    } \
}' > /etc/nginx/nginx.conf

# Copy the HTML file to the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# === ADD THIS LINE ===
# Copy the video file to the Nginx web directory
COPY file_example_MP4_1920_18MG.mp4 /usr/share/nginx/html/file_example_MP4_1920_18MG.mp4
# =====================

# Expose port 80 to the outside world
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
