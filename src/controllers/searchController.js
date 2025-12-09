const { pool } = require('../config/db');

/**
 * Search for restaurants by dish name with price range filter
 * Returns top 10 restaurants where the dish has been ordered the most
 */
const searchDishes = async (req, res) => {
    try {
        const { name, minPrice, maxPrice } = req.query;

        // Validate required parameters
        if (!name || minPrice === undefined || maxPrice === undefined) {
            return res.status(400).json({
                error: 'Missing required parameters: name, minPrice, maxPrice'
            });
        }

        // Validate price range values
        const min = parseFloat(minPrice);
        const max = parseFloat(maxPrice);

        if (isNaN(min) || isNaN(max)) {
            return res.status(400).json({
                error: 'minPrice and maxPrice must be valid numbers'
            });
        }

        if (min > max) {
            return res.status(400).json({
                error: 'minPrice cannot be greater than maxPrice'
            });
        }

        // Query to find top 10 restaurants with highest order count for the dish
        const query = `
      SELECT 
        r.id AS restaurantId,
        r.name AS restaurantName,
        r.city,
        m.dish_name AS dishName,
        m.price AS dishPrice,
        COUNT(o.id) AS orderCount
      FROM restaurants r
      JOIN menu_items m ON r.id = m.restaurant_id
      JOIN orders o ON m.id = o.menu_item_id
      WHERE m.dish_name LIKE ?
        AND m.price >= ?
        AND m.price <= ?
      GROUP BY r.id, m.id
      ORDER BY orderCount DESC
      LIMIT 10
    `;

        const searchTerm = `%${name}%`;
        const [rows] = await pool.execute(query, [searchTerm, min, max]);

        // Format response
        const restaurants = rows.map(row => ({
            restaurantId: row.restaurantId,
            restaurantName: row.restaurantName,
            city: row.city,
            dishName: row.dishName,
            dishPrice: parseFloat(row.dishPrice),
            orderCount: parseInt(row.orderCount)
        }));

        res.json({ restaurants });

    } catch (error) {
        console.error('Search error:', error);
        res.status(500).json({
            error: 'Internal server error',
            message: error.message
        });
    }
};

module.exports = { searchDishes };
