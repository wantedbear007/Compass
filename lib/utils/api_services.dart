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

// to get user details i.e name, email, profile picture url, username
Future<UserModel?> getUserDetails(String token) async {
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

// to get details from barCode
Future<void> getBarCodeData(String barcodeID) async {
  String apiUrl = barCodeAPI + barcodeID;

  try {
    final response = await http.get(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "apiKey": apiKey
        });

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Error in fetching ${response.body}");
      }

      Get.defaultDialog(
        title: "Compass",
        middleText: "Failed to fetch data, try again or enter manually",
      );
    }

    print(response.body);
  } catch (err) {
    if (kDebugMode) {
      print("error in $err");
    }
  }
}
