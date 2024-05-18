import 'package:compass/models/product_model.dart';
import 'package:compass/screens/search/search_screen_controller.dart';
import 'package:compass/utils/central_controller.dart';
import 'package:compass/widgets/loading_widget.dart';
import 'package:compass/widgets/server_error_widget.dart';
import 'package:compass/widgets/small_product_card.dart';
import 'package:compass/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchScreenController _searchScreenController =
      Get.put(SearchScreenController());

  @override
  void dispose() {
    _searchScreenController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchScreenController.searchProducts();
  }

  @override
  Widget build(BuildContext context) {
    // GETX controller

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 10,
            collapsedHeight: 110,
            pinned: true,
            floating: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              expandedTitleScale: 1.3,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Search",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  PhysicalModel(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                    elevation: 20.0,
                    shadowColor: Theme.of(context).primaryColor,
                    child: TextField(
                      // maxLength: 1,
                      maxLines: 1,
                      onTapOutside: (PointerDownEvent eve) {
                        FocusScope.of(context).unfocus();
                      },
                      keyboardType: TextInputType.number,
                      controller: _searchScreenController.barCodeController,
                      decoration: InputDecoration(
                        // fillColor:
                        //     Theme.of(context).disabledColor.withAlpha(70),
                        labelStyle: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).cardColor.withAlpha(100)),
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                        hintText: "Enter Product barCode...",
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            await _searchScreenController.searchProducts();
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.search,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              background: Container(
                child: SvgPicture.asset("assets/search2.svg"),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).primaryColor.withAlpha(50),
                      Theme.of(context).cardColor
                      // Theme.of(context).primaryColor,
                    ],
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder<List<ProductModel>>(
            future: _searchScreenController.searchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverFillRemaining(
                  child: LoadingWidget(),
                ); // Centered progress indicator
              } else if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: CustomErrorWidget(
                      assetName: "server.svg",
                      subtitle: "Oops, seems like server is busy, Try again."),
                ); // Handle errors
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SliverFillRemaining(
                  child: CustomErrorWidget(
                      assetName: "notFound.svg",
                      subtitle: "No match found, Check BarCode."),
                ); // Handle empty data
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final product = snapshot.data![index];
                      return SmallProductCard(
                        imageUrl: product.imageUrl!,
                        productName: product.name!,
                        barCode: product.barCodeId!,
                        productId: product.id!,
                      );
                    },
                    childCount: snapshot.data!
                        .length, // Dynamic child count based on data length
                  ),
                );
              }
            },
          ),
          // StreamBuilder<List<ProductModel>>(
          //   stream: _searchScreenController.productStream,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const SliverFillRemaining(
          //         child: LoadingWidget(),
          //       ); // Centered progress indicator
          //     } else if (snapshot.hasError) {
          //       return SliverFillRemaining(
          //         child: CustomErrorWidget(
          //           assetName: "server.svg",
          //           subtitle: "Oops, seems like server is busy, Try again.",
          //         ),
          //       ); // Handle errors
          //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //       return SliverFillRemaining(
          //         child: CustomErrorWidget(
          //           assetName: "notFound.svg",
          //           subtitle: "No match found, Check BarCode.",
          //         ),
          //       ); // Handle empty data
          //     } else {
          //       return SliverList(
          //         delegate: SliverChildBuilderDelegate(
          //           (BuildContext context, int index) {
          //             final product = snapshot.data![index];
          //             return SmallProductCard(
          //               imageUrl: product.imageUrl!,
          //               productName: product.name!,
          //               barCode: product.barCodeId!,
          //               productId: product.id!,
          //             );
          //           },
          //           childCount: snapshot.data!
          //               .length, // Dynamic child count based on data length
          //         ),
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
