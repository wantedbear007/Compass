import 'package:compass/bindings/parent_binder.dart';
import 'package:compass/screens/RegisterProduct/register_product.dart';
import 'package:compass/screens/about/about_screen.dart';
import 'package:compass/screens/expiringProducts/expiring_product_screen.dart';
import 'package:compass/screens/landing/landing_page.dart';
import 'package:compass/screens/login/login_screen.dart';
import 'package:compass/screens/registeredProducts/registered_products_screen.dart';
import 'package:compass/screens/verify/verify_product_screen.dart';
import 'package:compass/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// todo
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
        GetPage(name: "/verifyProduct", page: () => const VerifyProductScreen())
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,

          // tertiary: Colors.green
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
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: false,
          // systemNavigationBarDividerColor: Theme.of(context).colorScheme.primary,
          // systemNavigationBarColor: Theme.of(context).colorScheme.primary.withAlpha(50)
          // systemNavigationBarColor:
          // Theme.of(context).colorScheme.onBackground.withGreen(44),
        ),
        child: isLoggedIn ? const LandingScreen() : const LoginScreen(),
        // child: AboutScreen(),
      ),
      // home: isLoggedIn ? const LandingScreen() : const LoginScreen(),
      // home: const SignUpScreen(),
    );
  }
}
