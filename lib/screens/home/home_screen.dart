import 'package:compass/widgets/material_button.dart';
import 'package:compass/widgets/user_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage("assets/logo.png"),
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                    UserMaterialButton(
                      buttonAction: () {},
                      buttonText: "Logout",

                    )
                    // add options
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),

                Text("Welcome, ",
                    style: TextStyle(
                      fontSize: 40,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    )
                    // style: Theme.of(context).colorScheme.primaryContainer,
                    ),
                Text(
                  "Bhanupratap Singh",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
