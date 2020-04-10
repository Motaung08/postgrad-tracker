//import 'dart:convert';
//import 'dart:html';
//
//import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'package:postgrad_tracker/main.dart';
//import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';
//
//
//class ViewProfilePic extends StatefulWidget {
//  final String gallary;
//  final String camera;
//  ViewProfilePic({this. gallary,this.camera});
//
//
//  //ViewProfilePage({Key key, this.title}) : super(key: key);
//
//  //final String title;
//
//  @override
//  _ViewProfilePicState createState() => _ViewProfilePicState();
//}
//
//String msg='';
//
//class _ViewProfilePicState extends State<ViewProfilePic> {
//
//  File imageFile;
//
//  _openGallary() async {
//    var picture  = await ImagePicker.pickImage(source: ImageSource.gallery);
//    this.setState(() {
//      imageFile = picture as File;
//    });
//
//
//  }
//
//  _openCamera() async{
//    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
//    this.setState(() {
//      imageFile = picture as File;
//    });
//
//  }
//
//  Future<void> _showChoiceDialog(BuildContext context){
//    return showDialog(context: context, builder: (BuildContext context){
//      return AlertDialog(
//        title: Text("Choose"),
//        content: SingleChildScrollView(
//          child: ListBody(
//            children: <Widget>[
//              GestureDetector(
//                child: Text("Gallary"),
//                onTap: (){
//                  _openGallary();
//                },
//              ),
//              Padding(padding: EdgeInsets.all(8.0),),
//              GestureDetector(
//                child: Text("Camera"),
//                onTap: (){
//                  _openCamera();
//                },
//              )
//            ],
//          ),
//        ),
//      );
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final studentProfile = Container(
//      //elevation: 5.0,
//      //borderRadius: BorderRadius.circular(30.0),b
//
//        child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              Text("No image Selected"),
//              RaisedButton(onPressed: (){
//                _showChoiceDialog(context);
//
//              },
//                child: Text("Select Image"),),
//                  Padding(padding: EdgeInsets.all(8.0),),
//            ]
//        )
//    );
//
//
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Profile Picture"),
//        backgroundColor: Color(0xff009999),
//      ),
//
//      body: Center(
//          child: Row(
//            children: <Widget>[
//              Container(
//                color: Colors.white,
//                width: MediaQuery.of(context).size.width,
//                child: Padding(
//                  padding: const EdgeInsets.all(36.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.center,
//
//                    children: <Widget>[
//                      SizedBox(child: studentProfile)
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          )),
//    );
//  }
//}
