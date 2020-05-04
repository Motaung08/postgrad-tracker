import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/Project_Board.dart';
//import 'package:postgrad_tracker/Model/User.dart';
//import 'package:postgrad_tracker/View/board/Board.dart';
import 'package:postgrad_tracker/main.dart';


class HomePage extends StatefulWidget {

  final  List<DynamicWidget> listDynamic = [];

  initializeDisplay(){
    print('Initializing board display! ##################');
    for(int i=0;i<boards.length;i++){
      listDynamic.add(new DynamicWidget(aboard: boards[i]));
    }

  }

  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<HomePage> {
  TextEditingController titleController = new TextEditingController();
//  List<DynamicWidget> listDynamic = [];


  //int userType=user.userTypeID;
  Future<String> createAlertDialog(BuildContext context) {

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(

            title: Text("Board title: "),
            content: TextField(
              controller: titleController,

            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Create Board"),
                onPressed: () {

                  Navigator.of(context).pop(titleController.text.toString());

                },
              )
            ],
          );
        });
  }

  Icon floatingIcon = new Icon(Icons.add);

  addDynamic(Project_Board givenBoard) {
    widget.listDynamic.add(new DynamicWidget(aboard: givenBoard));

  }


  signout(){
    boards.clear();
    widget.listDynamic.clear();
    Navigator.popAndPushNamed(context, '/Login');

    //NOTE!!! more will need to be done here.
  }



  @override
  Widget build(BuildContext context) {

    Widget dynamicTextField = new Flexible(
      flex: 2,
      child: new ListView.builder(
        itemCount: widget.listDynamic.length,
        itemBuilder: (_, index) => widget.listDynamic[index],
      ),
    );

    return Scaffold(

        appBar: AppBar(
          title: Text("Innovative Skyline"),
          backgroundColor: Color(0xff009999),
        ),
        body: new Container(
          margin: new EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              dynamicTextField,
              //1 == 0 ? result : dynamicTextField,
              // data.length == 0 ? submitButton : new Container(),

              FlatButton(
                onPressed: () {

                  createAlertDialog(context).then((onValue){
                    //Project_Board created=new Project_Board();
                    //created.Project_Title
                    project_board.Project_Title='$onValue';
                    project_boardController.createBoard('$onValue');
                    addDynamic(project_board);
                    setState(() {

                    });
                  });

                },
                color: Colors.blue,
                padding: EdgeInsets.all(30),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    Text(
                      "  Create new board",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
                decoration: BoxDecoration(
                  color: Color(0xff009999),
                ),
              ),
              ListTile(
                title: Text('View Profile',
                    style: TextStyle(
                        color: Color(0xff009999), fontWeight: FontWeight.bold)),
                onTap: () {
                  print("USER SUPERVISOR: "+user.userTypeID.toString() );
                  if (user.userTypeID == 1) {
                    Navigator.popAndPushNamed(context, '/StudProfile');
                  } else if (user.userTypeID == 2) {
                    supervisorController.GetSupDetails();
                    print('Navigate to View Supervisor Profile: '+supervisor.staffNo);
                    Navigator.popAndPushNamed(context, '/SupProfile');
                  } else {
                    print('User type not recognized');
                    Navigator.pop(context);
                  }
                },
              ),


              ListTile(
                title: Text('Sign Out',
                    style: TextStyle(
                        color: Color(0xff009999), fontWeight: FontWeight.bold)),
                onTap: () {
                  signout();
                },
              ),
            ],
          ),
        ));
  }
}


// ignore: must_be_immutable
class DynamicWidget extends StatelessWidget {
  //String giventitle='';
  Project_Board aboard;

  DynamicWidget({Key key, @required this.aboard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: new MaterialButton(
        onPressed: () {
          project_board=aboard;
          Navigator.pushNamed(context, '/Board');
        },
        color: Colors.blue,
        child: Text(aboard.Project_Title),
      ),
    );
  }
}