# Stage 1: Build the Docusaurus site
FROM node:20-alpine AS builder

# Set working directory inside the container
WORKDIR /app/webpage

# Install dependencies using the manifests from the webpage directory
COPY webpage/package.json webpage/package-lock.json ./
RUN npm ci

# Copy the rest of the Docusaurus source and build
COPY webpage ./
RUN npm run build

# Stage 2: Serve the built site with Nginx
FROM nginx:alpine

# Remove default Nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Use custom Nginx configuration if present
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built assets from the builder stage
COPY --from=builder /app/webpage/build /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
