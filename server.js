
const express = require('express');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = 3000;


app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.use(express.static(path.join(__dirname, 'login')));


app.use((req, res) => {
  res.status(404).json({ success: false, error: 'Végpont nem található' });
});


app.listen(PORT, () => {
  console.log(` Szerver fut: http://localhost:${PORT}/login.html`);
});