import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/ListCard.dart';
import 'package:postgrad_tracker/Model/Project_Board.dart';
import 'package:postgrad_tracker/main.dart';

class Board extends StatefulWidget {
  //final String title;
  // ignore: non_constant_identifier_names
  final Project_Board proj_board;
  List<DynamicWidget> listDynamic = [];
  final items = List();
  Board({Key key, this.proj_board}) : super(key: key);

  // ignore: non_constant_identifier_names

  Future populateListDisplay(int ProjectID) async {
    lists = [];
    items.clear();
    await listController.ReadLists(ProjectID);
    print('Initializing list display! ##################');
    for (int i = 0; i < lists.length; i++) {
      listDynamic.add(new DynamicWidget(aList: lists[i]));
      items.add(listDynamic[i]);
      print(i);
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
            lists = [];
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

    void gen(){
      for (int i=0;i<widget.listDynamic.length;i++){
        new GridTile(child: widget.listDynamic[i]);
      }
    };

    List<Widget> testList=List<Widget>();
    void pop(){
      for (int i=0;i<widget.listDynamic.length;i++){
        testList.add(widget.listDynamic[i]);
      }
      testList.add(addListCard);
    };
    testList.clear();
    pop();

    

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
        child:  GridView.builder(
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
      )

    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0, color: (Colors.white));
  //String giventitle='';
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
            Icon(Icons.add, color: Colors.white,),
            Text("Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        )
      ),
    );

    return new ListView(
      children: <Widget>[

      Container(
        width: MediaQuery.of(context).size.width / 2,
        margin: new EdgeInsets.all(10.0),
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 8),
        borderRadius: BorderRadius.circular(12),
        ),




      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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


            addTaskButon,
            SizedBox(
              height: 20,
            ),
          ]
      ),


)

      ],
    );
  }
}
