import 'package:flutter/material.dart';

class User extends StatefulWidget {
  int userID;
  String email;
  String password;
  int userTypeID;

  /* Variable to check if the user can register (not has registered as then the
  check for duplicate emails would fail. */
  bool register;



 // User(this.userID, this._email, this.password, this.userTypeID);

  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

