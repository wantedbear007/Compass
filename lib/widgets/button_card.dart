import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenCard extends StatelessWidget {
  final VoidCallback tapAction;
  final String buttonText;
  final String caption;
  final String image;
  final IconData icon;

  const HomeScreenCard(
      {super.key,
      required this.tapAction,
      required this.buttonText,
      required this.caption,
      required this.image, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onSecondary,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        // enableFeedback: false,
        // Note: Add double tap to open preview
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          height: 110,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   image,
                //   width: 60,
                // ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        buttonText,
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          caption,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                              fontWeight: FontWeight.normal),
                          softWrap: true,
                          overflow:
                              TextOverflow.clip, // Use ellipsis for truncation
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: InkWell(
                    onTap: () {
                      print("hgelllolo");
                    },
                    splashColor: Colors.black38,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 70,
                      width: 70,
                      // borderRadius: BorderRadius.circular(10)),
                      // color: Colors.red,
                      child: Icon(
                        icon,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
