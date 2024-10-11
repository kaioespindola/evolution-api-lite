# Use the official Node.js 20 image as the base image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

RUN npm run db:generate

RUN npm run build

# Expose the port the app runs on
EXPOSE 3333

# Command to server the application
CMD ["npm", "run", "start:prod"]
