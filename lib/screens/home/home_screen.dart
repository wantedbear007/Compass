import 'package:compass/screens/RegisterProduct/register_product.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/button_card.dart';
import 'package:compass/widgets/material_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: const AssetImage("assets/logo.png"),
                          width: MediaQuery.of(context).size.width * 0.12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                appName,
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                subTitle,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
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
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "pratapsinghbhanu444@gmail.com",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.outline),
                ),
                SizedBox(
                  height: 10,
                ),
                HomeScreenCard(
                  tapAction: () {
                    Get.toNamed("/register");
                  },
                  buttonText: "Add Products",
                  caption: "Add new products, something something",
                  image: "assets/addnew.svg",
                  icon: Icons.add,
                ),
                SizedBox(
                  height: 10,
                ),
                HomeScreenCard(
                  tapAction: () {
                    Get.toNamed("registeredProducts");
                  },
                  buttonText: "Registered Products",
                  caption:
                      "See the list of the registered products, there details.",
                  image: "assets/addnew.svg",
                  icon: Icons.list,
                ),
                SizedBox(
                  height: 10,
                ),
                HomeScreenCard(
                  tapAction: () {
                    Get.toNamed("expiringProducts");
                  },
                  buttonText: "Expiring Products",
                  caption:
                      "Lists out the product that are expiring in a month or two.",
                  image: "assets/addnew.svg",
                  icon: Icons.date_range,
                ),
                SizedBox(
                  height: 10,
                ),
                HomeScreenCard(
                  tapAction: () {},
                  buttonText: "Add Products",
                  caption: "Add new products, something something",
                  image: "assets/addnew.svg",
                  icon: Icons.account_circle_sharp,
                )
                // ButtonCard(),
                // ButtonCard(),

                // ButtonCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
