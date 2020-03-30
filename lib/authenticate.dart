import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Login.dart';
import 'package:postgrad_tracker/StudentRegister.dart';
import 'package:postgrad_tracker/StudentSuperVisorRegister.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginPage();
    } else {
      return StudentRegisterPage();
    }
  }
}