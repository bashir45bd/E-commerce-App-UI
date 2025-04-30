import 'package:flutter/material.dart';

class PaymentGatewayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDC1E76),
        foregroundColor: Colors.white,// Primary Color
        title: Text("Secure Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Payment Method", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildPaymentMethod("Credit/Debit Card"),
              SizedBox(height: 10),
              _buildPaymentMethod("PayPal"),
              SizedBox(height: 10),
              _buildPaymentMethod("Google Pay"),
              SizedBox(height: 20),

              // SSL Payment Details Section
              Text("Payment Details (SSL Secure)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildCardInfoField("Card Number"),
              SizedBox(height: 10),
              _buildCardInfoField("Cardholder Name"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildCardInfoField("Expiry Date")),
                  SizedBox(width: 10),
                  Expanded(child: _buildCardInfoField("CVV")),
                ],
              ),
              SizedBox(height: 10),

              // Terms and Conditions
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {
                    // Handle checkbox state
                  }),
                  Expanded(child: Text("I agree to the Terms and Conditions")),
                ],
              ),
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
                  // Process payment
                },
                child: Text("Pay Now", style: TextStyle(fontSize: 18,color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Payment Method
  Widget _buildPaymentMethod(String method) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(method),
        leading: Radio<String>(
          value: method,
          groupValue: "paymentMethod", // Manage selected method state
          onChanged: (value) {
            // Handle payment method selection
          },
        ),
      ),
    );
  }

  // Widget for Card Info Field
  Widget _buildCardInfoField(String hintText) {
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
