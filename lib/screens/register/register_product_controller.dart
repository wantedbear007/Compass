import 'package:compass/utils/api_services.dart';
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

//   testing out function
  void printName(BuildContext context) async {
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
    }

    // if (barCode == "") {
    //   Get.defaultDialog(title: "Compass" ,onConfirm: () => Text("hello"),);
    // }

    await getBarCodeData(barCode);
    // Get.put(SimpleBarcodeScannerPage());
  }
}
