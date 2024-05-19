import 'package:flutter/material.dart';

class UserMaterialButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonAction;

  const UserMaterialButton(
      {super.key, required this.buttonText, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Material(

      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(

        onTap: buttonAction,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        splashColor: Colors.black38,
        enableFeedback: true,
        // hoverColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      ),
    );
  }
}
