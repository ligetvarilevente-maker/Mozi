require('dotenv').config();
const express = require('express');
const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3001;

const LOG_DIR = path.join(__dirname, 'logs');
const DATA_DIR = path.join(__dirname, 'data');
if (!fs.existsSync(LOG_DIR)) fs.mkdirSync(LOG_DIR);
if (!fs.existsSync(DATA_DIR)) fs.mkdirSync(DATA_DIR);

const LOG_FILE = path.join(LOG_DIR, 'server.log');
const JSON_FILE = path.join(DATA_DIR, 'adatok.json');

function log(statusCode, method, url, message = '') {
    const timestamp = new Date().toISOString();
    const line = `[${timestamp}] [${statusCode}] [${method}] ${url} ${message}`;
    console.log(line);
    fs.appendFileSync(LOG_FILE, line + '\n');
}

function writeToJsonFile(action, data) {
    let records = [];
    if (fs.existsSync(JSON_FILE)) {
        try {
            records = JSON.parse(fs.readFileSync(JSON_FILE, 'utf8'));
        } catch (e) {
            records = [];
        }
    }
    records.push({
        timestamp: new Date().toISOString(),
        action,
        data
    });
    fs.writeFileSync(JSON_FILE, JSON.stringify(records, null, 2));
}

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Statikus fájlok kiszolgálása a 'login' ÉS a 'public' mappából is
app.use(express.static(path.join(__dirname, 'login')));
app.use(express.static(path.join(__dirname, 'public')));

app.use((req, res, next) => {
    res.on('finish', () => {
        log(res.statusCode, req.method, req.originalUrl);
    });
    next();
});

let pool;
async function initDb() {
    pool = mysql.createPool({
        host: process.env.DB_HOST || 'localhost',
        port: process.env.DB_PORT || 3306,
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || '',
        database: process.env.DB_NAME || 'Mozi',
        waitForConnections: true,
        connectionLimit: 10
    });

    try {
        const conn = await pool.getConnection();
        console.log(`✅ Adatbázis kapcsolat OK: ${process.env.DB_NAME || 'Mozi'}`);
        log(200, 'DB', 'CONNECT', `Adatbázis: ${process.env.DB_NAME || 'Mozi'}`);
        conn.release();
    } catch (err) {
        console.error('❌ Adatbázis kapcsolat hiba:', err.message);
        log(500, 'DB', 'CONNECT', err.message);
    }
}

// ===== REGISZTRÁCIÓS VÉGPONT =====
app.post('/api/register', async (req, res) => {
    try {
        const { nev, emailcim, telszam, szuletesi_datum, jelszo } = req.body;

        if (!nev || !emailcim || !telszam || !szuletesi_datum || !jelszo) {
            return res.status(400).json({ success: false, error: 'Minden mező kitöltése kötelező!' });
        }

        const [result] = await pool.query(
            'INSERT INTO regisztracio (nev, emailcim, telszam, szuletesi_datum, jelszo) VALUES (?, ?, ?, ?, ?)',
            [nev, emailcim, telszam, szuletesi_datum, jelszo]
        );

        const newUser = { id: result.insertId, nev, emailcim, telszam, szuletesi_datum };

        writeToJsonFile('REGISZTRACIO', newUser);

        res.status(201).json({ success: true, message: 'Sikeres regisztráció!', data: newUser });
    } catch (err) {
        if (err.code === 'ER_DUP_ENTRY') {
            return res.status(409).json({ success: false, error: 'Ezzel az email címmel már regisztráltak!' });
        }
        log(500, 'POST', '/api/register', err.message);
        res.status(500).json({ success: false, error: err.message });
    }
});

// ===== BEJELENTKEZÉSI VÉGPONT =====
app.post('/api/login', async (req, res) => {
    try {
        // A frontendről jövő email és jelszó
        const { emailcim, jelszo } = req.body;

        if (!emailcim || !jelszo) {
            return res.status(400).json({ success: false, error: 'Az email és a jelszó megadása kötelező!' });
        }

        // Megkeressük a felhasználót az adatbázisban
        const [rows] = await pool.query(
            'SELECT id, nev, emailcim, jelszo FROM regisztracio WHERE emailcim = ?',
            [emailcim]
        );

        // Ha nincs ilyen email
        if (rows.length === 0) {
            return res.status(401).json({ success: false, error: 'Hibás email cím vagy jelszó!' });
        }

        const user = rows[0];

        // Jelszó ellenőrzése (mivel nincs titkosítás, sima szöveg összehasonlítás)
        if (user.jelszo !== jelszo) {
            return res.status(401).json({ success: false, error: 'Hibás email cím vagy jelszó!' });
        }

        // Sikeres bejelentkezés
        writeToJsonFile('BEJELENTKEZES', { id: user.id, emailcim: user.emailcim });
        res.status(200).json({
            success: true,
            message: 'Sikeres bejelentkezés!',
            user: { id: user.id, nev: user.nev, emailcim: user.emailcim }
        });

    } catch (err) {
        log(500, 'POST', '/api/login', err.message);
        res.status(500).json({ success: false, error: err.message });
    }
});

// ===== ÖSSZES FELHASZNÁLÓ LEKÉRDEZÉSE (opcionális) =====
app.get('/api/users', async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT id, nev, emailcim, telszam, szuletesi_datum, regisztralt_datum FROM regisztracio');
        writeToJsonFile('GET_ALL_USERS', rows);
        res.status(200).json({ success: true, data: rows });
    } catch (err) {
        log(500, 'GET', '/api/users', err.message);
        res.status(500).json({ success: false, error: err.message });
    }
});

// 404 kezelés
app.use((req, res) => {
    res.status(404).json({ success: false, error: 'Végpont nem található' });
});

initDb().then(() => {
    app.listen(PORT, () => {
        console.log(` Szerver fut: http://localhost:${PORT}/login.html`);
        log(200, 'SERVER', 'START', `Port: ${PORT}`);
    });
});