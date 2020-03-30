import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Board.dart';
import 'package:postgrad_tracker/ViewSupProfile.dart';
import 'package:provider/provider.dart';

import 'Login.dart';
import 'StudentSuperVisorRegister.dart';
import 'ViewStudentProfile.dart';
import 'Home.dart';
import 'user.dart';
import 'StudentRegister.dart';
import 'SupervisorRegister.dart';
import 'Board.dart';

String Email='';
int userType;
String FName='';
String LName='';


//Student
String StudNo='';
String DegreeType='';
DateTime DateReg;

//Staff
String StaffNo='';
String OfficePhone='';

//Board
String boardTitle='';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        //value: AuthService().user,
        child: MaterialApp(
          title: 'Postgraduate Tracker',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: <String,WidgetBuilder>{
           // '/': (context) => new LoginPage(),
            '/Login': (context) => new LoginPage(),
            '/Home':(context)=>new HomePage(email: Email,userType: userType),
            '/StudProfile':(BuildContext context)=>new ViewStudentProfilePage(email: Email,userType: userType),
            '/SupProfile':(BuildContext context)=>new ViewSupProfilePage(email: Email,userType: userType),
            '/RegisterChoice':(context)=>new StudentSupChoicePage(),
            '/StudentRegister':(context)=>new StudentRegisterPage(),
            '/SupervisorRegister':(context)=>new SupervisorRegisterPage(),
            '/Board':(context)=>new Board(title: boardTitle),
          },
          home: StudentRegisterPage(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        )
    );
  }
}

