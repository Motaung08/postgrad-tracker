import 'package:flutter/material.dart';

class UserType extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final UserTypeID;
  final title;

  // ignore: non_constant_identifier_names
  const UserType({Key key, this.UserTypeID, this.title}) : super(key: key);

  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}