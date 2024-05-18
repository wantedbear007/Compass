import 'package:cached_network_image/cached_network_image.dart';
import 'package:compass/models/bar_code_response_model.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/product_detail.dart';
import 'package:flutter/material.dart';

class ProductPreviewScreen extends StatelessWidget {
  final BarCodeProduct barCodeProduct;

  const ProductPreviewScreen({
    super.key,
    required this.barCodeProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "$appName Attest ",
          style: TextStyle(
            // fontSize: 25,
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
              imageUrl: barCodeProduct.imageUrl ??
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
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Product Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      subTitle: barCodeProduct.name ?? 'NA'),
                  ProductDetailCard(
                      title: "Product BarCode: ",
                      subTitle: barCodeProduct.ean.toString()),
                  ProductDetailCard(
                      title: "Product Description: ",
                      subTitle: barCodeProduct.description ?? 'NA'),
                  ProductDetailCard(
                      title: "Product Region: ",
                      subTitle: barCodeProduct.region ?? 'NA'),
                  ProductDetailCard(
                      title: "Product Brand: ",
                      subTitle: barCodeProduct.brand ?? 'NA'),
                  ProductDetailCard(
                      title: "Product Category: ",
                      subTitle: barCodeProduct.category ?? 'NA'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
