import 'package:compass/screens/register/register_product_controller.dart';
import 'package:compass/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class RegisterProduct extends GetView<RegisterProductController> {
  const RegisterProduct({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () async {
                  await controller.registerProduct();
                },
                child: const Text("Register"),
              ))
        ],
        title: const Text(
          "Register new Product",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Obx(() => controller.uploading.value
              ? const LinearProgressIndicator()
              : const SizedBox()),
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

          // DatePickerDialog(
          //   initialDate: DateTime.now(),
          //   initialEntryMode: DatePickerEntryMode.calendarOnly,
          //   // firstDate: DateTime(2024),
          //   firstDate: DateTime.now(),
          //   lastDate: DateTime.now().add(const Duration(days: 10 * 365)),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 22,
              vertical: 5,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Expire Date",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      // color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                TextField(
                  controller: controller.expireController,
                  onTap: () {
                    controller.selectDate(context);
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: "Select Date",
                    hintStyle: TextStyle(fontSize: 13),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                )
                // Container(
                //   // margin: EdgeInsets.all(18),
                //   decoration: BoxDecoration(
                //     color: Theme.of(context).colorScheme.secondaryContainer,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   // padding: EdgeInsets.symmetric(
                //   //     horizontal: MediaQuery.of(context).size.width / 22,
                //   //     vertical: 5),
                //
                //   child: FormBuilderDateTimePicker(
                //     firstDate: DateTime.now(),
                //     fieldHintText: "hello",
                //     textAlign: TextAlign.center,
                //     initialDate: DateTime.now(),
                //     name: "hello",
                //     inputType: InputType.date,
                //     helpText: "Select date",
                //     onChanged: (val) {
                //       print(val);
                //     },
                //     resetIcon: Icon(Icons.cabin),
                //   ),
                // ),
              ],
            ),
          ),
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
              hintText: "Enter your product region",
              inputLabelText: "Product Region",
              textInputType: TextInputType.text),
          TextInputField(
              textController: controller.categoryController,
              hintText: "Enter your product Category",
              inputLabelText: "Category",
              textInputType: TextInputType.text)
        ],
      ),
    );
  }
}
