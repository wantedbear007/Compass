import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final TextInputType textInputType;

  // final IconData icon;

  const TextInputField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.textInputType,
    // required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 13),
      ),
    );
  }
}
