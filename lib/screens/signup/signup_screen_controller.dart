import 'dart:math';

import 'package:compass/screens/landing/landing_page.dart';
import 'package:compass/utils/api_services.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/custom_snackbar.dart';
import 'package:compass/widgets/dialog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  RxBool loading = false.obs;

  final singUpFormKey = GlobalKey<FormState>();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void onInit() {
    // var ran = Random();
    // companyNameController.text = "Adyut and sons";
    // usernameController.text = ran.nextInt(100000).toString();
    // emailController.text = "random${ran.nextInt(10000)}@gmail.com";
    // passwordController.text = "1234567";
    // confirmController.text = "1234567";
    super.onInit();
  }

  @override
  void onClose() {
    companyNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.onClose();
  }

//   create account handler
  Future<void> createAccount() async {
    loading.value = true;
    final String companyName = companyNameController.text.trim();
    final String username = usernameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmController.text.trim();

    if (companyName.isEmpty ||
        username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      compassSnackBar(appName, "All fields required.");
      return;
    }

    if (!email.isEmail) {
      compassDialog(appName, "Enter valid email address", "Okay");
      loading.value = false;
      return;

    }

    if (password.length < 8) {
      compassDialog(appName, "Password length should be 8 or more.", "Okay");
      loading.value = false;
      return;
    }

    if (password != confirmPassword) {
      compassDialog(
          appName, "Passwords did not match, Please re-enter password", "Okay");
      loading.value = false;
      return;
    }

    bool isRegistered =
        await registerUser(companyName, username, email, password);

    if (isRegistered == false) {
      loading.value = false;
      return;
    }

    final bool loginNow = await loginUser(username, password);
    if (loginNow == true) {
      Get.offAll(() => const LandingScreen());
      return;
    }

    loading.value = false;
    return;

    // if ()
  }
}
