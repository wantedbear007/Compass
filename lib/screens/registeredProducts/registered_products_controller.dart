import 'package:compass/models/product_model.dart';
import 'package:compass/models/products_model_old.dart';
import 'package:compass/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisteredProductsController extends GetxController {
  // RxInt filterMonths = 4.obs;
  RxInt filterValue = 4.obs;

  // get all products
  Future<List<ProductModel>> getProducts() async {
    try {
      const String url = "${api}products/getAll";

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
      String url = "${api}products/expiringIn/${filterValue.value.toString()}";
      print(url);
      final response = await http
          .get(Uri.parse(url), headers: {"Content-Type": "application/json"});

      print(response.toString());


      if (response.statusCode != 200) {
        print("Server error");
        // print(response.body.toString());
      }

      final List responseBody = jsonDecode(response.body);
      Obx() {}
      return responseBody.map((e) => ProductModel.fromJson(e)).toList();
    } catch (err) {
      print("Error occurred");
      return [];
    }
  }

//  delete product
  Future<void> deleteProduct(String id) async {
    try {
      String url = "${api}products/deleteBeta/${id}";
      final res = await http.get(Uri.parse(url));
      if (res.statusCode != 200 ) {
        print("error");
      }

      print(res.body.toString());

    } catch (err) {
      print("Error occurred");
    }
  }
 }
