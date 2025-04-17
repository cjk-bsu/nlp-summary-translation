# === Stage 1: Build the app ===
FROM node:18-alpine AS builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source code and build
COPY . .
RUN npm run build


# === Stage 2: Run the app ===
FROM node:18-alpine

# Install AWS CLI v2
RUN apk add --no-cache curl unzip \
  && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf awscliv2.zip aws

WORKDIR /app

# Copy build output and production deps only
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

# Set app port (matches NestJS default)
EXPOSE 3000

# Run the app
CMD ["node", "dist/main"]
