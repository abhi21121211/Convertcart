Requirement
Build a simple backend service that allows users to search for restaurants based on a dish
name.

The system should store restaurants, their menu items, and the orders placed for those items.
When a user searches for a dish, the system should return the restaurants where that dish is
ordered the most, restricted by a mandatory price range filter.
Your task is to design the data model, implement the logic, and expose an API to return the
results.

Use Case — Search by Dish Name (with
mandatory price range)
When the user searches by dish name, return:
● The top 10 restaurants where that dish has been ordered the highest number of times
● Only include restaurants where the dish’s price falls within the required price range
● Each result should include:
○ Restaurant details
○ Dish name
○ Dish price
○ Total order count for that dish in that restaurant

Sample Input
/search/dishes?name=biryani&minPrice=150&maxPrice=300

Expected Response Shape (example)
{
"restaurants": [
{
"restaurantId": 5,
"restaurantName": "Hyderabadi Spice House",
"city": "Hyderabad",
"dishName": "Chicken Biryani",
"dishPrice": 220,
"orderCount": 96
}
]
}

Only one API is required for this use case.

What We Expect
● Clean and well-structured Node + MySQL backend code.
● A clear README with setup steps, DB config, and example API usage.
● A seed file with sample data for restaurants, menu items, orders(for simplicity
consider one order has only one item).
● The project hosted on any free platform (Railway / Render / etc.) and the public URL
shared.
● Code pushed to a public Git repository and link included.
● Keep it simple, understandable, and runnable without issues.

● Use of AI tools is allowed, but you must fully understand your code — during the
interview, we may ask you to modify or extend it in real time.