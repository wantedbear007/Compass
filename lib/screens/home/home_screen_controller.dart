import 'package:compass/models/user_model.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/utils.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var userModel = UserModel().obs;
  RxBool loading = true.obs;

  final LocalStorageServices localStorageServices = LocalStorageServices();


  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  // delete conntroller

  void loadUserData() async {
    loading.value = true;
    try {
      String? token = await localStorageServices.getFromLocal<String>("token");

      if (token == null) {
        Get.snackbar("Authentication error", "Something went wrong");
      }

      userModel.value = await _getDetails(token!);
    } catch (err) {
      Get.snackbar("Internal Error", "Something went wrong.");
      loading.value = false;
    }
    loading.value = false;

  }

  Future<UserModel> _getDetails(String token) async {
    return (await getUserDetails(token))!;
  }
}
