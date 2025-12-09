# Restaurant Dish Search API

A simple backend service that allows users to search for restaurants based on a dish name with price range filtering. Returns the top 10 restaurants where the searched dish has been ordered the most.

## 🚀 Features

- Search restaurants by dish name
- Filter results by price range (mandatory)
- Get top 10 restaurants ranked by order count
- RESTful API design
- MySQL database with optimized queries

## 📋 Tech Stack

- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: MySQL
- **Driver**: mysql2

## 🛠️ Setup Instructions

### Prerequisites

- Node.js (v18 or higher)
- MySQL (v8 or higher)

### 1. Clone the Repository

```bash
git clone <repository-url>
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
PORT=3000
```

### 4. Setup Database

Run the schema and seed files:

```bash
# Login to MySQL
mysql -u root -p

# Run schema (creates database and tables)
source db/schema.sql

# Run seed data
source db/seed.sql
```

Or run directly:

```bash
mysql -u root -p < db/schema.sql
mysql -u root -p < db/seed.sql
```

### 5. Start the Server

```bash
# Development (with auto-reload)
npm run dev

# Production
npm start
```

The server will start on `http://localhost:3000`

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
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"
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

## 📁 Project Structure

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
├── package.json
├── .env.example
└── README.md
```

## 🗃️ Database Schema

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

**orders**
- `id` - Primary key
- `menu_item_id` - Foreign key to menu_items
- `quantity` - Order quantity (default: 1)

## 🧪 Testing Examples

```bash
# Search for biryani in price range 150-300
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"

# Search for pizza
curl "http://localhost:3000/search/dishes?name=pizza&minPrice=100&maxPrice=400"

# Test error handling
curl "http://localhost:3000/search/dishes?name=biryani"
```

## 🌐 Deployment

### Railway

1. Push code to GitHub
2. Connect Railway to your repository
3. Add MySQL database addon
4. Set environment variables
5. Deploy

### Render

1. Push code to GitHub
2. Create new Web Service on Render
3. Set up MySQL (PlanetScale, Aiven, or external)
4. Configure environment variables
5. Deploy

## 📄 License

ISC
