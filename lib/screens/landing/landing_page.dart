import 'package:compass/screens/expiringProducts/expiring_product_screen.dart';
import 'package:compass/screens/home/home_screen.dart';
import 'package:compass/screens/landing/landing_screen_controller.dart';
import 'package:compass/screens/notifications/notification_screen.dart';
import 'package:compass/screens/settings/settings_screen.dart';
import 'package:compass/screens/verify/verify_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends GetView<LandingController> {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: GetBuilder<LandingController>(
        builder: (controller) {
          return Scaffold(
            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                Navigator(
                  key: controller.navigationKey,
                  onGenerateRoute: (routeSettings) {
                    return MaterialPageRoute(
                        builder: (_) => const HomeScreen());
                  },
                ),
                const ExpiringProductScreen(),
                const VerifyProductScreen(),
                const NotificationScreen(),
                const SettingsScreen()
              ],
            ),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: controller.changeTabIndex,
              selectedIndex: controller.tabIndex,
              destinations: const <NavigationDestination>[
                NavigationDestination(
                    icon: Icon(Icons.home_filled), label: "Home"),
                NavigationDestination(
                    icon: Icon(Icons.medical_services_rounded), label: "Expiring"),
                NavigationDestination(
                    icon: Icon(Icons.verified), label: "Verify"),
                NavigationDestination(
                    icon: Icon(Icons.notifications), label: "Notifications"),
                NavigationDestination(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
            ),
          );
        },
      ),
    );
  }
}
