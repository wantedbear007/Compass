import 'package:compass/models/product_model.dart';
import 'package:compass/screens/search/search_screen_controller.dart';
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
  @override
  Widget build(BuildContext context) {
    // GETX controller
    SearchScreenController searchScreenController =
        Get.put(SearchScreenController());

    SearchScreenController controller = Get.put(SearchScreenController());

    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ProductModel>>(
          future: searchScreenController.searchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const CustomErrorWidget(
                  assetName: "server.svg",
                  subtitle:
                      "Oops, Seems like server is busy, Try again later.");
            } else {
              final res = snapshot.data;

              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    // pinned: _pinned,
                    // snap: _snap,
                    floating: true,
                    expandedHeight: 300.0,
                    flexibleSpace: FlexibleSpaceBar(
                      // centerTitle: true,
                      titlePadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      expandedTitleScale: 1.3,
                      // title: Text("hello"),
                      title: TextField(
                        keyboardType: TextInputType.number,
                        controller: controller.barCodeController,
                        decoration: InputDecoration(
                          fillColor:
                              Theme.of(context).primaryColor.withAlpha(50),
                          labelStyle: TextStyle(
                              fontSize: 10,
                              color:
                                  Theme.of(context).cardColor.withAlpha(100)),
                          hintStyle: TextStyle(
                              fontSize: 12, color: Theme.of(context).cardColor),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 3),

                          hintText: "Enter Product barCode...",

                          filled: true,

                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          // border: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              await controller.searchProducts();
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.search,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                          // fillColor: Theme.of(context).colorScheme.secondaryContainer,
                          // hintStyle: const TextStyle(fontSize: 12),
                        ),
                      ),
                      //                     title: SizedBox(
                      // height: 100,
                      //                       child: TextInputField(textController: controller,
                      //                           hintText: "Seach",
                      //                           inputLabelText: "dfgdf",
                      //                           textInputType: TextInputType.text),
                      //                     ),

                      background: Container(
                        // child: Text("hell9"),
                        child: SvgPicture.asset("assets/search2.svg"),

                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).disabledColor
                            ])),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 40,
                            child: res?.length == 0
                                ? Text("No products found. Check BarCode number.")
                                : Text("")
                            // child: Center(
                            //   child: Text(searchScreenController.statusText.value),
                            // ),
                            ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final products = res?[index];

                        if (res == null) {
                          return const Text(
                              "Failed to get product, Try again.");
                        }

                        // if (controller.loading.value == true) {
                        //   return LoadingWidget();
                        // }

                        if (res.isEmpty) {
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
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          );
                        }
                        return SmallProductCard(
                            imageUrl: products?.imageUrl ??
                                "https://images.rawpixel.com/image_400/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA3L2pvYjk1NS0wNjMteC5qcGc.jpg",
                            productName: products?.name ?? "NA",
                            barCode: products?.barCodeId ?? "NA");
                      },
                      childCount: res?.length,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
