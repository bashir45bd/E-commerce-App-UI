import 'package:flutter/material.dart';
import 'BuyNow.dart';
import 'Home.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFDC1E76),
        foregroundColor: Colors.white,// Primary Color
        title: Text("Product Details"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Padding(
              padding: const EdgeInsets.all(35.0), // Adding padding to all sides
              child: Container(
                width: double.infinity,
                height: screenWidth * 0.7,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  image: DecorationImage(
                    image: NetworkImage('https://img.drz.lazcdn.com/static/bd/p/e8c42f6c552855bf599b32d8ed57c399.jpg_200x200q90.jpg_.webp'), // Replace with real image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),


            // Product Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Title",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("\$99.99", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFDC1E76))),
                      Spacer(),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star, color: Colors.amber, size: 20);
                        }),
                      ),
                      SizedBox(width: 5),
                      Text("(120)", style: TextStyle(color: Colors.grey)),
                    ],
                  ),

                  SizedBox(height: 15),
                  // Select Color
                  Text("Select Color", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ColorOption(Colors.red),
                      ColorOption(Colors.blue),
                      ColorOption(Colors.green),
                      ColorOption(Colors.black),
                    ],
                  ),

                  SizedBox(height: 15),
                  // Select Size
                  Text("Select Size", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    children: ["S", "M", "L", "XL"].map((size) {
                      return SizeOption(size);
                    }).toList(),
                  ),

                  SizedBox(height: 20),
                  // Product Description
                  Text("Product Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    "This is a high-quality product made with the finest materials. It is perfect for your needs and will provide great value.",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),

                  SizedBox(height: 20),
                  // Add to Cart & Buy Now Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFDC1E76), // Primary Color
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => CartScreen()),
                            );
                          },
                          child: Text("Add to cart", style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFAE208), // Secondary Color
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => BuyNowPage()),
                            );
                          },
                          child: Text("Buy Now", style: TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  // User Reviews Section
                  Text("Customer Reviews", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  ReviewItem(),
                  ReviewItem(),
                  ReviewItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Color Selection
class ColorOption extends StatelessWidget {
  final Color color;
  ColorOption(this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: color,
      ),
    );
  }
}

// Widget for Size Selection
class SizeOption extends StatelessWidget {
  final String size;
  SizeOption(this.size);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(size, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

// Widget for Review Section
class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(Icons.star, color: Colors.amber, size: 16);
                    }),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Great product! Really loved the quality and fast delivery.",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
