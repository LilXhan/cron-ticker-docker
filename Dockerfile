# docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t lilxhan/cron-ticker:latest --push .
# FROM --platform=$BUILDPLATFORM node:22.17.1-alpine

# docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t lilxhan/cron-ticker:latest --push .
# /app /usr /lib
FROM node:22.17.1-alpine

# cd app
WORKDIR /app

# dest /app
COPY package.json ./

# Install dependencies
RUN npm install

# dest /app
COPY . .

# Execute test
RUN npm run test

# Delete files and dirs [devs]
RUN rm -rf tests && rm -rf node_modules

# Only install deps production
RUN npm install --prod

# Command run the application
CMD ["npm", "start"]