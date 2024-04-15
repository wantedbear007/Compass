import 'dart:convert';

import 'package:compass/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController {
  RxString name = "bhanu".obs;
  RxBool isAble = false.obs;
  RxBool loading  = false.obs;
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

  // validator
  // String validateField(String value) {
  //      if (value.isEmpty) {
  //           return "Requires username email / password";
  //      }
  //           return null;
  // }

  // api call

  Future<bool> checkUser() async {
    loading.value = true;

    print("entered !");
    // add try catch
    const String url = apiUrlService + "/login";
    var uri = Uri.parse(url);

    final response = await http.post(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          "email": "bhanu@gmail.com",
          "password": "9131987420"
        }));

    loading.value = false;

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    }
    return false;
  }

  void hello() {
    isAble.value = true;
    name.value = "done someting";
    print("hello");
  }
  //
  void login() {
    if (loginFromKey.currentState!.validate()) {
      checkUser().then((value) {
        if (value) {
          Get.snackbar('Login', 'Login successfully');
          print("hello");
        } else {
          Get.snackbar('Login', 'Login failed');
        }
        passwordController.clear();
      });
    }
  }
}
