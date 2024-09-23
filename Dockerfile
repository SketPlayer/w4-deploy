FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# Set working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies using npm
RUN npm install

# Copy the entire codebase into the container
COPY . .

# Build the application for production
RUN npm run build

# Expose the port the app will run on
EXPOSE 80

# Command to run the application in production mode
CMD ["npm", "start", "--", "--port", "80", "--host", "0.0.0.0"]
