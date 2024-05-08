import 'package:compass/screens/login/login_screen_controller.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                width: MediaQuery.of(context).size.width / 4,
                image: const AssetImage("assets/logo.png"),
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            SizedBox(
              // width: 350,
              // width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Welcome to $appName",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      subTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextInputField(
                          inputLabelText: "Username",
                          textController: controller.emailController,
                          hintText: "Enter your username",
                          textInputType: TextInputType.text,
                          // icon: Icons.account_circle_sharp,
                        ),
                        TextInputField(
                          inputLabelText: "Password",
                          textController: controller.passwordController,
                          hintText: "Enter your Password",
                          textInputType: TextInputType.visiblePassword,
                          // icon: Icons.account_circle_sharp,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17, right: 17),
                          child: MaterialButton(
                            height: 60,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(appBorderRadius)),
                            minWidth: MediaQuery.of(context).size.width,
                            onPressed: controller.login,
                            // child: Text(
                            //   "Login",
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            color: Theme.of(context).colorScheme.primary,

                            child: Obx(() {
                              if (!controller.loading.value) {
                                return const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                );
                              }
                              return const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //   text input
          ],
        ),
      ),
    );
  }
}
