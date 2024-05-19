import 'package:cached_network_image/cached_network_image.dart';
import 'package:compass/utils/central_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String barCode;
  final int productId;

  const SmallProductCard(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.barCode,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    final CentralController centralController = Get.put(CentralController());
    // SearchScreenController _searchScreenController =
    //     Get.put(SearchScreenController());

    return Card(
      child: ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            centralController.deleteDialog(productId, productName);
            // _searchScreenController.deleteProductFromList(productId);
            // _searchScreenController.searchProducts();
          },
        ),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 50,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) =>
                  const CircularProgressIndicator(),
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
