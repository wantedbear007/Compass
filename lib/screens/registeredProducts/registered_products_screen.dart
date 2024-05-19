import 'package:compass/models/product_model.dart';
import 'package:compass/screens/registeredProducts/registered_products_controller.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/loading_widget.dart';
import 'package:compass/widgets/product_card.dart';
import 'package:compass/widgets/server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisteredProducts extends StatefulWidget {
  @override
  const RegisteredProducts({super.key});

  @override
  State<RegisteredProducts> createState() => _RegisteredProductsState();
}

class _RegisteredProductsState extends State<RegisteredProducts> {

  final RegisteredProductsController controller =
  Get.put(RegisteredProductsController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registered Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.getProducts();
                setState(() {});
              },
              icon: const Icon(Icons.refresh)),
          // IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: const Icon(Icons.search))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getProducts();
          setState(() {});
        },
        child: FutureBuilder<List<ProductModel>>(
          future: controller.getProducts(),
          builder: (context, snapshot) {
            // print(snapshot.data.toString());
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LoadingWidget());
            } else if (snapshot.hasError) {
              return const Center(
                  child: CustomErrorWidget(
                      assetName: serverErrorSvg,
                      subtitle: 'Oops, seems like server is busy, Try again.'));
            } else if (snapshot.data!.isEmpty) {
              return const Center(
                child: CustomErrorWidget(
                    assetName: noItemsSvg,
                    subtitle: "No Registered products in your Inventory"),
              );
            } else {
              final pro = snapshot.data;
              // print(pro.)
              return ListView.builder(
                  itemCount: pro?.length,
                  itemBuilder: (context, index) {
                    // print(pro?[index]);
                    final product = pro?[index];
                    // print(products?.expireDate.toLocal().toString());
                    // final products = pro?[index];
                    // return Text("helloooo");
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ProductCard(
                        productModel: product!,
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
