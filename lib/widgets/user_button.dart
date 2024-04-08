import 'package:compass/utils/constants.dart';
import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  final String buttonText;

  const UserButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("hello");
      },
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(appBorderRadius),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius:
                const BorderRadius.all(Radius.circular(appBorderRadius))),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
