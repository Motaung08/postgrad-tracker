import 'dart:convert';
import 'package:postgrad_tracker/Model/Project_Board.dart';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/Student.dart';
import 'package:postgrad_tracker/main.dart';
import 'package:http/http.dart' as http;
import 'package:postgrad_tracker/View/Home.dart';

class Project_BoardController extends StatefulWidget {

  Future ReadBoards() async{
      bool created = false;
      String msg = '';

      if (user.userTypeID==1){
        supervisor.staffNo="";
      }else{
        student.studentNo="";
      }



        // SERVER API URL
        var url =
            'https://witsinnovativeskyline.000webhostapp.com/ReadBoards.php';

        var data={
          'UserTypeID' : user.userTypeID.toString(),
          'StudentNo' : student.studentNo,
          'StaffNo' : supervisor.staffNo
        };

        // Starting Web API Call.
        var response = await http.post(url, body: data);

        // Getting Server response into variable.
        var Response = jsonDecode(response.body);
        print(Response);


        if (Response.length == 0) {

          msg = "No boards created yet. Click the + button to create a board.";
          print(msg);
        }
        else {
          for (int i = 0; i < Response.length; i++) {
            Project_Board boardReceived = new Project_Board();
            boardReceived.ProjectID = int.parse(Response[i]['ProjectID']);
            boardReceived.Project_Title = Response[i]['Project_Title'];
            boardReceived.Project_Description = Response[i]['Project_Description'];
            //boardReceived.Project_StartDate=DateTime.parse(Response[i]['Project_StartDate']);
            //boardReceived.Project_EndDate=DateTime.parse(Response[i]['Project_EndDate']);

            boards.add(boardReceived);
          }


          /*At this point all the previously created boards have been read in from
          the model and so the UI should then be populated. The UI for viewing
          is the home page.
        */

          homePage.initializeDisplay();
        }






  }

  Future createBoard(String title) async{
    bool created = false;


    if(user.userTypeID==1){
      supervisor.staffNo="";
    }
    else{
      student.studentNo="";
    }

      // SERVER API URL
      var url =
          'https://witsinnovativeskyline.000webhostapp.com/createBoard.php';

      // Store all data with Param Name.
      var data = {
        'Project_Title': project_board.Project_Title,
        'StudentNo' : student.studentNo,
        'StaffNo' : supervisor.staffNo,
        'userType' : user.userTypeID.toString()
      };

      // Starting Web API Call.
      var response = await http.post(url, body: json.encode(data));

      // Getting Server response into variable.
      var message = jsonDecode(response.body);

      print(message);



  }


  @override
  _Project_BoardControllerState createState() => _Project_BoardControllerState();

}

class _Project_BoardControllerState extends State<Project_BoardController> {


  @override
  Widget build(BuildContext context) {
//setState(() {
//
//});
    return Container();
  }
}
