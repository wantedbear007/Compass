import 'dart:convert';

import 'package:compass/models/activities_model.dart';
import 'package:compass/models/bar_code_response_model.dart';
import 'package:compass/models/product_model.dart';
import 'package:compass/models/user_model.dart';
import 'package:compass/screens/login/login_screen.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/utils.dart';
import 'package:compass/widgets/custom_snackbar.dart';
import 'package:compass/widgets/dialog_box.dart';
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
Future<BarCodeProduct?> getBarCodeData(String barcodeID) async {
  String apiUrl = barCodeAPI + barcodeID;

  try {
    final response = await http.get(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "apiKey": apiKey
        });

    if (response.statusCode != 200) {
      if (kDebugMode) {
        print("Error in fetching ${response.body}");
      }

      Get.defaultDialog(
        title: "Compass",
        middleText: "Failed to fetch data, try again or enter manually",
      );
    }

    var val = jsonDecode(response.body);

    var responseData = val["data"];
    responseData = responseData["product"];

    return BarCodeProduct.fromJson(responseData);
  } catch (err) {
    if (kDebugMode) {
      print("error in $err");

      return null;
    }
    Get.defaultDialog(title: "Internal Error", middleText: err.toString());
  }
  return null;
}

// to register products
Future<void> registerNewProduct(
    String name,
    String barCode,
    String brand,
    String description,
    String region,
    String imageUrl,
    String category,
    String expire,
    String token) async {
  String apiUrl = "${api}products/register";
  try {
    var headers = {
      'token': token,
      'apiKey': apiKey,
      'Content-Type': 'application/json'
    };

    final request = http.Request("POST", Uri.parse(apiUrl));
    request.headers.addAll(headers);
    request.body = jsonEncode({
      "expireDate": expire,
      "barCodeId": barCode,
      "name": name,
      "description": description,
      "region": region,
      "imageUrl": imageUrl,
      "brand": brand,
      "category": category
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print(await response.stream.bytesToString());
      }
      compassDialog("Registration Success",
          "Your product is successfully registered.", "Great");
    } else {
      compassDialog("Registration failed",
          "Server connectivity failed. Try again.", "Okay");
    }
  } catch (err) {
    compassDialog("Internal Error",
        "Something went wrong from our side. Try again.", "Okay");
    if (kDebugMode) {
      print("error occurreddddd $err");
    }
  }
}

// get registered products
Future<List<ProductModel>> getRegisteredProducts(String token) async {
  String apiUrl = "${api}products/getProducts";

  try {
    final response = await http.get(Uri.parse(apiUrl),
        headers: <String, String>{
          'token': token,
          'apiKey': apiKey,
          'Content-Type': 'application/json'
        });

    if (response.statusCode == 200) {
      final List responseBody = jsonDecode(response.body);
      return responseBody.map((e) => ProductModel.fromJson(e)).toList();
      // compassDialog("Server Error",
      //     "Failed to get data from database, try again.", "Okay");
      // return [];
    }

    compassDialog(
        "Server Error", "Failed to get data from database, try again.", "Okay");
    return [];
    //
    // final List responseBody = jsonDecode(response.body);
    // return responseBody.map((e) => ProductModel.fromJson(e)).toList();
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
    compassDialog("Compass", "Internal issue occurred, Try again.", "Okay");
    return [];
  }
}

// get filtered products
Future<List<ProductModel>> getFiltered(String token, int months) async {
  try {
    String url = "${api}products/expiringIn/${months.toString()}";

    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'token': token,
      'apiKey': apiKey,
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      final List responseBody = jsonDecode(response.body);
      return responseBody.map((e) => ProductModel.fromJson(e)).toList();
    }

    compassDialog(appName, "Failed to get products, try again.", "Okay");
    return [];
  } catch (err) {
    if (kDebugMode) {
      print("error occurred $err");
    }
    compassDialog("Compass", "Failed to get products, try again.", "Okay");
    return [];
  }
}

// get filtered products
Future<List<ProductModel>> getExpired(String token) async {
  try {
    String url = "${api}products/expiredProducts";

    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'token': token,
      'apiKey': apiKey,
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      final List responseBody = jsonDecode(response.body);
      return responseBody.map((e) => ProductModel.fromJson(e)).toList();
    }

    compassDialog(appName, "Failed to get products, try again.", "Okay");
    return [];
  } catch (err) {
    if (kDebugMode) {
      print("error occurred $err");
    }
    compassDialog("Compass", "Failed to get products, try again.", "Okay");
    return [];
  }
}

// search products
Future<List<ProductModel>> searchProduct(String token, String query) async {
  try {
    String url = "${api}products/search?q=$query";

    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'token': token,
      'apiKey': apiKey,
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      final List responseBody = jsonDecode(response.body);
      return responseBody.map((e) => ProductModel.fromJson(e)).toList();
    }
    compassDialog("Compass", "Failed to get products. Try again.", "Okay");
    return [];
  } catch (err) {
    if (kDebugMode) {
      print("Error while searching item $err");
      compassDialog(
          appName, "Failed to fetch data, Error: $err . Try again", "Okay");
    }
    return [];
  }
}

// delete product
Future<bool> deleteProduct(String token, int productId) async {
  try {
    final String url = "${api}products/delete?product=$productId";

    final response = await http.delete(Uri.parse(url),
        headers: <String, String>{
          'token': token,
          'apiKey': apiKey,
          'Content-Type': 'application/json'
        });

    return response.statusCode == 202 ? true : false;
  } catch (err) {
    if (kDebugMode) {
      print("Error while deleting product $err");
    }
    return false;
  }
}

// get activities
Future<List<ActivitiesModel>> getActivities(String token) async {
  try {
    const String url = "${api}auth/getActivities";

    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'token': token,
      'apiKey': apiKey,
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      final List responseBody = jsonDecode(response.body);
      // print(response.body);
      return responseBody.map((e) => ActivitiesModel.fromJson(e)).toList();
    }

    print(response.body);

    compassSnackBar("Compass", "Failed to get activities. Try again.");
    return [];
  } catch (err) {
    if (kDebugMode) {
      print(
        "failed to fetch activities: ${err.toString()}",
      );
    }

    compassSnackBar(
        appName, "Seems like there is some problem with Internet. Try again.");
    return [];
  }
}

// login account
Future<bool> loginUser(String username, String password) async {
  // loading.value = true;

  const String url = "${api}auth/login";

  try {
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "apiKey": apiKey
        },
        body: jsonEncode(
            <String, dynamic>{"username": username, "password": password}));

    // loading.value = false;

    if (response.statusCode != 200) {
      if (kDebugMode) {
        print(response.body.toString());
      }
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

// create account
Future<bool> registerUser(
    String company, String username, String email, String password) async {
  try {
    const String url = "${api}auth/createAccount";

    final headers = {"apiKey": apiKey, 'Content-Type': 'application/json'};

    final request = http.Request("POST", Uri.parse(url));

    request.headers.addAll(headers);

    request.body = jsonEncode({
      "username": username,
      "password": password,
      "email": email,
      "name": company,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      compassSnackBar(appName, "Account created Successfully");
      return true;
    } else if (response.statusCode == 403) {
      compassDialog(
          appName,
          "Email or Username is already taken, Try with a different Username or Email",
          "Okay");
      return false;
    }
  } catch (err) {
    if (kDebugMode) {
      print("error occurred in create account $err");
    }
  }
  return false;
}
