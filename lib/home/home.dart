import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

import 'product_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<GameData> _games = [];

  final String _baseUrl = "http://127.0.0.1:9090/";

  late Future<bool> fetchedGames;

  Future<bool> fetchGames() async {
    http.Response response = await http.get(Uri.parse(_baseUrl + "game"));
    List<dynamic> gamesFromServer = json.decode(response.body);
    for (var i = 0; i < gamesFromServer.length; i++) {
      _games.add(GameData(
          gamesFromServer[i]["_id"],
          gamesFromServer[i]["title"],
          gamesFromServer[i]["image"],
          gamesFromServer[i]["description"],
          int.parse(gamesFromServer[i]["price"].toString()),
          int.parse(gamesFromServer[i]["quantity"].toString())));
    }

    return true;
    // return fetchedGames;
  }
  // final String _description =
  //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
  //     "sed do eiusmod tempor incididunt ut "
  //     "labore et dolore magna aliqua. Ut enim ad minim veniam, "
  //     "quis nostrud exercitation ullamco laboris nisi ut "
  //     "aliquip ex ea commodo consequat. Duis aute irure dolor "
  //     "in reprehenderit in voluptate velit esse cillum dolore "
  //     "eu fugiat nulla pariatur. Excepteur sint occaecat "
  //     "cupidatat non proident, sunt in culpa qui officia ";

  @override
  void initState() {
    fetchedGames = fetchGames();
    // _games.add(GameData(
    //     "Devil May Cry 5", "assets/images/dmc5.jpg", _description, 200, 3000));
    // _games.add(GameData("Resident Evil VIII", "assets/images/re8.jpg",
    //     _description, 200, 3000));
    // _games.add(GameData("Need For Speed Heat", "assets/images/nfs.jpg",
    //     _description, 100, 3000));
    // _games.add(GameData("Red Dead Redemption II", "assets/images/rdr2.jpg",
    //     _description, 150, 3000));
    // _games.add(
    //     GameData("FIFA 22", "assets/images/fifa.jpg", _description, 100, 3000));
    // _games.add(GameData(
    //     "Minecraft", "assets/images/minecraft.jpg", _description, 200, 3000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchedGames,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: _games.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductInfo(
                    _games[index]._id,
                    _games[index].image,
                    _games[index].title,
                    _games[index].description,
                    _games[index].price,
                    _games[index].quantity);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class GameData {
  final String _id;
  final String title;
  final String image;
  final String description;
  final int price;
  final int quantity;

  GameData(this._id, this.title, this.image, this.description, this.price,
      this.quantity);

  @override
  String toString() {
    return 'GameData{title: $title, image: $image, description: $description, price: $price, quantity: $quantity}';
  }
}
