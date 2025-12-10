-- Restaurant Dish Search Sample Data
-- Run this after schema.sql to populate the database

-- Insert Restaurants
INSERT INTO restaurants (id, name, city, address) VALUES
(1, 'Hyderabadi Spice House', 'Hyderabad', '123 Jubilee Hills, Hyderabad'),
(2, 'Biryani Paradise', 'Bangalore', '45 MG Road, Bangalore'),
(3, 'Mughal Darbar', 'Delhi', '78 Chandni Chowk, Delhi'),
(4, 'Spice Garden', 'Mumbai', '234 Bandra West, Mumbai'),
(5, 'Royal Kitchen', 'Hyderabad', '567 Banjara Hills, Hyderabad'),
(6, 'Tandoori Nights', 'Chennai', '89 Anna Nagar, Chennai'),
(7, 'Pizza Palace', 'Mumbai', '12 Andheri East, Mumbai'),
(8, 'Italian Corner', 'Delhi', '34 Connaught Place, Delhi'),
(9, 'The Biryani Factory', 'Bangalore', '56 Indiranagar, Bangalore'),
(10, 'Curry House', 'Pune', '78 Koregaon Park, Pune'),
(11, 'Saffron Restaurant', 'Hyderabad', '90 Gachibowli, Hyderabad'),
(12, 'Taste of India', 'Chennai', '123 T Nagar, Chennai');

-- Insert Menu Items
INSERT INTO menu_items (id, restaurant_id, dish_name, price) VALUES
-- Hyderabadi Spice House (Restaurant 1)
(1, 1, 'Chicken Biryani', 220.00),
(2, 1, 'Mutton Biryani', 320.00),
(3, 1, 'Veg Biryani', 180.00),
(4, 1, 'Fish Curry', 280.00),

-- Biryani Paradise (Restaurant 2)
(5, 2, 'Chicken Biryani', 250.00),
(6, 2, 'Hyderabadi Biryani', 280.00),
(7, 2, 'Paneer Biryani', 200.00),

-- Mughal Darbar (Restaurant 3)
(8, 3, 'Chicken Biryani', 180.00),
(9, 3, 'Mutton Biryani', 350.00),
(10, 3, 'Butter Chicken', 240.00),

-- Spice Garden (Restaurant 4)
(11, 4, 'Chicken Biryani', 260.00),
(12, 4, 'Prawn Biryani', 340.00),
(13, 4, 'Veg Biryani', 160.00),

-- Royal Kitchen (Restaurant 5)
(14, 5, 'Chicken Biryani', 290.00),
(15, 5, 'Dum Biryani', 310.00),
(16, 5, 'Tandoori Chicken', 280.00),

-- Tandoori Nights (Restaurant 6)
(17, 6, 'Chicken Biryani', 200.00),
(18, 6, 'Tandoori Biryani', 270.00),
(19, 6, 'Chicken Tikka', 220.00),

-- Pizza Palace (Restaurant 7)
(20, 7, 'Margherita Pizza', 250.00),
(21, 7, 'Pepperoni Pizza', 350.00),
(22, 7, 'Veggie Pizza', 280.00),
(23, 7, 'Chicken Pizza', 320.00),

-- Italian Corner (Restaurant 8)
(24, 8, 'Margherita Pizza', 300.00),
(25, 8, 'Pasta Carbonara', 280.00),
(26, 8, 'Garlic Bread', 120.00),

-- The Biryani Factory (Restaurant 9)
(27, 9, 'Chicken Biryani', 230.00),
(28, 9, 'Special Biryani', 350.00),
(29, 9, 'Egg Biryani', 180.00),

-- Curry House (Restaurant 10)
(30, 10, 'Chicken Biryani', 210.00),
(31, 10, 'Dal Makhani', 180.00),
(32, 10, 'Paneer Butter Masala', 200.00),

-- Saffron Restaurant (Restaurant 11)
(33, 11, 'Chicken Biryani', 275.00),
(34, 11, 'Lucknowi Biryani', 320.00),
(35, 11, 'Kebab Platter', 400.00),

-- Taste of India (Restaurant 12)
(36, 12, 'Chicken Biryani', 195.00),
(37, 12, 'Chettinad Biryani', 260.00),
(38, 12, 'Fish Fry', 180.00);

-- Insert Orders (varying counts to simulate popularity)
-- Hyderabadi Spice House - Chicken Biryani (96 orders - highest)
INSERT INTO orders (menu_item_id) VALUES
(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),
(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),
(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),
(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),
(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1);

-- Biryani Paradise - Chicken Biryani (78 orders)
INSERT INTO orders (menu_item_id) VALUES
(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),
(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),
(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),
(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5),(5);

-- Royal Kitchen - Chicken Biryani (65 orders)
INSERT INTO orders (menu_item_id) VALUES
(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),
(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),
(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),
(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),(14),
(14),(14),(14),(14),(14);

-- Saffron Restaurant - Chicken Biryani (58 orders)
INSERT INTO orders (menu_item_id) VALUES
(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),
(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),
(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),
(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33),(33);

-- Spice Garden - Chicken Biryani (52 orders)
INSERT INTO orders (menu_item_id) VALUES
(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),
(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),
(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),(11),
(11),(11),(11),(11),(11),(11),(11);

-- The Biryani Factory - Chicken Biryani (45 orders)
INSERT INTO orders (menu_item_id) VALUES
(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),
(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),
(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27);

-- Curry House - Chicken Biryani (38 orders)
INSERT INTO orders (menu_item_id) VALUES
(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),
(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),(30),
(30),(30),(30),(30),(30),(30),(30),(30);

-- Tandoori Nights - Chicken Biryani (32 orders)
INSERT INTO orders (menu_item_id) VALUES
(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),
(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),(17),
(17),(17);

-- Taste of India - Chicken Biryani (28 orders)
INSERT INTO orders (menu_item_id) VALUES
(36),(36),(36),(36),(36),(36),(36),(36),(36),(36),(36),(36),(36),(36),(36),
(36),(36),(36),(36),(36),(36),(36),(36),(36),(36),(36),(36),(36);

-- Mughal Darbar - Chicken Biryani (22 orders) - price is 180, below typical range
INSERT INTO orders (menu_item_id) VALUES
(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8),(8);

-- Pizza Palace - Margherita Pizza (55 orders)
INSERT INTO orders (menu_item_id) VALUES
(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),
(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),
(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),(20),
(20),(20),(20),(20),(20),(20),(20),(20),(20),(20);

-- Italian Corner - Margherita Pizza (42 orders)
INSERT INTO orders (menu_item_id) VALUES
(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),
(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),
(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24),(24);

-- Additional orders for variety
INSERT INTO orders (menu_item_id) VALUES
(2),(2),(2),(2),(2),(2),(2),(2),(2),(2),(2),(2),(2),(2),(2), -- Mutton Biryani
(3),(3),(3),(3),(3),(3),(3),(3),(3),(3), -- Veg Biryani
(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6), -- Hyderabadi Biryani
(10),(10),(10),(10),(10),(10),(10),(10),(10),(10), -- Butter Chicken
(21),(21),(21),(21),(21),(21),(21),(21),(21),(21),(21),(21),(21),(21),(21), -- Pepperoni Pizza
(25),(25),(25),(25),(25),(25),(25),(25),(25),(25); -- Pasta Carbonara
