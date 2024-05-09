import 'dart:convert';

import 'package:compass/models/user_model.dart';
import 'package:compass/screens/login/login_screen.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final LocalStorageServices localStorageServices = LocalStorageServices();

Future<void> saveUserDetails(String token) async {
  String url = "${api}auth/getUserDetails?token=$token";

  try {
    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json',
      "apiKey": apiKey
    });

    if (response.statusCode != 200) {
      if (kDebugMode) {
        print(response.body);
      }
      return;
    }

    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    data.forEach((key, value) async {
      await localStorageServices.saveToLocal(key.toString(), value.toString());
    });
  } catch (err) {
    if (kDebugMode) {
      print("error in saving details$err");
    }
  }
}

Future<UserModel?> getUserDetails(String token) async {
  String url = "${api}auth/getUserDetails?token=$token";

  try {
    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json',
      "apiKey": apiKey
    });

    if (response.statusCode != 200) {
      Get.defaultDialog(
        titleStyle: const TextStyle(fontWeight: FontWeight.bold),
        title: "Compass",
        middleText: "Internal server error.",
        confirm: MaterialButton(
          onPressed: () async {
            await localStorageServices.removeFromLocal("token");
            Get.offAll(const LoginScreen());
          },
          child: const Text("Login again"),
        ),
      );
    }

    Map<String, dynamic> userDetails =
        jsonDecode(response.body) as Map<String, dynamic>;
    return UserModel.fromJson(userDetails);
  } catch (err) {
    return null;
  }
}
