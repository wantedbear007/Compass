import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/token_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CentralController extends GetxController {
//   delete product confirm
  Future<void> deleteDialog(int productId, String name) async {
    Get.defaultDialog(
        title: "Product Delete Request",
        titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        middleText: "Are you sure want to delete $name ?",
        confirm: MaterialButton(
          onPressed: () async {
            await deleteNow(productId);

            // Get.back();
          },
          child: const Text("Delete"),
        ),
        cancel: MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel"),
        ));
  }

//   delete product
  Future<bool> deleteNow(int productId) async {
    String? token = await localStorageServices.getFromLocal<String>("token");

    if (token == null) {
      tokenDialog();
      return false;
    }

    bool isDeleted = await deleteProduct(token, productId);

    if (isDeleted == true) {
      Get.back();
      Get.snackbar(appName, "Delete product requested.");
      // Get.back();
      return true;
    } else {
      Get.snackbar(
        appName,
        "Failed to delete product, Try again.",
      );
      return false;
      // Get.back();
    }
  }
}
