import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Board.dart';
import 'package:postgrad_tracker/Controller/Project_BoardController.dart';
import 'package:postgrad_tracker/Controller/StudentController.dart';
import 'package:postgrad_tracker/Model/Project_Board.dart';
import 'package:postgrad_tracker/Model/Student.dart';
import 'package:postgrad_tracker/Model/Supervisor.dart';
import 'package:postgrad_tracker/Model/User.dart';
import 'package:postgrad_tracker/ViewSupProfile.dart';
import 'package:provider/provider.dart';

import 'Login.dart';
import 'StudentSuperVisorRegister.dart';
import 'ViewStudentProfile.dart';
import 'Home.dart';

import 'StudentRegister.dart';
import 'SupervisorRegister.dart';
import 'Board.dart';

//Board
        String boardTitle = '';
        User user=new User();
        Supervisor supervisor=new Supervisor();
        Student student=new Student();
        List<Project_Board> boards=List();

        StudentController studentController=new StudentController();
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
        new ViewStudentProfilePage(user: user,),
        '/SupProfile': (BuildContext context) =>
        new ViewSupProfilePage(user: user,),
        '/RegisterChoice': (context) => new StudentSupChoicePage(),
                '/StudentRegister': (context) => new StudentRegisterPage(),
                '/SupervisorRegister': (context) => new SupervisorRegisterPage(),

                '/Board': (context) => new Board(title: boardTitle),
      },
        home: LoginPage(),
                theme: ThemeData(
                primarySwatch: Colors.blue,
      ),
    );
    }
}