import 'package:cached_network_image/cached_network_image.dart';
import 'package:compass/models/user_model.dart';
import 'package:compass/screens/home/home_screen_controller.dart';
import 'package:compass/screens/login/login_screen.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/utils/utils.dart';
import 'package:compass/widgets/button_card.dart';
import 'package:compass/widgets/loading_page.dart';
import 'package:compass/widgets/material_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      UserModel userData = controller.userModel.value;

      print(userData.username);

      return controller.loading.value
          ? const LoadingPage(tagline: "Wait, greater things take time.")
          : Scaffold(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        appName,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        subTitle,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),

                            UserMaterialButton(
                              buttonAction: () async {
                                await controller.localStorageServices
                                    .removeFromLocal("token");
                                if (kDebugMode) {
                                  print("deleted token");
                                }
                                Get.offAll(const LoginScreen(),
                                    transition: Transition.fade);
                                Get.snackbar(
                                    "Compass", "Logged out Successfully",
                                    animationDuration:
                                        const Duration(milliseconds: 10));
                              },
                              buttonText: "Logout",
                            )
                            // add options
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Welcome, ",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                                ),
                                Text(
                                  userData.username ?? "User",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  // placeholder: (Context, url) => CircularProgressIndicator(),
                                  imageUrl: userData.profile ??
                                      "https://cdn-icons-png.flaticon.com/512/3177/3177440.png",
                                  width: 60,
                                  height: 60,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: LinearProgressIndicator(
                                              value: progress.progress,
                                            ),
                                          )
                                  // progressIndicatorBuilder: ,
                                  ),
                            ),
                            // Text("hello"),
                          ],
                        ),

                        Text(
                          "Total Registered Products: ${userData.totalProducts ?? 0}",
                        ),
                        Text(
                          "Organization Name: ${userData.name ?? "NA"}",
                        ),
                        Text(
                          "Registered Email: ${userData.email ?? "NA"}",
                          // userData.email ?? "Not available",,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.outline),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
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
                        // HomeScreenCard(
                        //   tapAction: () {},
                        //   buttonText: "Add Products",
                        //   caption: "Add new products, something something",
                        //   image: "assets/addnew.svg",
                        //   icon: Icons.account_circle_sharp,
                        // )
                        // ButtonCard(),
                        // ButtonCard(),

                        // ButtonCard(),
                      ],
                    ),
                  )
                ],
              ),
            );
    });
  }
}
