import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.notifications_active),
      title: Text("Some notification heading"),
      subtitle: Text("This is the description of notification. "),
    ));
  }
}
