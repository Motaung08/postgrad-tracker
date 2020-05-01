import 'package:flutter/material.dart';
import 'package:postgrad_tracker/main.dart';

class Board extends StatefulWidget {
  final String title;

  const Board({Key key, this.title}) : super(key: key);
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(boardTitle),
          backgroundColor: Color(0xff009999),
        ),
    );
    }
}
