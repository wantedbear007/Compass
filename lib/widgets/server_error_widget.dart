import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomErrorWidget extends StatelessWidget {
  final String assetName;
  final String subtitle;
  const CustomErrorWidget({super.key, required this.assetName, required this.subtitle});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/$assetName", width: 100,),
          SizedBox(height: 20,),
          Text(subtitle, style: const TextStyle(fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }
}
