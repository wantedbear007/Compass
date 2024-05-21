import 'package:compass/models/bar_code_response_model.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/token_verification.dart';
import 'package:compass/utils/utils.dart';
import 'package:compass/widgets/dialog_box.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class RegisterProductController extends GetxController {
  RxBool loading = true.obs;
  RxBool uploading = false.obs;

  TextEditingController barcodeController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController expireController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  DateTime? _selectedDate = DateTime.now();

  @override
  void onInit() {
    expireController.text = DateTime.now().toString().split(" ")[0];
    super.onInit();
  }

  @override
  void onClose() {
    // barcodeController.dispose();
    // brandController.dispose();
    // categoryController.dispose();
    // descriptionController.dispose();
    // nameController.dispose();
    // nameController.dispose();
    // expireController.dispose();
    // regionController.dispose();
    // imageController.dispose();
    super.onClose();
  }

  // to select date
  Future<void> selectDate(BuildContext context) async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 10 * 365)),
    );

    if (_selectedDate == null) {
      compassDialog("Date Selection", "No date selected, try again. ", "Okay");
      return;
    }

    expireController.text = _selectedDate.toString().split(" ")[0];
  }

  // to open and get data from barcode
  void scanBarCode(BuildContext context) async {
    if (uploading.value == true) {
      compassDialog(appName, "Product registration in progress, wait.", "Okay");
    }

    uploading.value = true;
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
      uploading.value = false;
      return;
    }

    BarCodeProduct? barCodeProduct = await getBarCodeData(barCode);

    if (barCodeProduct == null) {
      compassDialog(
        "BarCode Error",
        "Barcode details not found, try again or enter manually.",
        "Understood",
      );

      uploading.value = false;

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
    uploading.value = false;
  }

//   to register product
  Future<void> registerProduct() async {
    uploading.value = true;

    if (nameController.text.isEmpty ||
        barcodeController.text.isEmpty ||
        brandController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        regionController.text.isEmpty ||
        imageController.text.isEmpty ||
        categoryController.text.isEmpty ||
        expireController.text.isEmpty) {
      compassDialog("Compass", "All fields required", "Okay");
      uploading.value = false;

      return;
    }
    String? token = await LocalStorageServices().getFromLocal("token");

    if (token == null) {
      tokenDialog();
      uploading.value = false;
      return;
    }

    try {
      await registerNewProduct(
          nameController.text,
          barcodeController.text,
          brandController.text,
          descriptionController.text,
          regionController.text,
          imageController.text,
          categoryController.text,
          expireController.text,
          token);

      nameController.clear();
      barcodeController.clear();
      brandController.clear();
      descriptionController.clear();
      regionController.clear();
      imageController.clear();
      categoryController.clear();
      expireController.clear();
      uploading.value = false;
    } catch (err) {
      uploading.value = false;

      if (kDebugMode) {
        print("error occurred in register product $err");
      }
    }
  }
}
