import 'package:compass/models/product_model.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/token_verification.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
//   to search items
  Future<List<ProductModel>> searchProducts(String query) async {
    String token = await localStorageServices.getFromLocal("token");

    if (token == null) {
      tokenDialog();
      return [];
    }

    return await searchProduct(token, query);
  }
}
