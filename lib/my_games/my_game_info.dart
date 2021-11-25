import 'package:flutter/material.dart';

class MyGameInfo extends StatefulWidget {
  final String _image;
  final String _title;

  const MyGameInfo(this._image, this._title);

  @override
  State<MyGameInfo> createState() => _MyGameInfoState();
}

class _MyGameInfoState extends State<MyGameInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
              child: Image.asset(widget._image, width: 155, height: 58),
            ),
            Text(widget._title)
          ],
        ),
      ),
    );
  }
}

class GameInfo {
  final String image;
  final String title;

  GameInfo(this.image, this.title);
}
