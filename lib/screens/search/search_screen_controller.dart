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
  TextEditingController barCodeController = TextEditingController();


//   to search items
  Future<List<ProductModel>> searchProducts() async {

    // if (barCodeController.text.isEmpty && query != "8") {
    //   compassDialog(appName, "Search field cannot be empty.", "Okay");
    // }


    String token = await localStorageServices.getFromLocal("token");

    // print("hello $q");

    return await searchProduct(token, barCodeController.text);
  }
}
