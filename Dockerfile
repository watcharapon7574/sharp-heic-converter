FROM node:20

# ติดตั้ง libvips และ libheif ด้วย
RUN apt-get update && \
    apt-get install -y build-essential python3 make gcc g++ libc6-dev \
    libvips libvips-dev libheif-dev

WORKDIR /app

COPY package*.json ./

# Build sharp from source ให้ link libheif ได้จริง
RUN npm install --build-from-source sharp

COPY . .

EXPOSE 8080

CMD ["node", "index.js"]