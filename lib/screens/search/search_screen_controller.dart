import 'dart:async';

import 'package:compass/models/product_model.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/token_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  RxBool loading = true.obs;

  // final StreamController<List<ProductModel>> _productController =
  //     StreamController();
  //
  // Stream<List<ProductModel>> get productStream => _productController.stream;
  TextEditingController barCodeController = TextEditingController();

  @override
  void onClose() {
    barCodeController.dispose();
    // _productController.close();

    super.onClose();
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

    return await searchProduct(token, barCodeController.text);
  }

//   delete product from memory
  void deleteProductFromList(int productId) async {}
}
