import 'package:flutter/material.dart';

import 'my_games/my_games.dart';
import 'signin.dart';
import 'signup.dart';
import 'product_details.dart';
import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'G-Store ESPRIT',
      // home: Home(),
      // home: MyGames(),
      // home: Signin(),
      home: Signup(),
      // home: ProductDetails("assets/images/dmc5.jpg", "Devil May Cry 5",
      //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
      //         "sed do eiusmod tempor incididunt ut "
      //         "labore et dolore magna aliqua. Ut enim ad minim veniam, "
      //         "quis nostrud exercitation ullamco laboris nisi ut "
      //         "aliquip ex ea commodo consequat. Duis aute irure dolor "
      //         "in reprehenderit in voluptate velit esse cillum dolore "
      //         "eu fugiat nulla pariatur. Excepteur sint occaecat "
      //         "cupidatat non proident, sunt in culpa qui officia "
      //         "deserunt mollit anim id est laborum.", 200, 3000)
    );
  }
}
