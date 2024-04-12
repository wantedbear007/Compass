import 'package:compass/models/products_model.dart';
import 'package:compass/screens/registeredProducts/registered_products_controller.dart';
import 'package:compass/widgets/products_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisteredProducts extends GetView<RegisteredProductsController> {
  @override
  const RegisteredProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.getProducts();
    // final Controller controller = Get.put(RegisteredProductsController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registered Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("hello");
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
            print(snapshot.data.toString());
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
                    final products = pro?[index];
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
