FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# Set working directory dalam container
WORKDIR /app

# Copy file package.json dan pnpm-lock.yaml ke dalam container
COPY package.json pnpm-lock.yaml ./

# Install pnpm globally
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install

# Copy seluruh kode ke dalam container
COPY . .

# Build aplikasi
RUN pnpm run build

# Expose port yang digunakan
EXPOSE 3000

# Command untuk menjalankan aplikasi
CMD ["pnpm", "run", "dev"]
