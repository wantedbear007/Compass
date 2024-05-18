import 'package:flutter/material.dart';

class ProductDetailCard extends StatelessWidget {
  final String title;
  final String subTitle;

  const ProductDetailCard(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 13,
          )
        ]);
    ;
  }
}
