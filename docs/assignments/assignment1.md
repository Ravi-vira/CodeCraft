1. db.movies.find({runtime:{$gt:150}},{title:1,_id:0},{title:true,_id:false})

   db.movies.find({rating:{$gt:8.5}},{title:1,_id:0},{title:true,_id:false})

   db.movies.find({year:{$gte:2000,$lte:2015}},{title:1,_id:0},{title:true,_id:false})

   db.movies.find({$or:[{boxOffice:{$lte:500}},{boxOffice:{$gte:1000}}]},{title:1,_id:0},{title:true,_id:false})

2. db.movies.find({$and:[{director:"Christopher Nolan"},{isOscarWinner: true },{boxOffice:{$gt:700}},{streamingOn:"Netflix"}]},{title:true,_id:false})

3. db.movies.find({"specialFeatures.behindTheScenes":true,"specialFeatures.deletedScenes":true},{title:true,_id:false})

4. db.movies.find( { $and : [ {cast: {$in:['Carrie-Anne Moss','Morgan Freeman']} }, {languages:{$exists:true}},{streamingOn:{$exists:true}}, {$expr:{$gte: [{$size:"$streamingOn"},2] } } ] },{title:true,_id:false})

5. db.movies.updateOne({title:"Inception"}, {$addToSet:{languages:"Chinese"}})

6. db.movies.updateMany({director:"Christopher Nolan"},{$addToSet:{cast:"Michael Caine"}})

7. db.movies.updateMany({runtime:{$gt:140}},{$addToSet:{streamingOn:"Disney+"}})

8. db.movies.find({
    "genre": { $size: 2 },
    "boxOffice": { $exists: true },
    "specialFeatures": { $exists: false }
})


9. db.movies.deleteMany({ rating: { $lt: 8.0 } })

10. db.movies.updateMany(
    { "year": { $lt: 2000 } },
    { $pull: { "streamingOn": "Netflix" } }
)


11. db.movies.find({$expr:{ $gt: ["$boxOffice", { $multiply: ["$runtime", 10] }]}},{title:true,_id:false})

12.db.movies.find({
    "streamingOn": { $all: ["Netflix", "Amazon Prime"] },
    $expr: { $eq: ["$streamingOn", ["Netflix", "Amazon Prime"]] }
})


13. db.movies.find({
    "genre": { $all: ["Action", "Sci-Fi"] }
})


14. db.movies.find({cast:{$size:3}},{title:true,_id:false})
Footer


15. db.movies.find({
    "cast": { $size: 3 }
})