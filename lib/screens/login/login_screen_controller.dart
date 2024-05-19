import 'dart:convert';

import 'package:compass/screens/home/home_screen_controller.dart';
import 'package:compass/screens/landing/landing_page.dart';
import 'package:compass/screens/landing/landing_screen_controller.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController {
  RxBool isAble = false.obs;
  RxBool loading = false.obs;

  final loginFromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LocalStorageServices localStorageServices = LocalStorageServices();

  @override
  void onInit() {
    // emailController.text = "prataptechnologies";
    // passwordController.text = "9907224577";
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // login handler
  Future<void> login() async {
    loading.value = true;
    String username = emailController.text.trim();
    String password = passwordController.text.trim();

    if ((username.isEmpty || password.isEmpty)) {
      Get.snackbar(
          "Authentication Failed", "Username / Password cannot be empty !");
    } else {
      bool isAuth = await loginUser(username, password);

      if (isAuth == true) {
        // Get.snackbar("Compass", "Login Successful");
        // Get.put(LandingController());
        // // Get.put(HomeScreenController());
        // HomeScreenController homeScreenController =
        //     Get.put(HomeScreenController());
        // await homeScreenController.loadUserData();
        // homeScreenController.dispose();
        // emailController.dispose();
        passwordController.clear();
        Get.offAll(() => const LandingScreen(), transition: Transition.fadeIn);
      } else {
        Get.snackbar(
            "Authentication Failed", "Enter valid username or password");
        loading.value = false;
      }
    }
    loading.value = false;
  }

  //
  // validator
  bool validateField(String value) {
    if (value.trim().isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
