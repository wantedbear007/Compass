import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/loading.svg", width: 100,),
        LoadingAnimationWidget.staggeredDotsWave(
            color: Theme.of(context).primaryColor, size: 30),
        Text("Loading")
      ],
    );
  }
}
