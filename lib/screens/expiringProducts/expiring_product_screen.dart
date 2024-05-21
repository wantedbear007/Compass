import 'package:compass/models/product_model.dart';
import 'package:compass/screens/registeredProducts/registered_products_controller.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/loading_widget.dart';
import 'package:compass/widgets/product_card.dart';
import 'package:compass/widgets/server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class ExpiringProductScreen extends StatefulWidget {
  const ExpiringProductScreen({super.key});

  @override
  State<ExpiringProductScreen> createState() => _ExpiringProductScreenState();
}

class _ExpiringProductScreenState extends State<ExpiringProductScreen> {
  final RegisteredProductsController controller =
      Get.put(RegisteredProductsController());



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        "Select Months to Expire",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(
                        () => NumberPicker(
                          value: controller.filterValue.value,
                          minValue: 0,
                          itemHeight: 60,
                          maxValue: 24,
                          axis: Axis.horizontal,
                          onChanged: (int value) {
                            controller.filterValue.value = value;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                          MaterialButton(
                            onPressed: () {
                              controller.getFilteredProduct(
                                  controller.filterValue.value);
                              // ObxState();
                              setState(() {});

                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Theme.of(context).colorScheme.primary,
                            child: const Text(
                              "Select",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: const Text("Filter"),
        icon: const Icon(Icons.filter_list_alt),
      ),
      appBar: AppBar(
        title: const Text(
          "Expiring Products",
          style: TextStyle(fontWeight: FontWeight.bold),
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
          //     icon: Icon(Icons.search))
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
          await controller.getFilteredProduct(controller.filterValue.value);
          setState(() {});
        },
        child: FutureBuilder<List<ProductModel>>(
          future: controller.getFilteredProduct(controller.filterValue.value),
          builder: (context, snapshot) {
            // print(snapshot.data.toString());
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LoadingWidget());
              // return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Center(
                  child: CustomErrorWidget(
                      assetName: serverErrorSvg,
                      subtitle: 'Oops, seems like server is busy, Try again.'));
            } else if (snapshot.data!.isEmpty) {
              return const Center(
                child: CustomErrorWidget(
                    assetName: noItemsSvg,
                    subtitle: "No Expiring products in your Inventory"),
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
                      child: ProductCard(productModel: product!),
                      // child: ProductContainer(
                      //   productData: products!,
                      // ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
