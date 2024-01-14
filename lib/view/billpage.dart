import 'package:flutter/material.dart';

class BillScreen extends StatelessWidget {
  final double totalAmount;

  BillScreen({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Amount:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '\$$totalAmount',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform payment logic here
                // You can navigate to a success page or perform any other action
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
