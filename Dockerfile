# Use official Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install --production

# Copy the rest of the app
COPY . .

# Ensure upload directories exist
RUN mkdir -p uploads perm urls

# Expose the port
EXPOSE 9005

# Start the app
CMD ["node", "index.js"]
