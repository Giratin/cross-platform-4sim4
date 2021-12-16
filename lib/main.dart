import 'package:flutter/material.dart';
import 'package:my_app/splash_screen.dart';

import 'basket/basket.dart';
import 'my_games/my_games.dart';
import 'navigation/nav_bottom.dart';
import 'navigation/nav_tab.dart';
import 'reset_password.dart';
import 'signin.dart';
import 'signup.dart';
import 'product_details.dart';
import 'home/home.dart';
import 'update_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G-Store ESPRIT',
      routes: {
        "/": (BuildContext context) {
          return const SplashScreen();
        },
        "/resetPwd": (BuildContext context) {
          return const ResetPassword();
        },
        "/home": (BuildContext context) {
          return const NavigationBottom();
        },
        "/home/myGames": (BuildContext context) {
          return const MyGames();
        },
        "/home/basket": (BuildContext context) {
          return const Basket();
        },
        "/signup": (BuildContext context) {
          return const Signup();
        },
        "/signin": (BuildContext context) {
          return const Signin();
        },
        "/home/updateUser": (BuildContext context) {
          return const UpdateUser();
        },
        "/home/navTab": (BuildContext context) {
          return const NavigationTab();
        }
      },
    );
  }
}
