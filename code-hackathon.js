const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config(); // Load environment variables

const app = express();
const jwtSecret = process.env.JWT_SECRET || 'your_secret_key'; // JWT secret

// Hardcoded users
const users = [
    {
        email: "lucas.martin@example.com",
        password: bcrypt.hashSync("mypassword1", 10),
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
    },
    {
        email: "emma.martinez@example.com",
        password: bcrypt.hashSync("mypassword4", 10),
        name: "Emma Martinez",
        bio: "Looking for someone easygoing with a positive attitude.",
        preferences: { cleanliness: "High", noise_level: "Medium" }
    },
    {
        email: "michael.kim@example.com",
        password: bcrypt.hashSync("mypassword5", 10),
        name: "Michael Kim",
        bio: "I prefer a clean and quiet place, with occasional hangouts.",
        preferences: { cleanliness: "High", noise_level: "Low" }
    },
    {
        email: "sophia.davis@example.com",
        password: bcrypt.hashSync("mypassword6", 10),
        name: "Sophia Davis",
        bio: "I'm into fitness and a quiet lifestyle.",
        preferences: { cleanliness: "Medium", noise_level: "Low" }
    },
    {
        email: "ethan.williams@example.com",
        password: bcrypt.hashSync("mypassword7", 10),
        name: "Ethan Williams",
        bio: "Looking for a place to relax and focus on my projects.",
        preferences: { cleanliness: "Low", noise_level: "Medium" }
    },
    {
        email: "isabella.hughes@example.com",
        password: bcrypt.hashSync("mypassword8", 10),
        name: "Isabella Hughes",
        bio: "I enjoy socializing but respect personal time and space.",
        preferences: { cleanliness: "Medium", noise_level: "Medium" }
    },
    {
        email: "liam.scott@example.com",
        password: bcrypt.hashSync("mypassword9", 10),
        name: "Liam Scott",
        bio: "Looking for a peaceful roommate with similar interests.",
        preferences: { cleanliness: "High", noise_level: "Low" }
    },
    {
        email: "charlotte.lee@example.com",
        password: bcrypt.hashSync("mypassword10", 10),
        name: "Charlotte Lee",
        bio: "Love to read, and looking for a quiet and organized place.",
        preferences: { cleanliness: "High", noise_level: "Low" }
    }
];

// Middleware to parse JSON
app.use(bodyParser.json());

// Login route
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    // Find user by email
    const user = users.find(u => u.email === email);
    if (!user) {
        return res.status(404).json({ error: 'User not found!' });
    }

    // Compare password with stored hash
    const isValidPassword = bcrypt.compareSync(password, user.password);
    if (!isValidPassword) {
        return res.status(401).json({ error: 'Invalid password!' });
    }

    // Create JWT token
    const token = jwt.sign({ email: user.email }, jwtSecret, { expiresIn: '1h' });
    res.json({ token, message: 'Login successful!' });
});

// Profile route
app.get('/profiles', (req, res) => {
    const token = req.header('Authorization');
    if (!token) {
        return res.status(401).json({ error: 'Access denied, token missing!' });
    }

    jwt.verify(token, jwtSecret, (err, decoded) => {
        if (err) {
            return res.status(403).json({ error: 'Invalid or expired token!' });
        }

        // Exclude the logged-in user's profile from the returned list
        const filteredProfiles = users.filter(user => user.email !== decoded.email);
        res.json(filteredProfiles);
    });
});

// Server setup
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});