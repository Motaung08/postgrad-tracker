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



Future<String> createAlertDialog(BuildContext context) {
  TextEditingController titleController =new TextEditingController();
  titleController.text=project_board.Project_Title;
  String title="";
  if(project_board.Project_Title!=null){
    title=project_board.Project_Title;
  }
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(

          title: Text("Edit title: "),
          content: TextFormField(
            controller: titleController,
          ),
          actions: <Widget>[

            MaterialButton(
              elevation: 5.0,
              child: Text("Save"),
              onPressed: () {
                boardTitle=titleController.text;
                project_board.Project_Title=titleController.text;
                project_boardController.updateBoard();

                //Navigator.of(context).pop(titleController.text.toString());
                Navigator.of(context).pop();
              },
            )
          ],
        );

      });
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){},
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: (){createAlertDialog(context);},
              ),
            ),
          )
        ],
        title: Text(project_board.Project_Title),
        backgroundColor: Color(0xff009999),
      ),
    );
  }
}
