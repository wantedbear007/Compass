import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:compass/models/product_model.dart';
import 'package:compass/screens/registeredProducts/registered_products_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class ProductContainer extends StatelessWidget {
  final ProductModel productData;

  const ProductContainer({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    final RegisteredProductsController controller =
        Get.put(RegisteredProductsController());
    final String date = productData.expireDate.toString();
    // if (kDebugMode) {
    //   print(productData.createdDate);
    // }

    return Column(
      children: [
        const Divider(),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 550,
          child: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "${productData.name}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                                overflow: TextOverflow.visible,

                                // softWrap: true,
                                // maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CachedNetworkImage(
                      fit: BoxFit.cover,
                      // placeholder: (Context, url) => CircularProgressIndicator(),
                      imageUrl: productData.imageUrl ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRybZIzgdp2Mrd97EXBjZToWdKB01KSQR9waE4TMD7img&s",
                      width: constraints.maxWidth,
                      height: constraints.maxHeight / 2,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      progressIndicatorBuilder: (context, url, progress) =>
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: LinearProgressIndicator(
                              value: progress.progress,
                            ),
                          )
                      // progressIndicatorBuilder: ,
                      ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text("Category: ${productData.category} ")),

                        Expanded(child: Text("By: ${productData.brand}")),

                        // Expanded(child: Text("Category: ${productData.category!} • ")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "ID: ${productData.barCodeId} ",
                            overflow: TextOverflow.ellipsis,
                            // softWrap: true,
                            style: TextStyle(
                                color: Theme.of(context).disabledColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Registered on: ${productData.createdDate?.substring(0, 10)}",
                            overflow: TextOverflow.ellipsis,
                            // softWrap: true,
                            style: TextStyle(
                                color: Theme.of(context).disabledColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    child: Text(
                      "Expiring Date: ${date}",
                      overflow: TextOverflow.ellipsis,
                      // softWrap: true,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "Description: ${productData.description} ",
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 3,
                    ),
                  )),
                  MaterialButton(
                    height: 50,
                    minWidth: constraints.maxWidth,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(appBorderRadius)),
                    onPressed: () async {
                      print("started");



                      await controller.deleteProduct(productData.id.toString());
                      print("deleted");
                    },
                    child: const Text("Mark as Out of Stock"),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
