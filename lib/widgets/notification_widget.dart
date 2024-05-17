import 'package:compass/models/activities_model.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final ActivitiesModel activitiesModel;

  const NotificationCard({super.key, required this.activitiesModel});

  @override
  Widget build(BuildContext context) {
    final String date = activitiesModel.createdDate.toString().substring(0, 16);



    IconData icon = Icons.notifications_on;

    if (activitiesModel.type == 2) {
      icon = Icons.add_task;
    } else if (activitiesModel.type == 3) {
      icon = Icons.bookmark_remove;
    } else if (activitiesModel.type == 4) {
      icon = Icons.access_time_outlined;
    }

    return Card(
        child: ListTile(
      leading: Icon(icon),
      title: Text(
        activitiesModel.title ?? "NA",
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activitiesModel.description ?? "NA",
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Category: ${activitiesModel.category}",
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
          Text("Recorded on: $date",
              style: TextStyle(color: Theme.of(context).disabledColor))
        ],
      ),
    ));
  }
}
