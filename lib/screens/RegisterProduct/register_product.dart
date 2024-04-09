import 'package:compass/widgets/material_button.dart';
import 'package:compass/widgets/text_input.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text("Scan BarCode"),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Text("Register"),
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
          // TextInputField(textController: _quantityController, hintText: hintText, inputLabelText: inputLabelText, textInputType: textInputType)
        ],
      ),
    );
  }
}
