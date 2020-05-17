import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/Project_Board.dart';

class Supervisor extends StatefulWidget {
  String email;
  String staffNo;
  String fName;
  String lName;
  String office;

  /* Variable to check if the supervisor can register (not has registered as
  then the check for duplicate emails would fail. */
  bool register;



  _SupervisorState createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

