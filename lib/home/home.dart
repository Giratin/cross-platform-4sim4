import 'package:flutter/material.dart';
import 'package:my_app/my_games/my_game_info.dart';

import 'product_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<GameInfo> _games = [];

  final String _description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
      "sed do eiusmod tempor incididunt ut "
      "labore et dolore magna aliqua. Ut enim ad minim veniam, "
      "quis nostrud exercitation ullamco laboris nisi ut "
      "aliquip ex ea commodo consequat. Duis aute irure dolor "
      "in reprehenderit in voluptate velit esse cillum dolore "
      "eu fugiat nulla pariatur. Excepteur sint occaecat "
      "cupidatat non proident, sunt in culpa qui officia ";

  @override
  void initState() {
    // _games.add(GameData("Devil May Cry 5", "assets/images/dmc5.jpg",  _description, 200, 3000));
    // _games.add(GameData("Resident Evil VIII", "assets/images/re8.jpg",  _description, 200, 3000));
    // _games.add(GameData("Need For Speed Heat", "assets/images/nfs.jpg",  _description, 100, 3000));
    // _games.add(GameData("Red Dead Redemption II", "assets/images/rdr2.jpg",  _description, 150, 3000));
    // _games.add(GameData("FIFA 22", "assets/images/fifa.jpg",  _description, 100, 3000));
    // _games.add(GameData("Minecraft", "assets/images/minecraft.jpg",  _description, 200, 3000));
    _games.add(GameInfo("assets/images/dmc5.jpg", "Devil May Cry 5"));
    _games.add(GameInfo("assets/images/re8.jpg", "Resident Evil VIII"));
    _games.add(GameInfo("assets/images/nfs.jpg", "Need For Speed Heat"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("G-Store ESPRIT"),
        ),
        body: GridView.builder(
          itemCount: _games.length,
          itemBuilder: (BuildContext context, int index) {
            return MyGameInfo(
              _games[index].image,
              _games[index].title,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        ));
  }
}

class GameData {
  final String title;
  final String image;
  final String description;
  final int price;
  final int quantity;

  GameData(this.title, this.image, this.description, this.price, this.quantity);

  @override
  String toString() {
    return 'GameData{title: $title, image: $image, description: $description, price: $price, quantity: $quantity}';
  }
}
