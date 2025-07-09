const express = require('express');
const multer = require('multer');
const sharp = require('sharp');
const cors = require('cors');

const app = express();
const upload = multer();

// เปิด CORS ให้เว็บอื่น (โดยเฉพาะ frontend) เรียกใช้งานได้
app.use(cors());

app.post('/convert-heic', upload.single('file'), async (req, res) => {
  try {
    const buffer = req.file.buffer;
    // sharp จะแปลง HEIC เป็น JPG อัตโนมัติ (ถ้า sharp รองรับ HEIC)
    const jpgBuffer = await sharp(buffer).jpeg().toBuffer();

    res.set('Content-Type', 'image/jpeg');
    res.send(jpgBuffer);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.get('/', (req, res) => res.send('HEIC to JPG API Ready!'));

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => console.log('Server running on port', PORT));