import 'package:cached_network_image/cached_network_image.dart';
import 'package:compass/models/product_model.dart';
import 'package:compass/models/products_model_old.dart';
import 'package:compass/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final ProductModel productData;

  const ProductContainer({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(productData.expireDate.toString());
    final String date = "${dateTime.month} / ${dateTime.year}";
    // if (kDebugMode) {
    //   print(productData.createdDate);
    // }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(appBorderRadius),
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      height: 500,
      child: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(appBorderRadius),
                    topRight: Radius.circular(appBorderRadius)),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: productData.imageUrl,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 2,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    progressIndicatorBuilder: (context, url, progress) =>
                        LinearProgressIndicator(
                          value: progress.progress,
                        )
                    // progressIndicatorBuilder: ,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 6, left: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "${productData.name}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.visible,

                          // softWrap: true,
                          // maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 6, left: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text("Category: ${productData.category} ")),

                    Expanded(child: Text("By: ${productData.brand}")),

                    // Expanded(child: Text("Category: ${productData.category!} • ")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 6, left: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "ID: ${productData.barCodeId} ",
                        overflow: TextOverflow.ellipsis,
                        // softWrap: true,
                        style:
                            TextStyle(color: Theme.of(context).disabledColor),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Quantity: 0 ",
                        overflow: TextOverflow.ellipsis,
                        // softWrap: true,
                        style:
                            TextStyle(color: Theme.of(context).disabledColor),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 6, left: 6),
                child: Text(
                  "Expiring Date: ${date}",
                  overflow: TextOverflow.ellipsis,
                  // softWrap: true,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              MaterialButton(
                height: 40,
                minWidth: constraints.maxWidth - 6,
                color: Theme.of(context).colorScheme.inversePrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(appBorderRadius)),
                onPressed: () {},
                child: const Text("Mark as Out of Stock"),
              )
            ],
          );
        },
      ),
    );
  }
}
