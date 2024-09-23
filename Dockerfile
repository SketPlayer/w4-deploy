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

# Install dependencies
RUN npm install -g pnpm
RUN pnpm install

# Copy seluruh kode ke dalam container
COPY . .

# Build aplikasi
RUN pnpm build

# Expose port yang digunakan
EXPOSE 80

# Command untuk menjalankan aplikasi
CMD ["npm", "start", "--", "-p", "80"]
