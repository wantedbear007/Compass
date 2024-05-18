import 'package:compass/screens/login/login_screen_controller.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<LoginScreenController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Center(
                  child: Image(
                    width: MediaQuery.of(context).size.width / 7,
                    image: const AssetImage("assets/logo.png"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: "Welcome to ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                                text: appName,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            // Text("hello"),
                          ]),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
              // width: 350,
              // width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Form(
                    child: Column(
                      children: [
                        TextInputField(
                          inputLabelText: "Company Name",
                          textController: controller.emailController,
                          hintText: "Enter your company name",
                          textInputType: TextInputType.text,
                          // icon: Icons.account_circle_sharp,
                        ),
                        TextInputField(
                          inputLabelText: "Username",
                          textController: controller.passwordController,
                          hintText: "Enter your username",
                          // isPassword: true,
                          textInputType: TextInputType.visiblePassword,
                          // icon: Icons.account_circle_sharp,
                        ),
                        TextInputField(
                          inputLabelText: "Company Email",
                          textController: controller.passwordController,
                          hintText: "Enter your Company Email",
                          textInputType: TextInputType.visiblePassword,
                          // icon: Icons.account_circle_sharp,
                        ),
                        TextInputField(
                          inputLabelText: "Password",
                          textController: controller.passwordController,
                          hintText: "Enter your Password",
                          isPassword: true,
                          textInputType: TextInputType.visiblePassword,
                          // icon: Icons.account_circle_sharp,
                        ),
                        TextInputField(
                          inputLabelText: "Confirm Password",
                          textController: controller.passwordController,
                          hintText: "Re-enter your password",
                          isPassword: true,
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
                                  "Sign Up",
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already registered with\n$appName ?",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).disabledColor),
                              ),
                              TextButton(

                                  onPressed: () {
                                    // Get.offAll(Sign)
                                  },
                                  child: const Text("Login now"))
                            ],
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
