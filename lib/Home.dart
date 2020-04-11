//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:postgrad_tracker/user.dart';
import 'package:postgrad_tracker/Login.dart';

class HomePage extends StatefulWidget {
  final String email;
  final int userType;
//  final String Upload;
//  final String Captue;

  HomePage({this.email, this.userType,});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  TextEditingController titleController = new TextEditingController();

  Future<String> createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Board title: "),
        content: TextField(
          controller: titleController,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("Create Board"),
            onPressed: (){
              Navigator.of(context).pop(titleController.text.toString());
              //addDynamic(titleController.text.toString());
              //Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }

  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon = new Icon(Icons.add);


  addDynamic(String Title) {
//  setState(() {
//
//  });
  print("in addDynamic ... and we have $Title");
    listDynamic.add(new DynamicWidget(giventitle: Title));
    data.add("ello");
  }

  submitData() {
    floatingIcon = new Icon(Icons.arrow_back);
    data = [];
    listDynamic.forEach((widget) => data.add("ello"));
    //setState(() {});
    print(data.length);
  }


  @override

  Widget build(BuildContext context) {


    Widget result = new Flexible(
        flex: 1,
        child: new Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      child: new Text("${index + 1} : ${data[index]}"),
                      //child: new DynamicWidget(giventitle: "test rabbits"),
                    ),
                    new Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget dynamicTextField = new Flexible(

      flex: 2,
//child: Text("he"),
      child: new ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
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
            
            1 == 0 ? result : dynamicTextField,
           // data.length == 0 ? submitButton : new Container(),
            FlatButton(
              onPressed: () {
                //print("New board click");
                createAlertDialog(context).then((onValue){
                  addDynamic("$onValue");
                  setState((){});
                });
              },
              color: Colors.blue,
              padding: EdgeInsets.all(30),
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  Text("  Create new board", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
                ],
              ),
            ),
          ],
        ),
      ),

//        drawer: Drawer(
//          // Add a ListView to the drawer. This ensures the user can scroll
//          // through the options in the drawer if there isn't enough vertical
//          // space to fit everything.
//          child: ListView(
//
//            // Important: Remove any padding from the ListView.
//            padding: EdgeInsets.zero,
//            children: <Widget>[
//              DrawerHeader(
//                child: Text('Menu',
//                    style: TextStyle(
//                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0)),
//
//                decoration: BoxDecoration(
//                  color: Color(0xff009999),
//
//                ),
//              ),
//
//              ListTile(
//                title: Text(
//                    'View Profile',
//                    style: TextStyle(
//                        color: Color(0xff009999), fontWeight: FontWeight.bold)
//                ),
//                onTap: () {
//                  if(widget.userType==1 || widget.userType==2){
//                    Navigator.popAndPushNamed(context, '/StudProfile');
//                  } else if (widget.userType==3){
//                    Navigator.popAndPushNamed(context, '/SupProfile');
//                  }else{
//                    print('User type not recognized');
//                    Navigator.pop(context);
//                  }
//
//                },
//              ),
//              ListTile(
//                title: Text(
//                    'Sign Out',
//                    style: TextStyle(
//                        color: Color(0xff009999), fontWeight: FontWeight.bold)
//                ),
//                onTap: () {
//                  Navigator.popAndPushNamed(context,'/Login');
//                },
//              ),
//              ListTile(
//                title: Text('Profile Picture',
//                style: TextStyle(
//                  color: Color(0xff009999), fontWeight: FontWeight.bold)
//                ),
//                onTap: (){
//                  Navigator.popAndPushNamed(context, '/ProfilePicture');
//                },
//              ),
//            ],
//
//          ),
//
//        )

    drawer: new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text('Tshepang Motaung'),
            accountEmail: Text( 'tshepangmotaung97@gmail.com'),
            currentAccountPicture: GestureDetector(
//              onTap: ()[
//                Uploader(context);
//              ],
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white,),

              ),
            ) ,
          ),
          InkWell(
            onTap: (){
                  if(widget.userType==1 || widget.userType==2)
                  {
                    Navigator.popAndPushNamed(context, '/StudProfile');
                  }
                  else if (widget.userType==3)
                  {
                    Navigator.popAndPushNamed(context, '/SupProfile');
                  }
                  else{
                    print('User type not recognized');
                    Navigator.pop(context);
                  }
            },
            child: ListTile(
              title: Text('My Profile'),
              leading: Icon(Icons.account_box),
            ),
            key: Key('MyProfileInput'),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.assignment, color: Colors.red,),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, color: Colors.blue,),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.popAndPushNamed(context,'/Login');
            },
            key: Key('SignOutInput'),
            child: ListTile(
              title: Text('Sign out'),
              leading: Icon(Icons.timer_off, color: Colors.green,),
            ),
          )
        ],
      ),
    ),
    );
  }
}
class ProfilePictureAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/ProfilePic.png');
    Image image = Image(image: assetImage, width: 200.0, height: 200.0,);
    return Container(child: image,);
  }
}

// ignore: must_be_immutable
class DynamicWidget extends StatelessWidget {
  String giventitle;
  DynamicWidget({Key key, @required this.giventitle}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: new MaterialButton(
          onPressed: (){
            Navigator.pushNamed(context, '/Board');
          },
        color: Colors.blue,
        child: Text(giventitle),
      ),
    );
  }
}



