import 'package:compass/models/bar_code_response_model.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/widgets/dialog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class RegisterProductController extends GetxController {
  RxBool loading = true.obs;

  TextEditingController barcodeController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController expireController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

//   void delete
  Future<void> getData() async {}

  // to open and get data from barcode
  void scanBarCode(BuildContext context) async {
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
          context);

      return;
    }

    nameController.text = barCodeProduct.name ?? "NA";
    barcodeController.text = barCode;
    brandController.text = barCodeProduct.brand ?? "NA";
    descriptionController.text = barCodeProduct.description ?? "NA";
    regionController.text = barCodeProduct.region ?? "NA";
    imageController.text = barCodeProduct.imageUrl ??
        "https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgxLTAxNjYtdi1sMWxnZmRxYy5qcGc.jpg";
    categoryController.text = barCodeProduct.category ?? "NA";
  }
}
