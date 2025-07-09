FROM node:20

# ติดตั้ง build tools + vips + heif
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential python3 make gcc g++ libc6-dev \
    libvips libvips-dev libheif1 libheif-dev libde265-0 libde265-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install --build-from-source sharp
COPY . .

EXPOSE 8080

CMD ["node", "index.js"]