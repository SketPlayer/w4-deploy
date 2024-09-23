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
COPY package.json pnpm-lock.json ./

# Install dependencies using npm
RUN npm install -g pnpm
RUN pnpm install

# Copy the entire codebase into the container
COPY . .

# Build the application for production
RUN pnpm run build

# Expose the port the app will run on
EXPOSE 80

# Set environment variable to run on port 80
ENV NITRO_PORT=80

# Command to preview production build
CMD ["pnpm", "run", "preview"]
