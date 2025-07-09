FROM lovell/sharp-libvips:latest

WORKDIR /app

COPY package*.json ./
RUN npm install --build-from-source sharp

COPY . .

EXPOSE 8080

CMD ["node", "index.js"]