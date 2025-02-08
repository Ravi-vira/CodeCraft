<pre>
<code>
import { readFileSync } from "fs";

const about_html = readFileSync("./about.html", "utf-8");

const server = Bun.serve({
    port:8050,
    fetch(req){
        const url = new  URL(req.url)
        const pathname = url.pathname
        console.log(url)
        console.log(pathname)

        switch(pathname){
        case '/':
            return new Response('Welcome to BarterX')
            
        case '/products':
            return new Response('Here are the products up for Sale in BarterX')
            
        case '/login':
            return new Response('Login to the BarterX')
            
        case '/signup':
            return new Response('Sign up to the BarterX')
            
        case '/profile':
            return new Response('Trader Profile')
            
        case '/cart':
            return new Response('Your Shopping Cart is here')
            
        case '/checkout':
            return new Response("Lets' start shipping")
            
        case '/orders':
            return new Response('Your Orders are here')
            
        case '/categories':
            return new Response('Browse Categories')
            
        case '/chat':
            return new Response('Your Chat with fellow Traders')
            
        case '/contact':
            return new Response('Contact Us at')
            
        case '/about':
            return new Response(about_html,{status: 200,headers: {"Content-Type": "text/html",},})
        
        case '/api/products':
            let Product_json = [
                { "id": 1, "name": "Used Laptop", "price": 300 },
                { "id": 2, "name": "Second-hand Bicycle", "price": 50 }
            ]
            return  new Response(JSON.stringify(Product_json),{status: 200,headers: {"Content-Type": "application/json"},})

        default:
            let error_code = {
                "error": "Page not found",
                "statusCode": 404
            }
            return new Response(JSON.stringify(error_code),{status: 200, headers: {"Content-Type": 'application/json',},})
            
        }
    }
})

console.log(`Bun Running on http://localhost:${server.port}`)
</code>
</pre>

**Output:**  
![ Output](img/bun.png)
![ Output](img/bun1.png)

