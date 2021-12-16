import 'package:flutter/material.dart';
import 'package:my_app/home/home.dart';

import 'my_game_info.dart';

class MyGames extends StatefulWidget {
  const MyGames({Key? key}) : super(key: key);

  @override
  State<MyGames> createState() => _MyGamesState();
}

class _MyGamesState extends State<MyGames> {
  final List<GameData> _games = [];

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
    _games.add(GameData("", "Devil May Cry 5", "assets/images/dmc5.jpg",
        _description, 200, 3000));
    _games.add(GameData("", "Resident Evil VIII", "assets/images/re8.jpg",
        _description, 200, 3000));
    _games.add(GameData("", "Need For Speed Heat", "assets/images/nfs.jpg",
        _description, 100, 3000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _games.length,
      itemBuilder: (BuildContext context, int index) {
        return MyGameInfo(_games[index].image, _games[index].title);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 120,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5),
    );
  }
}
