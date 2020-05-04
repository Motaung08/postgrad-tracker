import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Controller/SupervisorController.dart';
import 'package:postgrad_tracker/Controller/UserController.dart';
import 'package:postgrad_tracker/Controller/Project_BoardController.dart';
import 'package:postgrad_tracker/Controller/StudentController.dart';
import 'package:postgrad_tracker/Model/Project_Board.dart';
import 'package:postgrad_tracker/Model/Student.dart';
import 'package:postgrad_tracker/Model/Supervisor.dart';
import 'package:postgrad_tracker/Model/User.dart';
import 'package:postgrad_tracker/View/Login.dart';
import 'package:postgrad_tracker/View/profile/supervisor/ViewSupProfile.dart';
import 'package:postgrad_tracker/View/resetpassword.dart';
import 'View/Board.dart';
import 'View/Home.dart';
import 'View/profile/student/ViewStudentProfile.dart';
import 'View/register/StudentRegister.dart';
import 'View/register/StudentSuperVisorRegister.dart';
import 'View/register/SupervisorRegister.dart';



//Board
String boardTitle = '';
User user=new User();

Supervisor supervisor=new Supervisor();
Student student=new Student();
List<Project_Board> boards=List();
// ignore: non_constant_identifier_names
Project_Board project_board=new Project_Board();


StudentController studentController=new StudentController();
SupervisorController supervisorController=new SupervisorController();
UserController userController=new UserController();

// ignore: non_constant_identifier_names
Project_BoardController project_boardController=new Project_BoardController();

//ProjectBoardView
HomePage homePage=new HomePage();


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postgraduate Tracker',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        //'/': (context) => new LoginPage(),
        '/Login': (context) => new LoginPage(),
        '/Home': (context) => new HomePage(),
        //'/Home': (context) => new HomePage(email: student.email, userType: user.userTypeID),
        '/StudProfile': (BuildContext context) =>
//        new ViewStudentProfilePage(user: user,),
        new ViewStudentProfilePage(),
        '/SupProfile': (BuildContext context) => new ViewSupProfilePage(),
        '/RegisterChoice': (context) => new StudentSupChoicePage(),
        '/StudentRegister': (context) => new StudentRegisterPage(),
        '/SupervisorRegister': (context) => new SupervisorRegisterPage(),

        '/Board': (context) => new Board(proj_board: project_board),
        '/ResetPassword': (context) => new ResetPasswordView(),
      },
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}