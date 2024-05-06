import 'dart:convert';

import 'package:compass/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController {
  RxString name = "bhanu".obs;
  RxBool isAble = false.obs;
  RxBool loading = false.obs;
  final loginFromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // @override
  // void onInit() {
  //      // Simulating obtaining the user name from some local storage
  //      emailController.text = 'foo@foo.com';
  //      super.onInit();
  // }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    String username = emailController.text.trim();
    String password = emailController.text.trim();

    if ((username.isEmpty || password.isEmpty)) {
      Get.snackbar(
          "Authentication Failed", "Username / Password cannot be empty !");
    } else {
      print(username);
      print(password);
      bool isAuth = await checkUser(username, password);

      print(isAuth);
      if (isAuth == true) {
        Get.snackbar("Auth", "sucess");
      } else {
        Get.snackbar("Authentication Failed", "Enter valid username or password");
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

    print("entered !");

    print(
        "username is ${emailController.text} password id ${passwordController.text}");
    const String url = api + "auth/login";

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(
              <String, dynamic>{"username": username, "password": password}));

      loading.value = false;

      if (response.statusCode != 200) {
        print("error in loggin in");
        return false;
      } else {
        print(response.body);

        print(response.body.toString());
        return true;
      }
    } catch (err) {
      print("error occurred");
      print(err.toString());
      return false;
    }
  }

  void hello() {
    isAble.value = true;
    name.value = "done someting";
    print("hello");
  }

//
// void login() {
//   if (loginFromKey.currentState!.validate()) {
//     checkUser().then((value) {
//       if (value) {
//         Get.snackbar('Login', 'Login successfully');
//         print("hello");
//       } else {
//         Get.snackbar('Login', 'Login failed');
//       }
//       passwordController.clear();
//     });
//   }
// }
}
