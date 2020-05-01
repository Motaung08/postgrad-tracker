import 'package:flutter/material.dart';
import 'package:postgrad_tracker/ui/login/Login.dart';
import 'package:postgrad_tracker/logic/register/student/StudentRegister.dart';


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