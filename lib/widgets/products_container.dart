// import 'package:flutter/cupertino.dart';
import 'package:compass/utils/constants.dart';
import 'package:compass/widgets/user_button.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    String img =
        "https://images.newscientist.com/wp-content/uploads/2019/06/18153152/medicineshutterstock_1421041688.jpg";

    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.only(left: 0, right: 4, top: 5, bottom: 5),
      child: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                img,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Some medicine title",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 10
                      fontSize: constraints.maxWidth * 0.05),
                ),
                Text("Category: Medicines"),
                Text("Category: Medicines"),
                Text("Category: Medicines"),
                MaterialButton(
                  minWidth: constraints.maxWidth / 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(appBorderRadius)),
                  textColor: Colors.white,
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                  child: Text("Delete Product"),
                )
                // MaterialButton(
                //   // padding: EdgeInsetsGeometry(w),
                //   // highlightColor: Colors.cyan,
                //   onPressed: () {},
                //   child: Text("Delete"),
                //   color: Colors.black38,
                //   textColor: Colors.white,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   // height: 7/,
                // ),
              ],
            )
          ],
        );
      }),
    );
  }
}
