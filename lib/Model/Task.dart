import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final TaskID;
  final ListID;
  final Task_Title;
  final Task_Description;
  final Task_AddedBy;
  final Task_StatusID;
  final Task_DateAdded;
  final Task_Due;

  const Task({Key key, this.TaskID, this.ListID, this.Task_Title, this.Task_Description, this.Task_AddedBy, this.Task_StatusID, this.Task_DateAdded, this.Task_Due}) : super(key: key);

  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

