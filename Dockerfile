# Dependencies Development
FROM node:22.17.1-alpine AS deps
WORKDIR /app
COPY package.json ./
RUN npm install

# Build an Test
FROM node:22.17.1-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

# Deps Production
FROM node:22.17.1-alpine AS prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

# Execute App
FROM --platform=$BUILDPLATFORM node:22.17.1-alpine AS runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY tasks/ ./tasks
COPY app.js .
CMD ["node", "app.js"]