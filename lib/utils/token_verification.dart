//
// Get.defaultDialog(
// titleStyle: const TextStyle(fontWeight: FontWeight.bold),
// title: "Compass",
// middleText: "Internal server error.",
// confirm: MaterialButton(
// onPressed: () async {
// await localStorageServices.removeFromLocal("token");
// Get.offAll(const LoginScreen());
// },
// child: const Text("Login again"),
// ),
// );

import "package:compass/screens/login/login_screen.dart";
import "package:compass/utils/api_services.dart";
import "package:get/get.dart";
import "package:flutter/material.dart";

Future<void> tokenDialog() async {
  return Get.defaultDialog(
    titleStyle: const TextStyle(fontWeight: FontWeight.bold),
    title: "Authentication Error",
    middleText: "Invalid login found, try logging in again.",
    confirm: MaterialButton(
      onPressed: () async {
        await localStorageServices.removeFromLocal("token");
        Get.offAll(const LoginScreen());
      },
      child: const Text("Login again"),
    ),
  );
}
