import 'dart:async';

import 'package:compass/models/product_model.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/token_verification.dart';
import 'package:compass/widgets/dialog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class SearchScreenController extends GetxController {
  RxBool loading = true.obs;
  // final StreamController<List<ProductModel>> _productController =
  //     StreamController();
  //
  // Stream<List<ProductModel>> get productStream => _productController.stream;
  TextEditingController barCodeController = TextEditingController();

  @override
  void dispose() {
    barCodeController.dispose();
    // _productController.close();

    super.dispose();
  }

//   to search items
  Future<List<ProductModel>> searchProducts() async {
    // loading.value = !loading.value;
    String? token = await localStorageServices.getFromLocal<String>("token");

    if (token == null) {
      tokenDialog();
      // _productController.add([]);
      return [];
    }

    // try {
    //   final product = await searchProduct(token, barCodeController.text);
    //   // _productController.add(product);
    //   return;
    // } catch (err) {
    //   // _productController.add([]);
    // }

    return await searchProduct(token, barCodeController.text);
  }

//   delete product from memory
  void deleteProductFromList(int productId) async {
    // final List<ProductModel> currentProducts = _productController.stream.reactive?? [];

    // // Filter out the product with the given ID
    // final updatedProducts = productStream.where((product) => productId
    //     != productId).toList();
    //
    // // Emit the updated list of products to the stream
    // _productController.add(updatedProducts as List<ProductModel>);
    // // final updatedList = await productStream.where((product) => productId != productId).toList();
    // _productController.add(updatedList.cast<ProductModel>());
    // final List<ProductModel> products = productStream ?? [];
  }
}
