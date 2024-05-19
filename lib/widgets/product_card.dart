import 'package:cached_network_image/cached_network_image.dart';
import 'package:compass/models/product_model.dart';
import 'package:compass/utils/central_controller.dart';
import 'package:compass/widgets/detail_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({super.key, required this.productModel});

  // custom buttons
  Widget materialButton(
      Color btnColor, VoidCallback onPress, String buttonText) {
    return Expanded(
        child: MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      onPressed: onPress,
      color: btnColor,
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final CentralController centralController = Get.put(CentralController());

    final String date = productModel.expireDate.toString();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
        child: Card(
          elevation: 5,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        // placeholder: (Context, url) => CircularProgressIndicator(),
                        imageUrl: productModel.imageUrl ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRybZIzgdp2Mrd97EXBjZToWdKB01KSQR9waE4TMD7img&s",
                        // width: constraints.maxWidth,
                        height: 200,
                        width: 400,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        progressIndicatorBuilder: (context, url, progress) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: LinearProgressIndicator(
                                value: progress.progress,
                              ),
                            )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  productModel.name ?? "NA",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(),
                Text(
                  "Expiry Date • $date",
                  style: const TextStyle(color: Colors.red),
                ),
                Text("Category • ${productModel.category}"),
                Text("Manufacturer • ${productModel.brand}"),
                Text("BarCode • ${productModel.barCodeId}"),
                Text(
                  "Description • ${productModel.description}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Theme.of(context).disabledColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    materialButton(Colors.red, () async {
                      await centralController.deleteDialog(
                          productModel.id!, productModel.name!);
                    }, "Mark as Out of Stock"),
                    const SizedBox(
                      width: 10,
                    ),
                    materialButton(Theme.of(context).colorScheme.primary, () {
                      Get.to(DetailProduct(productModel: productModel));
                    }, "Details"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
