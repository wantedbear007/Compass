import 'package:compass/models/products_model.dart';
import 'package:compass/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisteredProductsController extends GetxController {



//   fetching data
   Future<List<ProductModel>> getProducts() async {
    const String url = apiUrl + "/registeredProducts";
    var uri = Uri.parse(url);


    final response = await http.get(uri, headers: {
      "Content-Type": "application/json"
    });

    final List body = jsonDecode(response.body);
    // print(response.body);
    return body.map((e) => ProductModel.fromJson(e)).toList();

  }
}