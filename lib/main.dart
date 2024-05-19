import 'package:compass/bindings/parent_binder.dart';
import 'package:compass/screens/RegisterProduct/register_product.dart';
import 'package:compass/screens/expiringProducts/expiring_product_screen.dart';
import 'package:compass/screens/landing/landing_page.dart';
import 'package:compass/screens/login/login_screen.dart';
import 'package:compass/screens/product_preview/product_preview_screen.dart';
import 'package:compass/screens/register/register_screen.dart';
import 'package:compass/screens/registeredProducts/registered_products_screen.dart';
import 'package:compass/screens/signup/signup_screen.dart';
import 'package:compass/screens/verify/verify_product_screen.dart';
import 'package:compass/utils/color_scheme.dart';
import 'package:compass/utils/theme_material.dart';
import 'package:compass/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// todo
// 1. add an  animated dialog box
// 2. Remove unused dependencies
// 3. save number of registered products in local storage
// 4. Fix all data loaded at ones (from bottom nav) fix: remove bindings.
// 5. Fix delete product delay
// 6. Bottom white space fix
// 7. Add error handling in invalid url
// 8. Fix search heading color
// 9. Fix Implement pull to refresh in expired
// 10. Refresh data in background for total registered products
// 11. Change error dialog box to SnackBar

// Additions
// 1. Create a products page
// 2. Create a user details page.
//
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
          seedColor: Colors.blue,
          brightness: Brightness.light,
          // tertiary: Colors.green
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),

      initialBinding: ParentBinding(),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            // systemNavigationBarColor:
            // Theme.of(context).colorScheme.onBackground.withGreen(44),
            ),
        child: isLoggedIn ? const LandingScreen() : const LoginScreen(),
      ),
      // home: isLoggedIn ? const LandingScreen() : const LoginScreen(),
      // home: const SignUpScreen(),
    );
  }
}
