# Restaurant Dish Search API

A simple backend service that allows users to search for restaurants based on a dish name with price range filtering. Returns the top 10 restaurants where the searched dish has been ordered the most.

## � Live Demo

**Base URL**: https://convertcart-v60r.onrender.com

**Try it now**:
```
https://convertcart-v60r.onrender.com/search/dishes?name=biryani&minPrice=150&maxPrice=300
```

## �🚀 Features

- Search restaurants by dish name
- Filter results by price range (mandatory)
- Get top 10 restaurants ranked by order count
- RESTful API design
- MySQL database with optimized queries

## 📋 Tech Stack

- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: MySQL (Aiven Cloud)
- **Driver**: mysql2
- **Hosting**: Render

## 📡 API Documentation

### Search Dishes

Search for restaurants by dish name with price range filter.

**Endpoint**: `GET /search/dishes`

**Query Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| name | string | Yes | Dish name to search for (partial match) |
| minPrice | number | Yes | Minimum price filter |
| maxPrice | number | Yes | Maximum price filter |

**Example Request**:

```bash
curl "https://convertcart-v60r.onrender.com/search/dishes?name=biryani&minPrice=150&maxPrice=300"
```

**Success Response** (200 OK):

```json
{
  "restaurants": [
    {
      "restaurantId": 1,
      "restaurantName": "Hyderabadi Spice House",
      "city": "Hyderabad",
      "dishName": "Chicken Biryani",
      "dishPrice": 220,
      "orderCount": 96
    },
    {
      "restaurantId": 2,
      "restaurantName": "Biryani Paradise",
      "city": "Bangalore",
      "dishName": "Chicken Biryani",
      "dishPrice": 250,
      "orderCount": 78
    }
  ]
}
```

**Error Response** (400 Bad Request):

```json
{
  "error": "Missing required parameters: name, minPrice, maxPrice"
}
```

### Health Check

**Endpoint**: `GET /`

Returns API information and available endpoints.

## �️ Local Setup

### Prerequisites

- Node.js (v18 or higher)
- MySQL (v8 or higher)

### 1. Clone the Repository

```bash
git clone https://github.com/abhi21121211/Convertcart.git
cd Convertcart
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Configure Environment

Create a `.env` file from the example:

```bash
cp .env.example .env
```

Update the `.env` file with your MySQL credentials:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=restaurant_db
DB_PORT=3306
DB_SSL=false
PORT=3000
```

### 4. Setup Database

Run the schema and seed files:

```bash
# Login to MySQL
mysql -u root -p

# Run schema (creates tables)
source db/schema.sql

# Run seed data
source db/seed.sql
```

### 5. Start the Server

```bash
# Development (with auto-reload)
npm run dev

# Production
npm start
```

The server will start on `http://localhost:3000`

## �📁 Project Structure

```
├── src/
│   ├── config/
│   │   └── db.js              # Database connection pool
│   ├── controllers/
│   │   └── searchController.js # Search logic
│   ├── routes/
│   │   └── searchRoutes.js    # API routes
│   └── app.js                 # Express app setup
├── db/
│   ├── schema.sql             # Database schema
│   └── seed.sql               # Sample data
├── server.js                  # Entry point
├── setup-db.js                # Database setup script
├── package.json
├── .env.example
└── README.md
```

## 🗃️ Database Schema

```
┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐
│   restaurants   │       │   menu_items    │       │     orders      │
├─────────────────┤       ├─────────────────┤       ├─────────────────┤
│ id (PK)         │───┐   │ id (PK)         │───┐   │ id (PK)         │
│ name            │   │   │ restaurant_id(FK)│◄──┘   │ menu_item_id(FK)│◄──┘
│ city            │   │   │ dish_name       │       │ quantity        │
│ address         │   │   │ price           │       │ created_at      │
│ created_at      │   └──►│ created_at      │       └─────────────────┘
└─────────────────┘       └─────────────────┘
```

### Tables

**restaurants**
- `id` - Primary key
- `name` - Restaurant name
- `city` - City location
- `address` - Full address

**menu_items**
- `id` - Primary key
- `restaurant_id` - Foreign key to restaurants
- `dish_name` - Name of the dish
- `price` - Price of the dish

**orders** (simplified: one order = one item)
- `id` - Primary key
- `menu_item_id` - Foreign key to menu_items
- `quantity` - Order quantity (default: 1)

## 🧪 Testing Examples

```bash
# Search for biryani in price range 150-300
curl "https://convertcart-v60r.onrender.com/search/dishes?name=biryani&minPrice=150&maxPrice=300"

# Search for pizza
curl "https://convertcart-v60r.onrender.com/search/dishes?name=pizza&minPrice=100&maxPrice=400"

# Test error handling (missing params)
curl "https://convertcart-v60r.onrender.com/search/dishes?name=biryani"
```

## 🌐 Deployment

The API is deployed on **Render** with **Aiven MySQL**.

### Environment Variables Required

| Variable | Description |
|----------|-------------|
| `DB_HOST` | MySQL host |
| `DB_USER` | MySQL username |
| `DB_PASSWORD` | MySQL password |
| `DB_NAME` | Database name |
| `DB_PORT` | MySQL port |
| `DB_SSL` | Enable SSL (true/false) |
| `PORT` | Server port |

## 📄 License

ISC
