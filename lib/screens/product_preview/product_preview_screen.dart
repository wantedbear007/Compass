import 'package:cached_network_image/cached_network_image.dart';
import 'package:compass/models/bar_code_response_model.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Colors.red, Theme.of(context).primaryColor],
            ).createShader(bounds);
          },
          child: Text(
            "$appName Attest ".toUpperCase(),
            style: TextStyle(
              // fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              // color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
                // fit: BoxFit.cover,
                height: 200,
                width: 200,
                // placeholder: (Context, url) => CircularProgressIndicator(),
                imageUrl:
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
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor.withAlpha(40),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productDetail("Product name: ", barCodeProduct.name ?? 'NA'),
                  productDetail("Product BarCode: ", barCodeProduct.ean.toString()),
                  productDetail("Product Description: ", barCodeProduct.description ?? 'NA'),
                  productDetail("Product Region: ", barCodeProduct.region ?? 'NA'),
                  productDetail("Product Brand: ", barCodeProduct.brand ?? 'NA'),
                  productDetail("Product Category: ", barCodeProduct.category ?? 'NA'),
                  //
                  // Text("Product name: ${barCodeProduct.name ?? 'NA'}"),
                  // Text("Unique BarCode ID: ${barCodeProduct.ean.toString() ?? 'NA'}"),
                  // Text("Product description: ${barCodeProduct.description ?? 'NA'}"),
                  // Text("Product Region: ${barCodeProduct.region ?? 'NA'}"),
                  // Text("Product brand: ${barCodeProduct.brand ?? 'NA'}"),
                  // Text("Product category: ${barCodeProduct.category ?? 'NA'}"),
                ],
              ),
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.all(10.0),
          //   child: Container(
          //     padding: EdgeInsets.all(34),
          //     height: 450,
          //     decoration: BoxDecoration(
          //       color: Theme.of(context).disabledColor.withAlpha(40),
          //       borderRadius: const BorderRadius.all(Radius.circular(30)),
          //     ),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: [
          //         Text("Product name: \n ${barCodeProduct.name} ?? 'NA'"),
          //         Text(
          //             "Unique BarCode ID: \n ${barCodeProduct.ean.toString()}"),
          //         Text(
          //             "Product description: \n ${barCodeProduct.description} ?? 'NA'"),
          //         Text("Product Region: \n ${barCodeProduct.region} ?? 'NA'"),
          //         Text("Product brand: \n ${barCodeProduct.brand} ?? 'NA'"),
          //         Text(
          //             "Product category: \n ${barCodeProduct.category} ?? 'NA'"),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
