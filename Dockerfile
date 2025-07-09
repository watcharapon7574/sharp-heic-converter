FROM ubuntu:22.04

# ติดตั้ง Node.js และ npm (แนะนำใช้ node 20.x)
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# ติดตั้ง build tools และไลบรารีสำหรับ sharp + heif
RUN apt-get update && \
    apt-get install -y \
      build-essential python3 make gcc g++ libc6-dev \
      libvips42 libvips-dev libheif-dev libde265-dev \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install --build-from-source sharp

COPY . .

EXPOSE 8080

CMD ["node", "index.js"]