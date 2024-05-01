import 'package:compass/models/product_model.dart';
import 'package:compass/screens/registeredProducts/registered_products_controller.dart';
import 'package:compass/widgets/products_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class ExpiringProductScreen extends StatefulWidget {
  const ExpiringProductScreen({super.key});

  @override
  State<ExpiringProductScreen> createState() => _ExpiringProductScreenState();
}

class _ExpiringProductScreenState extends State<ExpiringProductScreen> {
  void floatingPress() {}

  @override
  Widget build(BuildContext context) {
    final RegisteredProductsController controller =
        Get.put(RegisteredProductsController());

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
                              controller.getFilteredProducts();
                              // ObxState();
                              setState(() {});

                              Navigator.pop(context);
                            },
                            child: Text(
                              "Select",
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Theme.of(context).colorScheme.primary,
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
        label: Text("Filter"),
        icon: Icon(Icons.filter_list_alt),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Expiring Medicines",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.search))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: Center(
        //     child: Obx(
        //   () => FutureBuilder<List<ProductModel>>(
        //     future: controller.getFilteredProducts(),
        //     builder: (context, snapshot) {
        //       // print(snapshot.data.toString());
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const CircularProgressIndicator();
        //       } else if (snapshot.hasError) {
        //         return Text("error");
        //       } else {
        //         final pro = snapshot.data;
        //         // print(pro.)
        //         return ListView.builder(
        //             itemCount: pro?.length,
        //             itemBuilder: (context, index) {
        //               print(pro?[index]);
        //               final products = pro?[index];
        //               print(products?.expireDate.toLocal().toString());
        //               // final products = pro?[index];
        //               // return Text("helloooo");
        //               return Padding(
        //                 padding: EdgeInsets.symmetric(horizontal: 15),
        //                 child: ProductContainer(
        //                   productData: products!,
        //                 ),
        //               );
        //             });
        //       }
        //     },
        //   ),
        // )

        child: FutureBuilder<List<ProductModel>>(
          future: controller.getFilteredProducts(),
          builder: (context, snapshot) {
            // print(snapshot.data.toString());
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("error");
            } else {
              final pro = snapshot.data;
              // print(pro.)
              return ListView.builder(
                  itemCount: pro?.length,
                  itemBuilder: (context, index) {
                    print(pro?[index]);
                    final products = pro?[index];
                    print(products?.expireDate.toLocal().toString());
                    // final products = pro?[index];
                    // return Text("helloooo");
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ProductContainer(
                        productData: products!,
                      ),
                    );
                  });
            }
          },
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 15),
      //
      //   child: Column(
      //
      //     children: [
      //       // RegisteredProducts(),
      //       // RegisteredProducts(),
      //       ProductContainer(),
      //       ProductContainer(),
      //       ProductContainer(),
      //
      //     ],
      //   ),
      // ),
    );
  }
}
