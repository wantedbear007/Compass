import 'package:compass/models/product_model.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/token_verification.dart';
import 'package:get/get.dart';

class ExpiredProductsController extends GetxController {
  // get expired products
  Future<List<ProductModel>> getExpiredProducts() async {
    String? token = await localStorageServices.getFromLocal("token");

    if (token == null) {
      tokenDialog();
      return [];
    }
    return await getExpired(token);
  }
}
