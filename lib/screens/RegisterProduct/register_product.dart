import 'package:compass/widgets/material_button.dart';
import 'package:compass/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterProduct extends StatelessWidget {
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
        onPressed: () {},
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
                onPressed: () {},
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
              textController: _productnameController,
              hintText: "Enter your product name",
              inputLabelText: "Product name",
              textInputType: TextInputType.text),
          TextInputField(
              textController: _barcodeController,
              hintText: "Enter your unique barCode",
              inputLabelText: "BarCode ID",
              textInputType: TextInputType.text),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 22,
                vertical: 5),
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
          TextInputField(
            textController: _imageController,
            hintText: "Enter your image URL",
            inputLabelText: "Image URL",
            textInputType: TextInputType.url,
          ),
          TextInputField(
            textController: _categoryController,
            hintText: "Enter your Category",
            inputLabelText: "Enter your Category",
            textInputType: TextInputType.text,
          ),
          TextInputField(
              textController: _manafacturerController,
              hintText: "Name of Manafacturer",
              inputLabelText: "Manafacturer",
              textInputType: TextInputType.text)
        ],
      ),
    );
  }
}
