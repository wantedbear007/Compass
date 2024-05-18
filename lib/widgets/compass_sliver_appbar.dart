import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompassSliverAppBar extends StatelessWidget {
  final String title;
  final String assetName;

  const CompassSliverAppBar(
      {super.key, required this.title, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 300.0,
      collapsedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        background: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).primaryColor.withAlpha(50),
                Theme.of(context).cardColor
              ])),
          child: SvgPicture.asset(
            "assets/$assetName",
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(Theme.of(context).hintColor, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
