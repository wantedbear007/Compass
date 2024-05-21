// import 'package:compass/utils/constants.dart';
// import 'package:compass/widgets/text_input.dart';
// import 'package:flutter/material.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController _organizationNameController =
//       TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     bool isChecked = false;
//
//     return Scaffold(
//       body: ListView(
//         padding: const EdgeInsets.only(top: 50),
//         children: [
//           Center(
//             child: Column(
//               children: [
//                 Image(
//                   width: MediaQuery.of(context).size.width / 5,
//                   image: const AssetImage("assets/logo.png"),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   "Register on Compass",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           TextInputField(
//             textController: _organizationNameController,
//             hintText: "Enter your organization name",
//             inputLabelText: "Organization name",
//             textInputType: TextInputType.text,
//           ),
//           // SizedBox(
//           //   // height: 15,
//           // ),
//           TextInputField(
//             textController: _emailController,
//             hintText: "Enter your email",
//             inputLabelText: "Email",
//             textInputType: TextInputType.emailAddress,
//           ),
//           TextInputField(
//             textController: _passwordController,
//             hintText: "Enter your password",
//             inputLabelText: "Password",
//             textInputType: TextInputType.visiblePassword,
//           ),
//           TextInputField(
//             textController: _passwordController,
//             hintText: "Retype password",
//             inputLabelText: "Password",
//             textInputType: TextInputType.emailAddress,
//           ),
//           TextInputField(
//             textController: _phoneController,
//             hintText: "Enter Contact number",
//             inputLabelText: "Contact number",
//             textInputType: TextInputType.phone,
//           ),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 17,
//               // horizontal: MediaQuery.of(context).size.width / 10,
//               vertical: 10,
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Checkbox(value: isChecked, onChanged: (bool) {}),
//                     Expanded(
//                       child: Container(
//                         padding:
//                             const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                         child: const Text(
//                           "I accept the terms and conditions laid by Compass and team.",
//                           softWrap: true,
//                           overflow: TextOverflow.clip,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//
//                 MaterialButton(
//                   height: 60,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(appBorderRadius)),
//                   minWidth: MediaQuery.of(context).size.width,
//                   onPressed: () {},
//                   color: Theme.of(context).colorScheme.primary,
//                   child: const Text(
//                     "Register",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 // const UserButton(
//                 //   buttonText: "Register",
//                 // ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
