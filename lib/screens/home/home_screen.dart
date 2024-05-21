import 'package:cached_network_image/cached_network_image.dart';
import 'package:compass/models/user_model.dart';
import 'package:compass/screens/about/about_screen.dart';
import 'package:compass/screens/home/home_screen_controller.dart';
import 'package:compass/screens/login/login_screen.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/button_card.dart';
import 'package:compass/widgets/custom_snackbar.dart';
import 'package:compass/widgets/loading_home.dart';
import 'package:compass/widgets/material_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  void initState() {
    // setState(() {});
    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // controller.loadUserData();

    return Obx(() {
      UserModel userData = controller.userModel.value;

      return controller.loading.value
          ? const HomeLoading()
          : Scaffold(
              appBar: AppBar(
                // backgroundColor: Colors.white,
                title: Row(
                  children: [
                    Image(
                      image: const AssetImage("assets/logo.png"),
                      width: MediaQuery.of(context).size.width * 0.11,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            appName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            subTitle,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.to(const AboutScreen());
                    },
                    icon: const Icon(Icons.segment_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UserMaterialButton(
                      buttonAction: () async {
                        await Get.defaultDialog(
                            title: "Are you sure want to Logout ?",
                            middleText: "Active User: ${userData.name}",
                            // cancel: ,
                            cancel: MaterialButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("Cancel"),
                            ),
                            confirm: MaterialButton(
                              onPressed: () async {
                                await controller.localStorageServices
                                    .removeFromLocal("token");
                                compassSnackBar(
                                    appName, "Logged out Successfully");
                                // controller.dispose();

                                Get.offAll(() => const LoginScreen());
                              },
                              child: const Text(
                                "Logout",
                                style: TextStyle(color: Colors.red),
                              ),
                            ));
                      },
                      buttonText: "Logout",
                    ),
                  ),
                ],
              ),
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
                        // const SizedBox(
                        //   height: 20,
                        // ),

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
                        const SizedBox(
                          height: 20,
                        ),
                        HomeScreenCard(
                          tapAction: () {
                            Get.toNamed("/register");
                          },
                          buttonText: "Add Products",
                          caption: "Register new product to the inventory.",
                          image: "assets/addnew.svg",
                          icon: Icons.add,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HomeScreenCard(
                          tapAction: () {
                            Get.toNamed("registeredProducts");
                          },
                          buttonText: "Registered Products",
                          caption:
                              "List the products that are registered in the inventory",
                          image: "assets/addnew.svg",
                          icon: Icons.list,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HomeScreenCard(
                          tapAction: () {
                            Get.toNamed("expiringProducts");
                          },
                          buttonText: "Expiring Products",
                          caption: "Lists out the product that are expiring.",
                          image: "assets/addnew.svg",
                          icon: Icons.date_range,
                        ),
                        const SizedBox(
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
