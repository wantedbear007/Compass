import 'dart:convert';

import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController {
  // RxString name = "bhanu".obs;
  RxBool isAble = false.obs;
  RxBool loading = false.obs;

  final loginFromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() async {
    // Simulating obtaining the user name from some local storage
    // emailController.text = 'foo@foo.com';
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

      print(isAuth);
      if (isAuth == true) {
        Get.snackbar("Auth", "sucess");
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

    print("entered !");

    print(
        "username is ${emailController.text} password id ${passwordController.text}");
    const String url = api + "auth/login";

    try {
      // print(username);
      print(password);

      final response = await http.post(Uri.parse(url),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(
              <String, dynamic>{"username": username, "password": password}));

      loading.value = false;

      if (response.statusCode != 200) {
        return false;
      } else {
        // saving token in local storage
        print(response.body);

        final Map<String, dynamic> details =
            jsonDecode(response.body) as Map<String, dynamic>;

        String token = '"' + details["token"] + '"';
        print(token);

        // saving token to local storage
        bool isStored = await saveToLocal("token", token);

        if (!isStored) {
          Get.snackbar("Permission", "Provide Compass with storage permission");
        }
        else {
          print("token stored successfully");
        }


        String? recToken = await getFromLocal<String>("token");
        print("token below");
        print(recToken);

        saveUserDetails(recToken!);

        // print(details["token"]);
        return true;
      }
    } catch (err) {
      print("error occurred");
      print(err.toString());
      return false;
    }
  }

// void hello() {
//   isAble.value = true;
//   name.value = "done someting";
//   print("hello");
// }

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
