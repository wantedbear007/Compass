import 'dart:convert';

import 'package:compass/screens/home/home_screen_controller.dart';
import 'package:compass/screens/landing/landing_page.dart';
import 'package:compass/screens/landing/landing_screen_controller.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/utils.dart';
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
  void onInit()  {
    emailController.text = "prataptechnologies";
    passwordController.text = "9907224577";
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    String username = emailController.text.trim();
    String password = passwordController.text.trim();

    if ((username.isEmpty || password.isEmpty)) {
      Get.snackbar(
          "Authentication Failed", "Username / Password cannot be empty !");
    } else {
      bool isAuth = await checkUser(username, password);

      if (isAuth == true) {
        // Get.snackbar("Compass", "Login Successful");
        Get.put(LandingController());
        Get.put(HomeScreenController());
        Get.offAll(const LandingScreen(), transition: Transition.fadeIn);
      } else {
        Get.snackbar(
            "Authentication Failed", "Enter valid username or password");
      }
    }
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

  // api call
  Future<bool> checkUser(String username, String password) async {
    loading.value = true;

    const String url = api + "auth/login";

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(
              <String, dynamic>{"username": username, "password": password}));

      loading.value = false;

      if (response.statusCode != 200) {
        return false;
      } else {
        // saving token in local storage
        // print(response.body);

        final Map<String, dynamic> details =
            jsonDecode(response.body) as Map<String, dynamic>;

        String token = '"' + details["token"] + '"';
        // print(token);

        // saving token to local storage
        bool isStored = await localStorageServices.saveToLocal("token", token);

        if (!isStored) {
          Get.snackbar("Permission", "Provide Compass with storage permission");
        } else {
          print("token stored successfully");
        }

        String? recToken =
            await localStorageServices.getFromLocal<String>("token");
        saveUserDetails(recToken!);
        return true;
      }
    } catch (err) {
      // print("error occurred");
      // print(err.toString());
      return false;
    }
  }
}
