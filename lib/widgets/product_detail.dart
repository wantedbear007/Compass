import 'package:flutter/material.dart';

Widget productDetail(String titleText, String subtitle) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text(
      titleText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    Text(
      subtitle,
      style: const TextStyle(fontSize: 15),
    ),
    SizedBox(
      height: 20,
    )
  ]);
}
