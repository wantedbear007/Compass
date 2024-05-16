import 'package:compass/models/product_model.dart';
import 'package:compass/screens/registeredProducts/registered_products_controller.dart';
import 'package:compass/widgets/products_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisteredProducts extends StatefulWidget {
  @override
  const RegisteredProducts({super.key});

  @override
  State<RegisteredProducts> createState() => _RegisteredProductsState();
}

class _RegisteredProductsState extends State<RegisteredProducts> {
  @override
  Widget build(BuildContext context) {
    final RegisteredProductsController controller =
        Get.put(RegisteredProductsController());

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
                setState(() {

                });
              },
              icon: Icon(Icons.refresh)),
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

      body: Center(
        child: FutureBuilder<List<ProductModel>>(
          future: controller.getProducts(),
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
  }
}
