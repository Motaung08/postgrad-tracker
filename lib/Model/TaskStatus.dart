import 'package:flutter/material.dart';

class TaskStatus extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final TaskStatusID;
  // ignore: non_constant_identifier_names
  final Status;

  // ignore: non_constant_identifier_names
  const TaskStatus({Key key, this.TaskStatusID, this.Status}) : super(key: key);

  _TaskStatusState createState() => _TaskStatusState();
}

class _TaskStatusState extends State<TaskStatus> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
