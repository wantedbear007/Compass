import 'package:compass/screens/login/login_screen_controller.dart';
import 'package:get/get.dart';

class ParentBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }

}
