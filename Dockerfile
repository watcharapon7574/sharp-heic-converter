FROM node:20

# ติดตั้ง build tools และ libheif ที่รองรับ heic/heif
RUN apt-get update && \
    apt-get install -y build-essential python3 make gcc g++ libc6-dev \
    libvips libheif-dev

# ตั้ง working directory
WORKDIR /app

# ก๊อปปี้ไฟล์ package*
COPY package*.json ./

# ติดตั้ง dependencies (รวม sharp)
RUN npm install

# ก๊อปปี้ไฟล์ source code ทั้งหมด
COPY . .

# เปิดพอร์ต 3000
EXPOSE 3000

# รันเซิร์ฟเวอร์
CMD ["node", "index.js"]