FROM node:20

# ติดตั้ง libheif, libde265, libvips
RUN apt-get update && \
    apt-get install -y \
      build-essential \
      libvips-dev \
      libde265-dev \
      libheif-dev

WORKDIR /app
COPY . .
RUN npm install

EXPOSE 3000
CMD ["node", "index.js"]