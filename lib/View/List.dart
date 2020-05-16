//import 'package:flutter/material.dart';
//import 'package:postgrad_tracker/Model/ListCard.dart';
//import 'package:postgrad_tracker/Model/Project_Board.dart';
//import 'package:postgrad_tracker/main.dart';
//
//class ListCardView extends StatefulWidget {
//
//  final List<DynamicWidget> listDynamic = [];
//
//
//
//
//  // ignore: non_constant_identifier_names
//
//
//
//  @override
//  _ListCardViewState createState() => _ListCardViewState();
//}
//
//
//
//Future<String> createAlertDialog(BuildContext context) {
//  TextEditingController titleController =new TextEditingController();
//  titleController.text=L.Project_Title;
//  String title="";
//  if(project_board.Project_Title!=null){
//    title=project_board.Project_Title;
//  }
//  return showDialog(
//      context: context,
//      builder: (context) {
//        return AlertDialog(
//
//          title: Text("Edit title: "),
//          content: TextFormField(
//            controller: titleController,
//          ),
//          actions: <Widget>[
//
//            MaterialButton(
//              elevation: 5.0,
//              child: Text("Save"),
//              onPressed: () {
//                boardTitle=titleController.text;
//                project_board.Project_Title=titleController.text;
//                project_boardController.updateBoard();
//
//                //Navigator.of(context).pop(titleController.text.toString());
//                Navigator.of(context).pop();
//              },
//            )
//          ],
//        );
//
//      });
//}
//
//
//
//class _ListCardViewState extends State<ListCardView> {
//
//  final noBoardsView= new Column(
//    children: <Widget>[
//      Container(
//        width: MediaQuery.of(context).size.width/1.1,
//        child: Text("Click the + button below to create a board.",
//          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
//        ),
//      ),
//      arrowImage,
//    ],
//  );
//
//
//  @override
//  Widget build(BuildContext context) {
//
//    Widget dynamicTextField = new Flexible(
//      flex: 2,
//      child: new ListView.builder(
//        itemCount: widget.listDynamic.length,
//        itemBuilder: (_, index) => widget.listDynamic[index],
//      ),
//    );
//
//    return Scaffold(
//      appBar: AppBar(
//        actions: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(right: 20.0),
//            child: GestureDetector(
//              onTap: (){},
//              child: IconButton(
//                icon: Icon(Icons.edit),
//                onPressed: (){createAlertDialog(context);},
//              ),
//            ),
//          )
//        ],
//        title: Text(project_board.Project_Title),
//        backgroundColor: Color(0xff009999),
//      ),
//      body: new Container(
//        margin: new EdgeInsets.all(10.0),
////         // height: MediaQuery.of(context).size.height,
//        child: new Column(
////
//            mainAxisAlignment: MainAxisAlignment.end,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              //boards.isEmpty? noBoardsView : dynamicLists,
//            ]
//        ),
//      ),
//    );
//  }
//}
//
//class DynamicWidget extends StatelessWidget {
//  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: (Colors.white));
//  //String giventitle='';
//  ListCard aList;
//
//  DynamicWidget({Key key, @required this.aList}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Container(
//      margin: new EdgeInsets.all(8.0),
//      child: new MaterialButton(
//        elevation: 5.0,
//        //borderRadius: BorderRadius.circular(30.0),
//        color: Colors.blueGrey
//        //Color(0xff009999)
//        ,
//        onPressed: () {
//
//        },
//        child: Text(aList.List_Title, style: style,),
//      ),
//
//    );
//  }
//}
