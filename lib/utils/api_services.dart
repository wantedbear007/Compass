import 'dart:convert';

import 'package:compass/models/user_model.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final LocalStorageServices localStorageServices = LocalStorageServices();

Future<void> saveUserDetails(String token) async {
  String url = "${api}auth/getUserDetails?token=$token";

  try {
    final response = await http.get(Uri.parse(url));

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

    // data.forEach((key, value) async {
    //   var dat = await getFromLocal(key.toString());
    //   print(dat);
    // });

    // print(response.body);
  } catch (err) {
    print(err.toString());
    print("error happ");
  }
}

Future<UserModel?> getUserDetails(String token) async {
  String url = "${api}auth/getUserDetails?token=$token";

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      Get.defaultDialog(title: "Compass", middleText: "Internal server error.");
    }

    Map<String, dynamic> userDetails =
        jsonDecode(response.body) as Map<String, dynamic>;
    return UserModel.fromJson(userDetails);
  } catch (err) {
    return null;
  }
}
