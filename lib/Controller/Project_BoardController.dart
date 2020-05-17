import 'dart:convert';
import 'package:postgrad_tracker/Model/Project_Board.dart';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/main.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Project_BoardController extends StatefulWidget {

  // ignore: non_constant_identifier_names
  Future<List> ReadBoards(int UserTypeID, String personNo) async{
    List<Project_Board> boards=List();
      bool created = false;
      String msg = '';

      if (user.userTypeID==1){
        supervisor.staffNo="";
      }else{
        student.studentNo="";
      }



        // SERVER API URL
        var url =
            //'http://146.141.21.17/ReadBoards.php';
            'https://witsinnovativeskyline.000webhostapp.com/ReadBoards.php';

        var data={
          'UserTypeID' : user.userTypeID.toString(),
          'StudentNo' : student.studentNo,
          'StaffNo' : supervisor.staffNo
        };

        // Starting Web API Call.
        var response = await http.post(url, body: data);

        // Getting Server response into variable.
        // ignore: non_constant_identifier_names
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

            //boardReceived.boardLists=await listController.ReadLists(boardReceived.ProjectID);

            boards.add(boardReceived);
          }



        }
    return boards;
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
//          'http://146.141.21.17/createBoard.php';
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

  Future updateBoard() async{
    var url =

        'https://witsinnovativeskyline.000webhostapp.com/updateBoard.php';


    // Store all data with Param Name.
    var data = {
      'BoardID': project_board.ProjectID,
      'Title' : project_board.Project_Title,
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

// ignore: camel_case_types
class _Project_BoardControllerState extends State<Project_BoardController> {


  @override
  Widget build(BuildContext context) {
//setState(() {
//
//});
    return Container();
  }
}
