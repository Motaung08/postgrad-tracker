import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  int TaskID;
  int ListID;
  String Task_Title;
  String Task_Description;
  String Task_AddedBy;
  int Task_StatusID;
  DateTime Task_DateAdded;
  DateTime Task_Due;


  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

