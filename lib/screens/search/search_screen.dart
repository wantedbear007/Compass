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

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              expandedTitleScale: 1.3,
              title: TextField(
                keyboardType: TextInputType.number,
                controller: searchScreenController.barCodeController,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).primaryColor.withAlpha(50),
                  labelStyle: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).cardColor.withAlpha(100)),
                  hintStyle: TextStyle(
                      fontSize: 12, color: Theme.of(context).cardColor),
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
                      await searchScreenController.searchProducts();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
              ),
              background: Container(
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
          FutureBuilder<List<ProductModel>>(
            future: searchScreenController.searchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ); // Centered progress indicator
              } else if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: Center(child: Text('Error: ${snapshot.error}')),
                ); // Handle errors
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SliverFillRemaining(
                  child: Center(child: Text('No products found')),
                ); // Handle empty data
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final product = snapshot.data![index];
                      return SmallProductCard(imageUrl: product.imageUrl!, productName: product.name!, barCode: product.barCodeId!);
                    },
                    childCount: snapshot.data!
                        .length, // Dynamic child count based on data length
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
