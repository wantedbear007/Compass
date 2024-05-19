import 'package:cached_network_image/cached_network_image.dart';
import 'package:compass/models/product_model.dart';
import 'package:compass/widgets/product_detail.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final ProductModel productModel;

  const DetailProduct({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          productModel.name ?? "NA",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // letterSpacing: 1,
            // color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
              fit: BoxFit.cover,
              height: 200,
              imageUrl: productModel.imageUrl ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRybZIzgdp2Mrd97EXBjZToWdKB01KSQR9waE4TMD7img&s",
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: LinearProgressIndicator(
                      value: progress.progress,
                    ),
                  )
              // progressIndicatorBuilder: ,
              ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Product Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor.withAlpha(40),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailCard(
                      title: "Product name: ",
                      subTitle: productModel.name ?? 'NA'),
                  ProductDetailCard(
                      title: "Product BarCode: ",
                      subTitle: productModel.barCodeId.toString()),
                  ProductDetailCard(
                      title: "Product Expiry Date: ",
                      subTitle: productModel.expireDate ?? "NA"),
                  ProductDetailCard(
                      title: "Product Region: ",
                      subTitle: productModel.region ?? 'NA'),
                  ProductDetailCard(
                      title: "Product Brand: ",
                      subTitle: productModel.brand ?? 'NA'),
                  ProductDetailCard(
                      title: "Product Category: ",
                      subTitle: productModel.category ?? 'NA'),
                  ProductDetailCard(
                      title: "Product Description: ",
                      subTitle: productModel.description ?? 'NA'),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
