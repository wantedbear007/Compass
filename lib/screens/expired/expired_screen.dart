import 'package:compass/models/product_model.dart';
import 'package:compass/screens/expired/expired_product_controller.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/compass_sliver_appbar.dart';
import 'package:compass/widgets/loading_widget.dart';
import 'package:compass/widgets/product_card.dart';
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
    final ExpiredProductsController controller =
        Get.put(ExpiredProductsController());

    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        await controller.getExpiredProducts();
        setState(() {});
      },
      child: CustomScrollView(
        slivers: [
          const CompassSliverAppBar(
              title: "Expired Products", assetName: customVectorBackground0),
          FutureBuilder<List<ProductModel>>(
            future: controller.getExpiredProducts(),
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
    ));
  }
}
