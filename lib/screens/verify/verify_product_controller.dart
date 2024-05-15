import 'package:compass/models/bar_code_response_model.dart';
import 'package:compass/screens/product_preview/product_preview_screen.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/dialog_box.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class VerifyProductController extends GetxController {
  // to handle barcode scanning process
  void scanBarCode(BuildContext context) async {
    try {
      String barCode = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SimpleBarcodeScannerPage()));

      if (barCode == '-1') {
        Get.defaultDialog(
            title: "BarCode required",
            middleText: "No barcode were found, try again.",
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Understood"),
              )
            ]);
        return;
      }

      BarCodeProduct? barCodeProduct = await getBarCodeData(barCode);

      if (barCodeProduct == null) {
        compassDialog(
          "BarCode Error",
          "Barcode details not found, try again or enter manually.",
          "Understood",
        );

        return;
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductPreviewScreen(barCodeProduct: barCodeProduct)));
    } catch (err) {
      compassDialog(
        "BarCode Error",
        "Barcode details not found, try again or enter manually.",
        "Understood",
      );
      print("error $err");
    }

   // print("helllo wordl");
  }
}
