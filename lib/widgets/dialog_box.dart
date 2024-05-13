import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future compassDialog(
  String title,
  String subTitle,
  String buttonText,
  // BuildContext ctx,
) {
  return Get.defaultDialog(
      title: title,
      middleText: subTitle,
      confirm: MaterialButton(
        onPressed: () {
          Get.back();
        },
        child: Text(buttonText),
      ));
}
