import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Future compassLoading() async {

  return Get.defaultDialog(
    titlePadding: EdgeInsets.all(10),
    titleStyle: TextStyle(
      fontSize: 20
    ),
    barrierDismissible: false,
    content:
        LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 70),
    title: "Loading",
    textConfirm: "dome",
    middleText: "subTitle",


  );
}
