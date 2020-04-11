import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:postgrad_tracker/main.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class ViewStudentProfilePage extends StatefulWidget {
  final String email;
  final int userType;
  ViewStudentProfilePage({this.email,this.userType});


  //ViewProfilePage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _ViewStudentProfilePageState createState() => _ViewStudentProfilePageState();
}

String msg='';

class _ViewStudentProfilePageState extends State<ViewStudentProfilePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Future<List> _viewStudDetails() async{
    print('let us deduce details...');
    final response = await http.post("https://innovativeskyline.000webhostapp.com/viewStudentProfile.php",body: {
      "Email": Email,
      "Student number": StudNo,
    });

    var datauser= json.decode(response.body);

    if(datauser.length==0){
      print("Nada");
      setState(() {
        msg=" Error :( ";
      });
    }else{
      print("Assigning...");
      setState(() {
        FName=datauser[0]['Stud_FName'];
        LName=datauser[0]['Std_LName'];
        StudNo=datauser[0]['StudentNo'];
        DegreeType=datauser[0]['DegreeID'];
        //DateReg=datauser[0]['Stud_RegDate'];
        //userType=int.parse(datauser[0]['UserType']);
      });
      //Navigator.popAndPushNamed(context, '/Home');
    }
    print(response.body);
    return datauser;
  }
//  File imageFile;

  _openGallary(){

  }

  _openCamera(){

  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Choose"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallary"),
                onTap: (){
                  _openGallary();
                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera();
                },
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewStudDetails();
    final FullName= FName + " " + LName;

    final studentProfile = Container(
      //elevation: 5.0,
      //borderRadius: BorderRadius.circular(30.0),b
      key: Key('studentProfileInput'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[
//                Text("Profile:  \n",
//                    //textAlign: TextAlign.center,
//                    style: style.copyWith(
//                        color: Color(0xff009999), fontWeight: FontWeight.bold, fontSize: 24)
//                ),
                Text("No image Selected"),
                RaisedButton(onPressed: (){
                  _showChoiceDialog(context);

                },child: Text("Select Image"), key: Key('SelectImageButtonInput'),),
                Padding(padding: EdgeInsets.all(8.0),),

                Text( 
                    "Name: " + FullName+ "\n",
                    textAlign: TextAlign.start,
                    style: style.copyWith(
                      color: Color(0xff009999), fontWeight: FontWeight.bold, fontSize: 18)
                 ),

                Text(
                    "Student Number: "+StudNo+"\n",
                    textAlign: TextAlign.start,
                    style: style.copyWith(
                        color: Color(0xff009999), fontWeight: FontWeight.bold, fontSize: 18)
                ),
                Text(
                    "Email: "+Email+"\n",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Color(0xff009999), fontWeight: FontWeight.bold, fontSize: 18)
                ),
                Text(
                    "Degree: "+DegreeType+"\n",
                    textAlign: TextAlign.start,
                    style: style.copyWith(
                        color: Color(0xff009999), fontWeight: FontWeight.bold, fontSize: 18)
                ),
                Text(
                    "Date Registered: "+DateReg.toString()+"\n",
                    textAlign: TextAlign.start,
                    style: style.copyWith(
                        color: Color(0xff009999), fontWeight: FontWeight.bold, fontSize: 18)
                )
        ]
      )
    );



    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color(0xff009999),
      ),

      body: Center(
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      SizedBox(child: studentProfile)
                    ],
                ),
              ),
            ),
          ],
      )),
    );
  }
}
