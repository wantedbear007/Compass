import 'package:compass/screens/verify/verify_product_controller.dart';
import 'package:compass/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VerifyProductScreen extends GetView<VerifyProductController> {
  const VerifyProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            heroTag: "01",
            onPressed: () {
              Get.put(VerifyProductController());
              controller.scanBarCode(context);
            },
            icon: const Icon(Icons.search),
            label: const Text("SCAN BARCODE"),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Image(
                        image: AssetImage("assets/logo.png"),
                        width: 110,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              Colors.red,
                              Theme.of(context).colorScheme.primary
                            ],
                          ).createShader(bounds);
                        },
                        child: Text(
                          "$appName Attest ".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,

                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            // color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Authenticate Product BarCodes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        style:
                            TextStyle(color: Theme.of(context).disabledColor),
                        '"Verify product authenticity with our barcode check. Ensure your items are genuine and trustworthy."',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        "assets/verify.svg",
                        width: 150,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
