import 'package:flutter/material.dart';
import 'package:postgrad_tracker/ui/board/Board.dart';
import 'package:postgrad_tracker/ui/profile/supervisor/ViewSupProfile.dart';
import 'package:provider/provider.dart';

import 'ui/login/Login.dart';
import 'ui/profile/studentsupervisor/StudentSuperVisorRegister.dart';
import 'ui/profile/student/ViewStudentProfile.dart';
import 'ui/home/Home.dart';
import 'user.dart';
import 'logic/register/student/StudentRegister.dart';
import 'logic/register/supervisor/SupervisorRegister.dart';
import 'ui/board/Board.dart';

// ignore: non_constant_identifier_names
String Email='';
int userType;
// ignore: non_constant_identifier_names
String FName='';
// ignore: non_constant_identifier_names
String LName='';


//Student
// ignore: non_constant_identifier_names
String StudNo='';
// ignore: non_constant_identifier_names
String DegreeType='';
// ignore: non_constant_identifier_names
DateTime DateReg;

//Staff
// ignore: non_constant_identifier_names
String StaffNo='';
// ignore: non_constant_identifier_names
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

