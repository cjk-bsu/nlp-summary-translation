# === Stage 1: Build static files ===
FROM node:18-alpine AS builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy code and build
COPY . .
RUN npm run build


# === Stage 2: Serve with nginx ===
FROM nginx:stable-alpine

# Remove default NGINX config
RUN rm -rf /usr/share/nginx/html/*

# Add custon NGINX config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy static build output
COPY --from=builder /app/dist /usr/share/nginx/html

# Optionally replace with custom nginx.conf for SPA support
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
