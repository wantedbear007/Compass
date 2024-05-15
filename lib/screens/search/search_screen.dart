import 'package:compass/models/product_model.dart';
import 'package:compass/screens/search/search_screen_controller.dart';
import 'package:compass/widgets/small_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GETX controller
    SearchScreenController searchScreenController =
        Get.put(SearchScreenController());

    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ProductModel>>(
          future: searchScreenController.searchProducts("6949639100016"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Internal error occurred, Try again later."),
              );
            } else {
              final res = snapshot.data;

              if (res!.length <= 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/notFound.svg",
                      width: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "No match found, Check BarCode.",
                      style:
                          TextStyle( fontSize: 15),
                    ),
                  ],
                );
              }
              return ListView.builder(
                  itemCount: res.length,
                  itemBuilder: (context, index) {
                    final products = res[index];
                    // return Text("hello");
                    return SmallProductCard(imageUrl: products.imageUrl ?? "https://images.rawpixel.com/image_400/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA3L2pvYjk1NS0wNjMteC5qcGc.jpg", productName: products.name ?? "NA", barCode: products.barCodeId ?? "NA");
                  });
            }
          },
        ),
      ),
    );

    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: <Widget>[
    //       SliverAppBar(
    //         pinned: true,
    //         // pinned: _pinned,
    //         // snap: _snap,
    //         // floating: _floating,
    //         expandedHeight: 160.0,
    //         flexibleSpace: const FlexibleSpaceBar(
    //           title: Text('SliverAppBar'),
    //           background: FlutterLogo(),
    //         ),
    //       ),
    //       const SliverToBoxAdapter(
    //         child: SizedBox(
    //           height: 20,
    //           child: Center(
    //             child: Text('Scroll to see the SliverAppBar in effect.'),
    //           ),
    //         ),
    //       ),
    //       SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           (BuildContext context, int index) {
    //             return Container(
    //               color: index.isOdd ? Colors.white : Colors.black12,
    //               height: 100.0,
    //               child: Center(
    //                 child:
    //                     Text('$index', textScaler: const TextScaler.linear(5)),
    //               ),
    //             );
    //           },
    //           childCount: 20,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
