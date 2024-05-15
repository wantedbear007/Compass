import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyProductScreen extends StatelessWidget {
  const VerifyProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(Icons.search),
            label: Text("SCAN BARCODE"),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          // appBar: AppBar(
          //   title: Text("hello"),
          //   // bottom: ,
          //   flexibleSpace: Text("hell"),
          //
          // ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image(
                        image: const AssetImage("assets/logo.png"),
                        width: 110,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              Colors.red,
                              Theme.of(context).primaryColor
                            ],
                          ).createShader(bounds);
                        },
                        child: Text(
                          "${appName} Attest ".toUpperCase(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            // color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
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
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  )
                ],
              ),
            ),
          )

          // Expanded(
          //   child: Center(
          //
          //     child: MaterialButton(
          //       onPressed: () {search
          //         print("helllo");
          //         compassLoading();
          //       },
          //       child: Text("Search"),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
