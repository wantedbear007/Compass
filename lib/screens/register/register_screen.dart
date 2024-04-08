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
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 100),
        children: [
          Center(
            child: Column(
              children: [
                Image(
                  width: MediaQuery.of(context).size.width / 4,
                  image: const AssetImage("assets/logo.png"),
                ),
                const Text(
                  "Register on Compass",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 9,
                vertical: 10),
            child: const UserButton(
              buttonText: "Register",
            ),
          )
        ],
      ),
    );
  }
}
