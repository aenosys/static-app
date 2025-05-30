# Use an official Nginx image as the base
FROM nginx:alpine

# Copy your custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the HTML file to the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# Copy the video file to the Nginx web directory
COPY file_example_MP4_1920_18MG.mp4 /usr/share/nginx/html/file_example_MP4_1920_18MG.mp4

# Expose port 80 to the outside world
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
