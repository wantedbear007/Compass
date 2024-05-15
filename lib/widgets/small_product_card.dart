import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SmallProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String barCode;

  const SmallProductCard(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.barCode});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 50,
            )),
        title: Text(
          productName,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          "BarCode ID: $barCode",
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
