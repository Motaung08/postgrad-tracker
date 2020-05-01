import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:postgrad_tracker/logic/register/supervisor/SupervisorRegister.dart';
import '../../../logic/register/student/StudentRegister.dart';

class StudentSupChoicePage extends StatefulWidget {
  StudentSupChoicePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

//  final Function toggleView;
//  StudentRegisterPage({this.toggleView});
  @override
  _StudentSupChoicePageState createState() => _StudentSupChoicePageState();
}

class _StudentSupChoicePageState extends State<StudentSupChoicePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final supervisorButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.pushNamed(context, '/SupervisorRegister');
        },
        key: Key('supervisorButonInput'),
        child: Text("Supervisor",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final studentButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudentRegisterPage()),
          );
        },
        key: Key('studentButonInput'),
        child: Text("Student",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    Widget _divider() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            Text('or'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    }

    const Alignment topLeft = Alignment(-1.0, -1.0);

    return Scaffold(
      body: Center(
          child: Row(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //BackButton(),
                  SizedBox(height: 65.0, width: 500.0, child: supervisorButon),

                  SizedBox(
                    height: 15.0,
                    width: 50.0,
                  ),
                  SizedBox(height: 45.0, width: 500.0, child: _divider()),

                  SizedBox(
                    height: 15.0,
                    width: 50.0,
                  ),
                  SizedBox(
                    height: 65.0,
                    width: 500.0,
                    child: studentButon,
                  ),
                  SizedBox(
                    height: 15.0,
                    width: 50.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
