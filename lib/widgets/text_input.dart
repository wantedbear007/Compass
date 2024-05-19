import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final String inputLabelText;
  final TextInputType textInputType;
  final bool isPassword;
  final IconData icon;

  // final IconData icon;

  const TextInputField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.inputLabelText,
    required this.textInputType,
    this.icon = Icons.clear,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 22, vertical: 5),
      // padding: EdgeInsets.symmetric(MediaQuery.of(context).size.width / 9),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              inputLabelText,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextField(
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom * 4),
            obscureText: isPassword,
            controller: textController,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,

              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              // border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {
                  textController.clear();
                },
                icon: Icon(icon),
              ),
              hintStyle: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
