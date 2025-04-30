import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDC1E76),
        foregroundColor: Colors.white,// Primary Color
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Replace with actual cart item count
              itemBuilder: (context, index) {
                return CartItem();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: \$299.97",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDC1E76), // Primary Color
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05, // Responsive padding
                      vertical: screenHeight * 0.02, // Responsive padding
                    ),
                  ),
                  onPressed: () {
                    // Navigate to Checkout
                  },
                  child: Text(
                    "Checkout",
                    style: TextStyle(fontSize: screenWidth * 0.045,color: Colors.white),
                    // Responsive font size
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for Individual Cart Item
class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.network(
              'https://siu.edu.bd/storage/uploaded/notice/5_1708275671.jpg', // Replace with product image
              width: screenWidth * 0.25, // Responsive width
              height: screenWidth * 0.25, // Responsive height
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Title",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "\$99.99",
                    style: TextStyle(color: Colors.green, fontSize: screenWidth * 0.04), // Responsive font size
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("Qty: ", style: TextStyle(fontSize: screenWidth * 0.04)), // Responsive font size
                      QuantitySelector(),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          // Remove item from cart
                        },
                        child: Text(
                          "Remove",
                          style: TextStyle(color: Colors.red, fontSize: screenWidth * 0.04), // Responsive font size
                        ),
                      ),
                    ],
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

// Widget for Quantity Selection
class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (quantity > 1) {
              setState(() {
                quantity--;
              });
            }
          },
        ),
        Text(quantity.toString(), style: TextStyle(fontSize: screenWidth * 0.04)), // Responsive font size
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
        ),
      ],
    );
  }
}
