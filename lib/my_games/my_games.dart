import 'package:flutter/material.dart';

import 'my_game_info.dart';

class MyGames extends StatelessWidget {
  const MyGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ma bibliothèque"),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: const [
            MyGameInfo("assets/images/dmc5.jpg", "Devil May Cry 5"),
            MyGameInfo("assets/images/re8.jpg", "Resident Evil VIII"),
            MyGameInfo("assets/images/nfs.jpg", "Need For Speed Heat")
          ],
        )
        /*Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const MyGameInfo("assets/images/dmc5.jpg", "Devil May Cry 5"),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    MyGameInfo("assets/images/re8.jpg", "Resident Evil VIII")
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const MyGameInfo("assets/images/nfs.jpg", "Need For Speed Heat")
        ],
      ),*/
        );
  }
}
