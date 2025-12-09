const express = require('express');
const cors = require('cors');
const searchRoutes = require('./routes/searchRoutes');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Health check endpoint
app.get('/', (req, res) => {
    res.json({
        message: 'Restaurant Dish Search API',
        version: '1.0.0',
        endpoints: {
            search: 'GET /search/dishes?name=<dish>&minPrice=<min>&maxPrice=<max>'
        }
    });
});

// Routes
app.use('/search', searchRoutes);

// 404 handler
app.use((req, res) => {
    res.status(404).json({ error: 'Endpoint not found' });
});

// Error handler
app.use((err, req, res, next) => {
    console.error('Server error:', err);
    res.status(500).json({
        error: 'Internal server error',
        message: err.message
    });
});

module.exports = app;
