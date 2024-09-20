# Use the official Node.js image from the Docker Hub as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json to install dependencies first (improves caching)
COPY package*.json ./

# Install the app dependencies inside the container
RUN npm install --production

# Copy the rest of the application code to the container's working directory
COPY . .

# Expose the port on which the app will run (default is 8000 for your app)
EXPOSE 8000

# Command to start the Node.js application
CMD ["npm", "start"]