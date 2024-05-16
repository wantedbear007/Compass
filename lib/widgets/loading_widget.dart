import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/loading.svg", width: 100,),
        SizedBox(height: 20,),
        LoadingAnimationWidget.staggeredDotsWave(
            color: Theme.of(context).focusColor, size: 50),
        Text("Loading",)
      ],
    );
  }
}
