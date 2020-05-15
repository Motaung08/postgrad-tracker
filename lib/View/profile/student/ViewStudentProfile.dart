import 'package:flutter/material.dart';
import 'package:postgrad_tracker/main.dart';
import 'package:intl/intl.dart';

import '../../../user.dart';


class ViewStudentProfilePage extends StatefulWidget {
//  final User user;
//
//  const ViewStudentProfilePage({Key key, this.user}) : super(key: key);
  @override
  _ViewStudentProfilePageState createState() => _ViewStudentProfilePageState();
}
final User user = new User();
String msg = '';

class _ViewStudentProfilePageState extends State<ViewStudentProfilePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  String typeName="";



  @override
  Widget build(BuildContext context) {
    studentController.GetStudDetails();

    setState(() {

    });

    final studentProfile = Container(

        child: Column(children: <Widget>[
          Text("Profile:  \n",
              //textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          Text("Name: " + student.fName+ " " +student.lName + "\n",
              //textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text("Student Number: " + student.studentNo + "\n",
              //textAlign: TextAlign.start,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text("Email: " + student.email + "\n",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text("Degree: " +

              studentController.DetermineDegreeType()
              + "\n",
              textAlign: TextAlign.start,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text("Date Registered: " + dateFormat.format(student.registrationDate) + "\n",
              textAlign: TextAlign.start,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text("Student Type: " +

              studentController.DetermineStudentType()
              + "\n",
              textAlign: TextAlign.start,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
    ]));

    return Scaffold(
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
                  children: <Widget>[SizedBox(child: studentProfile)],
                ),
              ),
            ),
        ],
      )),
    );
  }
}
