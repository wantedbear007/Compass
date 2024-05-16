import 'package:compass/models/product_model.dart';
import 'package:compass/screens/expired/expired_product_controller.dart';
import 'package:compass/widgets/products_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpiredProductScreen extends StatefulWidget {
  const ExpiredProductScreen({super.key});

  @override
  State<ExpiredProductScreen> createState() => _ExpiredProductScreenState();
}

class _ExpiredProductScreenState extends State<ExpiredProductScreen> {
  @override
  Widget build(BuildContext context) {
    final ExpiredProductsController controller =
        Get.put(ExpiredProductsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expired Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.getExpiredProducts();

                setState(() {});
              },
              icon: Icon(Icons.refresh)),
          // IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: Icon(Icons.search))
        ],
      ),

      body: Center(
        child: FutureBuilder<List<ProductModel>>(
          future: controller.getExpiredProducts(),
          builder: (context, snapshot) {
            // print(snapshot.data.toString());
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Center(child: Text("Internal server error"));
            } else {
              final pro = snapshot.data;
              // print(pro.)
              return ListView.builder(
                  itemCount: pro?.length,
                  itemBuilder: (context, index) {
                    // print(pro?[index]);
                    final products = pro?[index];
                    // print(products?.expireDate.toLocal().toString());
                    // final products = pro?[index];
                    // return Text("helloooo");
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
    ;
  }
}
