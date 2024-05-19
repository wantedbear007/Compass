import 'package:compass/screens/expired/expired_product_controller.dart';
import 'package:compass/screens/expiringProducts/expiring_product_controller.dart';
import 'package:compass/screens/home/home_screen_controller.dart';
import 'package:compass/screens/landing/landing_screen_controller.dart';
import 'package:compass/screens/login/login_screen_controller.dart';
import 'package:compass/screens/register/register_product_controller.dart';
import 'package:compass/screens/registeredProducts/registered_products_controller.dart';
import 'package:compass/screens/search/search_screen_controller.dart';
import 'package:compass/screens/verify/verify_product_controller.dart';
import 'package:get/get.dart';

class ParentBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LandingController());
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    //
    // Get.lazyPut<LandingController>(() => LandingController());
    Get.lazyPut<RegisteredProductsController>(
        () => RegisteredProductsController());
    Get.lazyPut<ExpiringController>(() => ExpiringController());
    // Get.lazyPut<RegisterProductController>(() => RegisterProductController());
    // // Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    // Get.lazyPut<VerifyProductController>(() => VerifyProductController());
    // Get.lazyPut<ExpiredProductsController>(() => ExpiredProductsController());
    // Get.lazyPut<SearchScreenController>(() => SearchScreenController());

  }
}
