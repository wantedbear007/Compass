import 'package:compass/bindings/parent_binder.dart';
import 'package:compass/screens/RegisterProduct/register_product.dart';
import 'package:compass/screens/expiringProducts/expiring_product_screen.dart';
import 'package:compass/screens/home/home_screen.dart';
import 'package:compass/screens/landing/landing_page.dart';
import 'package:compass/screens/registeredProducts/registered_products_screen.dart';
import 'package:compass/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // routes: routes,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LandingScreen()),
        GetPage(name: "/register", page: () => RegisterProduct()),
        GetPage(name: "/registeredProducts", page: () => RegisteredProducts()),
        GetPage(name: "/expiringProducts", page: () => ExpiringProductScreen())
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      initialBinding: ParentBinding(),
      home: LandingScreen(),
      // home: const ExpiringProductScreen(),
    );
  }
}
