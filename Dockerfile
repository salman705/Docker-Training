# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Dependencies
RUN npm install

# Copy the entire project to the container
COPY . .

# Build the React Application
RUN npm run build

# Install serve globally
RUN npm install -g serve

# Set the environment variable for serving the React app
ENV REACT_APP_BASE_URL=http://localhost

# Expose the container port
EXPOSE 80

# Define the command to run the React app
CMD ["serve", "-s", "-l", "80", "start"]
