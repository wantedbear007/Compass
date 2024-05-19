import 'package:compass/models/product_model.dart';
import 'package:compass/screens/expired/expired_product_controller.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/compass_sliver_appbar.dart';
import 'package:compass/widgets/loading_home.dart';
import 'package:compass/widgets/loading_widget.dart';
import 'package:compass/widgets/product_card.dart';
import 'package:compass/widgets/products_container.dart';
import 'package:compass/widgets/server_error_widget.dart';
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
    final ExpiredProductsController _controller =
        Get.put(ExpiredProductsController());

    //
    // @override
    // void dispose() {
    //   controller.dispose();
    //   super.dispose();
    // }

    return Scaffold(
            body: RefreshIndicator(
      onRefresh: () async {
        await _controller.getExpiredProducts();
        setState(() {});
      },
      child: CustomScrollView(
        slivers: [
          const CompassSliverAppBar(
              title: "Expired Products", assetName: customVectorBackground0),
          FutureBuilder<List<ProductModel>>(
            future: _controller.getExpiredProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverFillRemaining(
                  child: LoadingWidget(),
                );
              } else if (snapshot.hasError) {
                return const SliverFillRemaining(
                    child: CustomErrorWidget(
                        assetName: serverErrorSvg,
                        subtitle:
                            "Oops, seems like server is busy, Try again."));
              } else if (snapshot.data!.isEmpty) {
                return const SliverFillRemaining(
                  child: CustomErrorWidget(
                      assetName: noItemsSvg,
                      subtitle: "No expired product in your Inventory."),
                );
              } else {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final product = snapshot.data![index];
                    return ProductCard(productModel: product);
                  },
                  childCount: snapshot.data?.length,
                ));
              }
            },
          )
        ],
      ),
    ))

        // return Scaffold(
        //   appBar: AppBar(
        //     title: const Text(
        //       "Expired Products",
        //       style: TextStyle(fontWeight: FontWeight.bold),
        //     ),
        //     actions: [
        //       IconButton(
        //           onPressed: () {
        //             Get.to(const HomeLoading());
        //           },
        //           icon: Icon(Icons.near_me)),
        //       IconButton(
        //           onPressed: () {
        //             controller.getExpiredProducts();
        //
        //             setState(() {});
        //           },
        //           icon: Icon(Icons.refresh)),
        //     ],
        //   ),
        //   body: Center(
        //     child: FutureBuilder<List<ProductModel>>(
        //       future: controller.getExpiredProducts(),
        //       builder: (context, snapshot) {
        //         // print(snapshot.data.toString());
        //         if (snapshot.connectionState == ConnectionState.waiting) {
        //           return const CircularProgressIndicator();
        //         } else if (snapshot.hasError) {
        //           return const Center(child: Text("Internal server error"));
        //         } else {
        //           final pro = snapshot.data;
        //           // print(pro.)
        //           return ListView.builder(
        //               itemCount: pro?.length,
        //               itemBuilder: (context, index) {
        //                 // print(pro?[index]);
        //                 final products = pro?[index];
        //                 // print(products?.expireDate.toLocal().toString());
        //                 // final products = pro?[index];
        //                 // return Text("helloooo");
        //                 return Padding(
        //                   padding: const EdgeInsets.symmetric(horizontal: 0),
        //                   child: ProductContainer(
        //                     productData: products!,
        //                   ),
        //                 );
        //               });
        //         }
        //       },
        //     ),
        //   ),
        // );
        ;
  }
}
