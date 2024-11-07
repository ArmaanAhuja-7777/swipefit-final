import 'package:flutter/material.dart';
import 'package:swipefit/components/bottom_navbar.dart';
import 'package:swipefit/components/quantity_updater.dart';

class CartPage extends StatelessWidget {

  
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Clear',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              'My Cart',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'FAQs',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtotal section
            Text(
              'Subtotal: \$460',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // List of cart items
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem(
                    context,
                    imageUrl: 'https://example.com/dress1.jpg',
                    title: 'Boucle Mini Dress-Ivory',
                    brand: 'Meshki',
                    price: 205,
                    estimatedArrival: 'Oct 11-Oct 18',
                  ),
                  SizedBox(height: 16),
                  _buildCartItem(
                    context,
                    imageUrl: 'https://example.com/dress2.jpg',
                    title: 'Lilou Ivory Ruffle Dress',
                    brand: 'House of CB',
                    price: 255,
                    estimatedArrival: 'Oct 11-Oct 18',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  BottomNavbar(currIdx: 1)
    );
  }

  Widget _buildCartItem(
    BuildContext context, {
    required String imageUrl,
    required String title,
    required String brand,
    required double price,
    required String estimatedArrival,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),

            // Product details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    brand,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Size:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 8),
                      DropdownButton<String>(
                        items: <String>['S', 'M', 'L', 'XL'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {

                        },
                        hint: Text('Select a size'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  QuantityUpdater(), 
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.local_shipping, color: Colors.grey),
                      SizedBox(width: 8),
                      Text(
                        'Estimated arrival $estimatedArrival',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
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