import 'package:compass/models/user_model.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/utils.dart';
import 'package:compass/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var userModel = UserModel().obs;
  final RxBool loading = true.obs;

  final LocalStorageServices localStorageServices = LocalStorageServices();

  // @override
  // void onClose() {
  //
  //   super.onClose();
  // }

  @override
  void onInit() {
    super.onInit();

    loadUserData();
  }

  @override
  void onClose() {
    super.dispose();
    super.onClose();
  }

  // delete conntroller

  Future<void> loadUserData() async {
    loading.value = true;
    try {
      String? token = await localStorageServices.getFromLocal<String>("token");

      if (token == null) {
        compassSnackBar(appName, "Authentication error.");
        return;
      }

      userModel.value = await _getDetails(token);
    } catch (err) {
      compassSnackBar(appName, "Oops something wrong with. Try again later.");
      loading.value = false;
    }
    loading.value = false;
  }

  Future<UserModel> _getDetails(String token) async {
    return (await getUserDetails(token))!;
  }
}
