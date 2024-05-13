import 'package:compass/screens/register/register_product_controller.dart';
import 'package:compass/widgets/material_button.dart';
import 'package:compass/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/state_manager.dart';

class RegisterProduct extends GetView<RegisterProductController> {
  const RegisterProduct({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _barcodeController = TextEditingController();
    TextEditingController _productnameController = TextEditingController();
    TextEditingController _quantityController = TextEditingController();
    TextEditingController _expireController = TextEditingController();
    TextEditingController _categoryController = TextEditingController();
    TextEditingController _manafacturerController = TextEditingController();
    TextEditingController _imageController = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.scanBarCode(context);
        },
        icon: const Icon(Icons.add),
        label: const Text("Scan BarCode"),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  controller.getData();
                },
                child: const Text("Register"),
              ))
        ],
        title: const Text(
          "Add Entry",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          TextInputField(
              textController: controller.barcodeController,
              hintText: "Enter your unique barCode",
              inputLabelText: "BarCode ID",
              textInputType: TextInputType.text),
          TextInputField(
              textController: controller.nameController,
              hintText: "Enter your product name",
              inputLabelText: "Product name",
              textInputType: TextInputType.text),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 22,
              vertical: 5,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    "Expire Date",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: MediaQuery.of(context).size.width / 22,
                  //     vertical: 5),

                  child: FormBuilderDateTimePicker(
                    firstDate: DateTime.now(),
                    fieldHintText: "hello",
                    textAlign: TextAlign.center,
                    initialDate: DateTime.now(),
                    name: "hello",
                    inputType: InputType.date,
                    helpText: "Select date",
                    onChanged: (val) {
                      print(val);
                    },
                    resetIcon: Icon(Icons.cabin),
                  ),
                ),
              ],
            ),
          ),
          // Note: image cannot be taken from user
          // TextInputField(
          //   textController: _imageController,
          //   hintText: "Enter your image URL",
          //   inputLabelText: "Image URL",
          //   textInputType: TextInputType.url,
          // ),
          TextInputField(
            textController: controller.brandController,
            hintText: "Enter your product brand name",
            inputLabelText: "Product Brand",
            textInputType: TextInputType.text,
          ),
          TextInputField(
              textController: controller.descriptionController,
              hintText: "Product description",
              inputLabelText: "Description",
              textInputType: TextInputType.text),
          TextInputField(
              textController: controller.regionController,
              hintText: "Product Region",
              inputLabelText: "Enter your product region",
              textInputType: TextInputType.text),
          TextInputField(
              textController: controller.categoryController,
              hintText: "Category",
              inputLabelText: "Enter your product Category",
              textInputType: TextInputType.text)
        ],
      ),
    );
  }
}
