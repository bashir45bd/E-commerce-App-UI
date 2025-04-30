import 'package:flutter/material.dart';

import 'Payment.dart';

class BuyNowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDC1E76),
        foregroundColor: Colors.white,// Primary Color
        title: Text("Buy Now"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Section
              Text("User Information", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildUserInfoField("Full Name"),
              SizedBox(height: 10),
              _buildUserInfoField("Email"),
              SizedBox(height: 10),
              _buildUserInfoField("Phone Number"),
              SizedBox(height: 20),

              // Shipping Address Section
              Text("Shipping Address", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildAddressField("Street Address"),
              SizedBox(height: 10),
              _buildAddressField("City"),
              SizedBox(height: 10),
              _buildAddressField("State/Province"),
              SizedBox(height: 10),
              _buildAddressField("Zip/Postal Code"),
              SizedBox(height: 10),
              _buildAddressField("Country"),
              SizedBox(height: 20),

              // Order Summary
              Text("Order Summary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildOrderSummary(),

              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDC1E76), // Primary Color
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaymentGatewayPage()),
                  );
                },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0), // Adds 5 pixels of padding on all sides
                    child: Text(
                      "Payment",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )

              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for User Info Field
  Widget _buildUserInfoField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  // Widget for Address Field
  Widget _buildAddressField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  // Widget for Order Summary
  Widget _buildOrderSummary() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.network(
              'https://siu.edu.bd/storage/uploaded/notice/5_1708275671.jpg', // Replace with product image
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Title", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Quantity: 1", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text("\$99.99", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
