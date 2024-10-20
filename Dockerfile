# Use an official Nginx image as the base
FROM nginx:alpine

# Copy the HTML file to the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to the outside world
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
