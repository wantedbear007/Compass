import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  static LandingController get to => Get.find();

  int tabIndex = 0;
  int currentIndex = 0;

  void changeTabIndex(int idx) {
    tabIndex = idx;
    update();
  }

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<bool> onWillPop() async {
    return !await navigationKey.currentState!.maybePop();
  }
}
