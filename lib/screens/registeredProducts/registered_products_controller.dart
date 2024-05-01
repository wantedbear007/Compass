import 'package:compass/models/product_model.dart';
import 'package:compass/models/products_model_old.dart';
import 'package:compass/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisteredProductsController extends GetxController {
  RxInt filterMonths = 4.obs;

  // get all products
  Future<List<ProductModel>> getProducts() async {
    try {
      const String url = api + "products/getAll";

      var uri = Uri.parse(url);

      final response =
          await http.get(uri, headers: {"Content-Type": "application/json"});

      final List body = jsonDecode(response.body);

      // print(body);

      return body.map((e) => ProductModel.fromJson(e)).toList();
    } catch (err) {
      print("Error occurred");
      return [];
    }
  }

// get filtered products
  Future<List<ProductModel>> getFilteredProducts() async {
    try {
      String url = "${api}products/expiringIn/${filterMonths.value.toString()}";
      final response = await http
          .get(Uri.parse(url), headers: {"Content-Type": "application/json"});

      if (response.statusCode != 200) {
        print("Server error");
      }
      final List responseBody = jsonDecode(response.body);
      return responseBody.map((e) => ProductModel.fromJson(e)).toList();
    } catch (err) {
      print("Error occurred");
      return [];
    }
  }
}
