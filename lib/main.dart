import 'package:compass/screens/RegisterProduct/register_product.dart';
import 'package:compass/screens/home/home_screen.dart';
import 'package:compass/screens/register/register_screen.dart';
import 'package:compass/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: const RegisterProduct(),
    );
  }
}
