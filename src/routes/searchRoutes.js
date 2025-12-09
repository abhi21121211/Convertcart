const express = require('express');
const router = express.Router();
const { searchDishes } = require('../controllers/searchController');

// GET /search/dishes?name=biryani&minPrice=150&maxPrice=300
router.get('/dishes', searchDishes);

module.exports = router;
