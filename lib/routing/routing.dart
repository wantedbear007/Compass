import 'package:compass/screens/home/home_screen.dart';
import 'package:compass/screens/login/login_screen.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/', page: () => LoginScreen()),
  GetPage(name: '/home', page: () => HomeScreen()),
];
