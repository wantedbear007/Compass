import 'package:compass/widgets/text_input.dart';
import 'package:compass/widgets/user_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 100),
        children: [
          Center(
            child: Column(
              children: [
                Image(
                  width: MediaQuery.of(context).size.width / 5,
                  image: const AssetImage("assets/logo.png"),
                ),
                const Text(
                  "Register on Compass",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextInputField(
            textController: _organizationNameController,
            hintText: "Enter your organization name",
            inputLabelText: "Organization name",
            textInputType: TextInputType.text,
          ),
          // SizedBox(
          //   // height: 15,
          // ),
          TextInputField(
            textController: _emailController,
            hintText: "Enter your email",
            inputLabelText: "Email",
            textInputType: TextInputType.emailAddress,
          ),
          TextInputField(
            textController: _passwordController,
            hintText: "Enter your password",
            inputLabelText: "Password",
            textInputType: TextInputType.visiblePassword,
          ),
          TextInputField(
            textController: _passwordController,
            hintText: "Retype password",
            inputLabelText: "Password",
            textInputType: TextInputType.emailAddress,
          ),
          TextInputField(
            textController: _phoneController,
            hintText: "Enter Contact number",
            inputLabelText: "Contact number",
            textInputType: TextInputType.phone,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: MediaQuery.of(context).size.width / 9,
          //       vertical: 10),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Checkbox(value: isChecked, onChanged: (bool) {}),
          //           Container(
          //             padding: EdgeInsets.all(10),
          //             child: Text(
          //               // softWrap: true,
          //               // overflow: TextOverflow.ellipsis,
          //               "I accept the terms and conditions laid by Compass and team.",
          //                 overflow: TextOverflow.ellipsis,
          //               softWrap: true,
          //             ),
          //           )
          //         ],
          //       ),
          //       const UserButton(
          //         buttonText: "Register",
          //       ),
          //     ],
          //   ),
          // )
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 9,
              vertical: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(value: isChecked, onChanged: (bool) {}),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                        child: Text(
                          "I accept the terms and conditions laid by Compass and team.",
                          softWrap: true,
                          overflow:
                              TextOverflow.clip,
                        ),
                      ),
                    )
                  ],
                ),
                const UserButton(
                  buttonText: "Register",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
