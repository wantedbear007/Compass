import 'package:compass/bindings/parent_binder.dart';
import 'package:compass/screens/RegisterProduct/register_product.dart';
import 'package:compass/screens/expiringProducts/expiring_product_screen.dart';
import 'package:compass/screens/landing/landing_page.dart';
import 'package:compass/screens/login/login_screen.dart';
import 'package:compass/screens/register/register_screen.dart';
import 'package:compass/screens/registeredProducts/registered_products_screen.dart';
import 'package:compass/utils/color_scheme.dart';
import 'package:compass/utils/theme_material.dart';
import 'package:compass/utils/utils.dart';
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
  bool isLoggedIn = false;

  LocalStorageServices localStorageServices = LocalStorageServices();

  void initAsync() async {
    isLoggedIn = await localStorageServices.checkLocalStorage("token");
    setState(() {});
  }

  @override
  void initState() {
    initAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // routes: routes,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const LandingScreen()),
        GetPage(name: "/register", page: () => const RegisterProduct()),
        GetPage(name: "/login", page: () => const LoginScreen()),
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

      initialBinding: ParentBinding(),
      // home: isLoggedIn ? const LandingScreen() : const LoginScreen(),
      home: const RegisterProduct(),
    );
  }
}
