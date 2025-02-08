📝 Practice Questions
🆕 Write a query to insert a new product in the collection with all required fields.

💰 Find all products with a price less than $100.

🔄 Update the stock quantity of "Wireless Headphones" to 40.

❌ Delete all products from the "Gaming" category.

📊 Find all products and sort them by price in descending order.

📦 Find products with stock between 50 and 100 units.

🏷️ Find products that have either "wireless" or "bluetooth" in their tags.

⭐ Find products where the average rating is greater than 4.5.

📅 Find products that were last updated after February 1st, 2024.

🔢 Find products with exactly 3 ratings.

🔍 Perform a text search to find products related to "wireless charging".

📝 Find products that contain the word "programmable" in their description.

🔎 Search for products containing either "fitness" or "exercise" in their description.

📑 Write a query to list all indexes in the products collection.

🔑 Create a compound index on price and stock fields.

📋 Explain the query plan for finding products by category and sorting by price.

📈 Find products using the text index and sort by relevance score.

🏷️ Update all products' prices with a 10% discount for items with stock > 100.

✨ Add a "featured" field to all products with an average rating > 4.5.

🔍 Find all products in the "Electronics" category with a price between $50 and $200.



-------------------------------------------------------------------

1. db.products.insertOne({
  "_id": 16,
  "name": "Smartphone X Pro",
  "brand": "TechElite",
  "category": "Electronics",
  "price": 799.99,
  "stock": 150,
  "ratings": [4.5, 4.6, 4.8],
  "description": "Flagship smartphone with 5G connectivity, 6.5-inch AMOLED display, and 48MP camera",
  "tags": ["smartphone", "electronics", "5G", "camera"],
  "lastUpdated": { "$date": "2024-12-13T00:00:00Z" }
});

2.  db.products.find({ price: { $lt: 100 } })

3.  db.products.updateOne(
  { name: "Wireless Headphones" },
  { $set: { stock: 40 } }
)

4.  db.products.deleteMany({ category: "Gaming" })

5.  db.products.find().sort({ price: -1 })

6.  db.products.find({ stock: { $gte: 50, $lte: 100 } })

7.  db.products.find({ tags: { $in: ["wireless", "bluetooth"] } })

8   db.products.aggregate([
  { $addFields: { averageRating: { $avg: "$ratings" } } },
  { $match: { averageRating: { $gt: 4.5 } } }
])

9.  db.products.find({ lastUpdated: { $gt: new Date("2024-02-01") } })

10. db.products.find({ ratings: { $size: 3 } })

11. db.products.createIndex({ description: "text", tags: "text" })
    db.products.find({ $text: { $search: "wireless charging" } })

12. db.products.find({ description: /programmable/i })

13. db.products.find({ description: { $in: [/fitness/i, /exercise/i] } })

14. db.products.getIndexes()

15. db.products.createIndex({ price: 1, stock: 1 })

16. db.products.find({ category: "Electronics" }).sort({ price: -1 }).explain()

17. db.products.find({ $text: { $search: "wireless" } }).sort({ score: { $meta: "textScore" } })

18. db.products.updateMany(
  { stock: { $gt: 100 } },
  { $mul: { price: 0.9 } }
)

19. db.products.updateMany(
  { $expr: { $gt: [{ $avg: "$ratings" }, 4.5] } },
  { $set: { featured: true } }
)

20. db.products.find({
  category: "Electronics",
  price: { $gte: 50, $lte: 200 }
})
Footer
© 2