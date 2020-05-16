import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/Project_Board.dart';
import 'package:postgrad_tracker/main.dart';

class Board extends StatefulWidget {
  //final String title;
  // ignore: non_constant_identifier_names
  final Project_Board proj_board;

  // ignore: non_constant_identifier_names
  const Board({Key key, this.proj_board}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(project_board.Project_Title),
        backgroundColor: Color(0xff009999),
      ),
    );
  }
}
