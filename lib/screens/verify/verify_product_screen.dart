import 'package:compass/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';

class VerifyProductScreen extends StatelessWidget {
  const VerifyProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("hello"),
          // bottom: ,
          flexibleSpace: Text("hell"),

        ),
        body:LinearProgressIndicator()

        // Expanded(
        //   child: Center(
        //
        //     child: MaterialButton(
        //       onPressed: () {
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
