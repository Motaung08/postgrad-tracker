import 'package:flutter/material.dart';

// ignore: must_be_immutable
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