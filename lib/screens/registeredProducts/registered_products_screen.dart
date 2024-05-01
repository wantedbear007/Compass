import 'package:compass/models/product_model.dart';
import 'package:compass/models/products_model_old.dart';
import 'package:compass/screens/registeredProducts/registered_products_controller.dart';
import 'package:compass/widgets/products_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisteredProducts extends StatelessWidget {
  @override
  const RegisteredProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisteredProductsController controller =
        Get.put(RegisteredProductsController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Registered Medicines",
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
