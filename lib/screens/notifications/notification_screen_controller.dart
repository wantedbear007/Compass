import 'package:compass/models/activities_model.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/token_verification.dart';
import 'package:get/get.dart';

class NotificationScreenController extends GetxController {
//   get notification
  Future<List<ActivitiesModel>> notificationHandler() async {
    String? token = await localStorageServices.getFromLocal<String>("token");

    if (token == null) {
      tokenDialog();
      return [];
    }

    return await getActivities(token);
  }
}
