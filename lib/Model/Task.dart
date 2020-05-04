import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final TaskID;
  // ignore: non_constant_identifier_names
  final ListID;
  // ignore: non_constant_identifier_names
  final Task_Title;
  // ignore: non_constant_identifier_names
  final Task_Description;
  // ignore: non_constant_identifier_names
  final Task_AddedBy;
  // ignore: non_constant_identifier_names
  final Task_StatusID;
  // ignore: non_constant_identifier_names
  final Task_DateAdded;
  // ignore: non_constant_identifier_names
  final Task_Due;

  // ignore: non_constant_identifier_names
  const Task({Key key, this.TaskID, this.ListID, this.Task_Title, this.Task_Description, this.Task_AddedBy, this.Task_StatusID, this.Task_DateAdded, this.Task_Due}) : super(key: key);

  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}