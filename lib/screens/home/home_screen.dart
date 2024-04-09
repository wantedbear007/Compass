import 'package:compass/widgets/button_card.dart';
import 'package:compass/widgets/material_button.dart';
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
              vertical: MediaQuery.of(context).size.height * 0.07,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: const AssetImage("assets/logo.png"),
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                    Text(
                      "Compass",
                      style: TextStyle(fontSize: 20, letterSpacing: 1.5),
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
                  height: 20,
                ),
                HomeScreenCard(
                  tapAction: () {},
                  buttonText: "Add Products",
                  caption: "Add new products, something something",
                  image: "assets/addnew.svg",
                  icon: Icons.add,
                ),
                SizedBox(
                  height: 20,
                ),
                HomeScreenCard(
                  tapAction: () {},
                  buttonText: "Registered Products",
                  caption: "See the list of the registered products, there details.",
                  image: "assets/addnew.svg",
                  icon: Icons.list,
                ),
                SizedBox(
                  height: 20,
                ),
                HomeScreenCard(
                  tapAction: () {},
                  buttonText: "Expiring Products",
                  caption: "Lists out the product that are expiring in a month or two.",
                  image: "assets/addnew.svg",
                  icon: Icons.date_range,
                ),
                SizedBox(
                  height: 20,
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
