import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/Task.dart';

class ListCard extends StatefulWidget {
  int ListID;
  int ProjectID;
  String List_Title;



  List<Task> listTasks=new List<Task>();
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

