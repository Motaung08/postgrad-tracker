import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:postgrad_tracker/Model/ListCard.dart';
import 'package:postgrad_tracker/Model/Project_Board.dart';
import 'package:postgrad_tracker/Model/Task.dart';
import 'package:postgrad_tracker/main.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Board extends StatefulWidget {
  //final String title;
  // ignore: non_constant_identifier_names
  final Project_Board proj_board;
  List<DynamicWidget> listDynamic = [];
  final items = List();
  Board({Key key, this.proj_board}) : super(key: key);

  // ignore: non_constant_identifier_names
  List<StaggeredTile> stiles =new List<StaggeredTile>();


  Future populateListDisplay(int ProjectID) async {
    //lists = [];
    int boardIndex;

    for(int i=0;i<user.boards.length;i++){
      if(user.boards[i].ProjectID==ProjectID){
        boardIndex=i;
      }
    }
    items.clear();
    if(user.boards[boardIndex].boardLists!=null){
      print('Initializing list display! ##################');
      stiles.clear();
        for (int i = 0; i < user.boards[boardIndex].boardLists.length; i++) {
          listDynamic.add(new DynamicWidget(aList: user.boards[boardIndex].boardLists[i]));
          items.add(listDynamic[i]);
          print(i);
          print('adding stiles for: StaggeredTile.count('+(2).toString()+","+(user.boards[boardIndex].boardLists[i].listTasks.length+2).toString()+")");
          stiles.add(

              StaggeredTile.count(2, user.boards[boardIndex].boardLists[i].listTasks.length+2));
        }
        //print("STILES"+stiles.length.toString());





    }


  }

  @override
  _BoardState createState() => _BoardState();
}

Future<String> createAlertDialog(BuildContext context) {
  TextEditingController titleController = new TextEditingController();
  titleController.text = project_board.Project_Title;
  String title = "";
  if (project_board.Project_Title != null) {
    title = project_board.Project_Title;
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
                boardTitle = titleController.text;
                project_board.Project_Title = titleController.text;
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController listTitle = new TextEditingController();
  final items = List();

  @override
  Widget build(BuildContext context) {

    final orientation = MediaQuery.of(context).orientation;
    //listTitle.text="Enter list title ...";

    final addListButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          //if (_formKey.currentState.validate()) {
          listController.createList(listTitle.text);
          //lists = [];
          widget.populateListDisplay(project_board.ProjectID);
          setState(() {});
          //}
        },
        key: Key('ListInput'),
        child: Text("Add list",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    final ListCardItem = new Container(
      //width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            controller: listTitle,
            decoration: InputDecoration(
                fillColor: Colors.white, hintText: "Enter list title..."),
          ),
          SizedBox(
            height: 20,
          ),
          addListButon,
        ]),
      ),
    );
    items.add(ListCardItem);

    final addListCard = GridTile(
      child: Container(
        margin: new EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: listTitle,
                decoration: InputDecoration(
                    fillColor: Colors.white, hintText: "Enter list title..."),
              ),
              SizedBox(
                height: 20,
              ),
              addListButon,
            ]),
      ),
    );

    Widget dynamicLists = new Flexible(
      flex: 2,
      child: new GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        //itemBuilder: (_, index) => widget.listDynamic[index],
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new GridTile(child: items[index]),
          );
        },
      ),
    );

    List<Widget> testList = List<Widget>();

    void pop() {
      testList.clear();

      for (int i = 0; i < widget.listDynamic.length; i++) {
        testList.add(widget.listDynamic[i]);

      }
      testList.add(addListCard);
      widget.stiles.add(StaggeredTile.count(2, 2));
      print("testList: "+testList.length.toString());
      print(" stiles: "+widget.stiles.length.toString());

    }

    pop();
    print("STILES: "+widget.stiles.length.toString());
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  createAlertDialog(context);
                },
              ),
            ),
          )
        ],
        title: Text(project_board.Project_Title),
        backgroundColor: Color(0xff009999),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        margin: new EdgeInsets.all(10.0),
        child:  StaggeredGridView.count(
          primary: false,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: testList,
          staggeredTiles: widget.stiles,
        ),
      ),
      /*
          GridView.builder(
          itemCount: testList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new GridTile(
                child: testList[index], //just for testing, will fill with image later
              ),
            );
          },

        ),
           */
    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0, color: (Colors.white));

  ListCard aList;


  DynamicWidget({Key key, @required this.aList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addTaskButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999).withOpacity(0.65),

      //Color(0xff009999),
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
//            listController.createList(listTitle.text);
//            lists=[];
//            widget.populateListDisplay(project_board.ProjectID);
//            setState(() {
//
//            });
          },
          key: Key('ListInput'),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text("Add Task",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          )),
    );

    return new Container(
      width: MediaQuery.of(context).size.width / 2,
      margin: new EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Text(aList.List_Title,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    //createAlertDialog(context);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(itemBuilder:
                  (_,index)=>Text('Item $index'),
              ),

            ),
            addTaskButon,

          ]),
    );
  }
}
