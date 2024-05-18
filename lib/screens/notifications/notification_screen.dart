import 'package:compass/models/activities_model.dart';
import 'package:compass/screens/notifications/notification_screen_controller.dart';
import 'package:compass/widgets/loading_widget.dart';
import 'package:compass/widgets/notification_widget.dart';
import 'package:compass/widgets/server_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationScreenController _notificationScreenController =
      NotificationScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _notificationScreenController.notificationHandler();
          setState(() {});
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 300.0,
              collapsedHeight: 110,
              flexibleSpace: FlexibleSpaceBar(
                  title:  Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColor.withAlpha(50),
                          Theme.of(context).cardColor
                          // Theme.of(context).primaryColor,
                        ],
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/background.svg",
                      fit: BoxFit.cover,
                      // color: Theme.of(context).hintColor,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor, BlendMode.srcIn),
                    ),
                  )),
            ),
            FutureBuilder<List<ActivitiesModel>>(
                future: _notificationScreenController.notificationHandler(),
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
                  } else if (snapshot.data!.isEmpty) {
                    return const SliverFillRemaining(
                      child: CustomErrorWidget(
                          assetName: "notification.svg",
                          subtitle: "No new Notifications."),
                    );
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final notification = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: NotificationCard(
                              activitiesModel: notification,
                            ),
                          );
                        },
                        childCount: snapshot.data?.length,
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
