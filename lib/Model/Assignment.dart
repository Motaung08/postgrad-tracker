import 'package:flutter/material.dart';

class Assignment extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final AssignmentID;
  final studentNo;
  final projectID;
  final staffNo;

  // ignore: non_constant_identifier_names
  const Assignment({Key key, this.AssignmentID, this.studentNo, this.projectID, this.staffNo}) : super(key: key);

  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
