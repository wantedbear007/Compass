import 'package:compass/bindings/parent_binder.dart';
import 'package:compass/screens/RegisterProduct/register_product.dart';
import 'package:compass/screens/expiringProducts/expiring_product_screen.dart';
import 'package:compass/screens/landing/landing_page.dart';
import 'package:compass/screens/login/login_screen.dart';
import 'package:compass/screens/register/register_screen.dart';
import 'package:compass/screens/registeredProducts/registered_products_screen.dart';
import 'package:compass/utils/color_scheme.dart';
import 'package:compass/utils/theme_material.dart';
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
        GetPage(name: "/", page: () => const LandingScreen()),
        GetPage(name: "/register", page: () => const RegisterProduct()),
        GetPage(
            name: "/registeredProducts",
            page: () => const RegisteredProducts()),
        GetPage(
            name: "/expiringProducts",
            page: () => const ExpiringProductScreen()),

      ],
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.light,
      ),
    ),

    darkTheme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
      ),
    ),

    // theme: ThemeData(
      //     useMaterial3: true,
      //     colorScheme: ColorScheme.fromSeed(
      //       seedColor: Colors.green,
      //       background: Colors.white,
      //       error: Colors.red,
      //       onTertiary: Colors.orange,
      //     )),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   brightness: Brightness.dark,
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.teal,
      //     // Can be any color that suits your brand.
      //     brightness: Brightness.dark,
      //     // Material Design 3 recommends these properties are generally handled by the seed.
      //     background: Colors.grey[900]!,
      //     // Ensuring high contrast
      //     surface: Colors.grey[850]!,
      //     // Slightly lighter than background
      //     error: Colors.red.shade900,
      //     // Suitable for visibility in dark themes
      //     onTertiary: Colors.orange
      //         .shade300, // Ensures good contrast on tertiary color surfaces
      //   ),
      // ),
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: lightColorScheme,
      //   textTheme: TextTheme(
      //     headlineLarge: TextStyle(
      //       color: Theme.of(context).colorScheme.inversePrimary,
      //     ),
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   colorScheme: darkColorScheme,
      //   textTheme: TextTheme(
      //     headlineLarge: TextStyle(
      //       color: Theme.of(context).colorScheme.inversePrimary,
      //     ),
      //   ),
      // ),
      initialBinding: ParentBinding(),
      home: LoginScreen(),
      // home: const ExpiringProductScreen(),
    );
  }
}
