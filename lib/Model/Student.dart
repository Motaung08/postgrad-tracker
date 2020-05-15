import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Student extends StatefulWidget {
  String email;
  String studentNo;
  String fName;
  String lName;
  int degreeID;
  DateTime registrationDate;
  int studentTypeID;

  /* Variable to check if the student can register (not has registered as then the
  check for duplicate emails would fail. */
  bool register;


  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

