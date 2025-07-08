const express = require('express');
const multer = require('multer');
const sharp = require('sharp');
const app = express();
const upload = multer();

app.post('/convert-heic', upload.single('file'), async (req, res) => {
  try {
    const buffer = req.file.buffer;
    // sharp จะแปลง HEIC เป็น JPG อัตโนมัติ
    const jpgBuffer = await sharp(buffer).jpeg().toBuffer();

    res.set('Content-Type', 'image/jpeg');
    res.send(jpgBuffer);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.get('/', (req, res) => res.send('HEIC to JPG API Ready!'));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log('Server running on port', PORT));