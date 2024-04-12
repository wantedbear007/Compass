import 'package:compass/widgets/products_container.dart';
import 'package:flutter/material.dart';

class RegisteredProducts extends StatelessWidget {
  const RegisteredProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registered Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),

        child: Column(

          children: [
            // RegisteredProducts(),
            // RegisteredProducts(),
            ProductContainer(),
            ProductContainer(),
            ProductContainer(),

          ],
        ),
      ),
    );
  }
}
