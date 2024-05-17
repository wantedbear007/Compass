import 'package:compass/models/activities_model.dart';
import 'package:compass/screens/notifications/notification_screen_controller.dart';
import 'package:compass/widgets/loading_widget.dart';
import 'package:compass/widgets/notification_widget.dart';
import 'package:compass/widgets/server_error_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationScreenController notificationScreenController =
        NotificationScreenController();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Notifications",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   // leading: IconButton(
      //   //   onPressed: () {},
      //   //   icon: Icon(Icons.arrow_back),
      //   // ),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     children: [
      //       NotificationCard(),
      //       NotificationCard(),
      //       NotificationCard(),
      //     ],
      //   ),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            collapsedHeight: 110,
            title: Text("hello"),
            flexibleSpace: FlexibleSpaceBar(
              title: Text("hello"),
              background: Container(
                color: Colors.red,
              ),
            ),
          ),
          FutureBuilder<List<ActivitiesModel>>(
              future: notificationScreenController.notificationHandler(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverFillRemaining(
                    child: LoadingWidget(),
                  );
                } else if (snapshot.hasError) {
                  return const SliverFillRemaining(
                    child: CustomErrorWidget(
                        assetName: "server.svg",
                        subtitle:
                            "Oops, seems like server is busy, Try again."),
                  );
                } else if ( snapshot.data!.isEmpty) {
                  return const SliverFillRemaining(
                    child: CustomErrorWidget(
                        assetName: "notification.svg",
                        subtitle: "No new Notifications."),
                  );
                } else {

                  return SliverList(
                    delegate:  SliverChildBuilderDelegate(
                        (BuildContext context , int index)   {
                          final notification = snapshot.data![index];
                          return NotificationCard(activitiesModel: notification,);
                        },
                      childCount: snapshot.data?.length,

                        ),

                  );
                }
              })
        ],
      ),
    );
  }
}
