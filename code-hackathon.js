const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const cors = require('cors');
require('dotenv').config(); // Load environment variables

const app = express();
const PORT = process.env.PORT || 3000;
const JWT_SECRET = process.env.JWT_SECRET || 'your_secret_key'; // Use a secure secret

// Middleware
app.use(bodyParser.json());
app.use(cors()); // Allow frontend requests

// 🧑‍💻 Hardcoded Users with Pre-Hashed Passwords
const users = [
    {
        email: "lucas.martin@example.com",
        password: bcrypt.hashSync("mypassword1", 10), // Pre-hashed
        name: "Lucas Martin",
        bio: "I enjoy cooking and quiet nights.",
        preferences: { cleanliness: "High", noise_level: "Low" }
    },
    {
        email: "olivia.james@example.com",
        password: bcrypt.hashSync("mypassword2", 10),
        name: "Olivia James",
        bio: "Looking for a cozy and peaceful living environment.",
        preferences: { cleanliness: "Medium", noise_level: "Medium" }
    },
    {
        email: "noah.clark@example.com",
        password: bcrypt.hashSync("mypassword3", 10),
        name: "Noah Clark",
        bio: "I like socializing but also value personal space.",
        preferences: { cleanliness: "Low", noise_level: "High" }
    }
];

// 🔐 Middleware: Verify JWT Token
const verifyToken = (req, res, next) => {
    const token = req.header('Authorization')?.split(" ")[1]; // Extract Bearer token
    if (!token) return res.status(401).json({ error: 'Access denied. No token provided.' });

    try {
        const decoded = jwt.verify(token, JWT_SECRET);
        req.user = decoded;
        next();
    } catch (err) {
        return res.status(403).json({ error: 'Invalid or expired token.' });
    }
};

// 🔑 LOGIN Route (POST)
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    // Check if user exists
    const user = users.find(u => u.email === email);
    if (!user) return res.status(404).json({ error: 'User not found!' });

    // Compare password
    if (!bcrypt.compareSync(password, user.password)) {
        return res.status(401).json({ error: 'Invalid password!' });
    }

    // Generate JWT Token
    const token = jwt.sign({ email: user.email }, JWT_SECRET, { expiresIn: '1h' });

    // Return token & user data
    res.json({ 
        token, 
        user: { email: user.email, name: user.name, bio: user.bio, preferences: user.preferences }
    });
});

// 👥 GET All Profiles (Excluding Logged-in User)
app.get('/profiles', verifyToken, (req, res) => {
    const filteredProfiles = users.filter(user => user.email !== req.user.email);
    res.json(filteredProfiles);
});

// 🧑‍💼 GET Logged-in User Profile
app.get('/me', verifyToken, (req, res) => {
    const user = users.find(u => u.email === req.user.email);
    if (!user) return res.status(404).json({ error: 'User not found!' });

    res.json({ email: user.email, name: user.name, bio: user.bio, preferences: user.preferences });
});

// 🚀 Start Server
app.listen(PORT, () => {
    console.log(`✅ Server running at http://localhost:${PORT}`);
});