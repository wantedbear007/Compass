import 'package:compass/screens/login/login_screen_controller.dart';
import 'package:compass/widgets/text_input.dart';
import 'package:compass/widgets/user_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              width: MediaQuery.of(context).size.width / 3,
              image: const AssetImage("assets/logo.png"),
            ),
          ),


          const SizedBox(
            height: 50,
          ),

          SizedBox(
            // width: 350,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to Compass",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ),
                Text(
                  "Order in every detail.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Username",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                TextInputField(
                  inputLabelText: "Username",
                  textController: _usernameController,
                  hintText: "Enter your username",
                  textInputType: TextInputType.text,
                  // icon: Icons.account_circle_sharp,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                TextInputField(
                  inputLabelText: "Password",
                  textController: _passwordController,
                  hintText: "Enter your Password",
                  textInputType: TextInputType.visiblePassword,
                  // icon: Icons.account_circle_sharp,
                ),
                const SizedBox(
                  height: 15,
                ),
                const UserButton(buttonText: "Login")
              ],
            ),
          ),
          //   text input
        ],
      ),
    );
  }
}
