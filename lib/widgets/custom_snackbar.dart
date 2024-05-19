import 'package:get/get.dart';
import 'package:flutter/material.dart';

compassSnackBar(String title, String subtitle) {
  return Get.snackbar(title, subtitle,
      barBlur: 20, icon: const Icon(Icons.notifications_active));
}
