import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final String inputLabelText;
  final TextInputType textInputType;

  // final IconData icon;

  const TextInputField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.inputLabelText,
    required this.textInputType,
    // required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 9, vertical: 5),
      // padding: EdgeInsets.symmetric(MediaQuery.of(context).size.width / 9),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputLabelText,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              border: InputBorder.none,
              suffixIcon: Icon(Icons.read_more),
              fillColor: Theme.of(context).colorScheme.secondaryContainer,
              hintStyle: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
