import 'package:compass/widgets/products_container.dart';
import 'package:flutter/material.dart';

class ExpiringProductScreen extends StatelessWidget {
  const ExpiringProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expiring Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: ListView(
          children: [
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),
          ],
        ),
      ),
    );
  }
}
