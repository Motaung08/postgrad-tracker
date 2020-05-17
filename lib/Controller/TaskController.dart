import 'dart:convert';
import 'package:postgrad_tracker/Model/ListCard.dart';
import 'package:postgrad_tracker/Model/Project_Board.dart';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/Task.dart';
import 'package:postgrad_tracker/View/Board.dart';
import 'package:postgrad_tracker/main.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class TaskController extends StatefulWidget {

  // ignore: non_constant_identifier_names
  Future<List> ReadTasks(int ListID) async{
    List<Task> tasks=new List();
      bool created = false;
      String msg = '';

        // SERVER API URL
        var url =
            //'http://146.141.21.17/ReadBoards.php';
            'https://witsinnovativeskyline.000webhostapp.com/ReadTasks.php';

        var data={
          'ListID' : ListID.toString(),
        };

        // Starting Web API Call.
        var response = await http.post(url, body: data);

        // Getting Server response into variable.
        // ignore: non_constant_identifier_names
        var Response = jsonDecode(response.body);
        print(Response);


        if (Response.length == 0) {

          msg = "No Tasks created yet.";
          print(msg);
        }
        else {
         // print('mmmmmmmmmmmmmmmmmmmmmm lists!');
          tasks=[];

          //Come back and add other task details

          for (int i = 0; i < Response.length; i++) {
            Task taskReceived = new Task();
            taskReceived.TaskID = int.parse(Response[i]['TaskID']);
            taskReceived.Task_Title = Response[i]['Task_Title'];

            taskReceived.Task_StatusID = int.parse(Response[i]['Task_StatusID']);
            //taskReceived.Task_Due = DateTime.parse(Response[i]['Task_Date_Due']);
            taskReceived.Task_Description = Response[i]['Task_Description'];
            //taskReceived.Task_DateAdded = DateTime.parse(Response[i]['Task_Date_added']);
            taskReceived.Task_AddedBy = Response[i]['Task_AddedBy'];
            taskReceived.ListID = int.parse(Response[i]['ListID']);

            tasks.add(taskReceived);
            print("Added: "+taskReceived.Task_Title);
          }

        }
    return tasks;
  }

  Future createTask(Task aTask) async{
    bool created = false;


      // SERVER API URL
      var url =
//          'http://146.141.21.17/createBoard.php';
          'https://witsinnovativeskyline.000webhostapp.com/createTask.php';
      //print('================= '+title);
      // Store all data with Param Name.
      var data = {
        'TaskID': aTask.TaskID,
        'Task_Title': aTask.Task_Title,
        'ListID':aTask.ListID,
        'Task_AddedBy':aTask.Task_AddedBy,
        'Task_DateAdded':aTask.Task_DateAdded,
        'Task_DateAdded':aTask.Task_Description,
        'Task_Due':aTask.Task_Due,
        'Task_StatusID':aTask.Task_StatusID,
      };

      // Starting Web API Call.
      var response = await http.post(url, body: json.encode(data));

      // Getting Server response into variable.
      var message = jsonDecode(response.body);

      print(message);



  }

  Future updateTask(Task aTask) async{
    var url =

        'https://witsinnovativeskyline.000webhostapp.com/updateTask.php';


    // Store all data with Param Name.
    var data = {
      'TaskID': aTask.TaskID,
      'Task_Title': aTask.Task_Title,
      'ListID':aTask.ListID,
      'Task_AddedBy':aTask.Task_AddedBy,
      'Task_DateAdded':aTask.Task_DateAdded,
      'Task_DateAdded':aTask.Task_Description,
      'Task_Due':aTask.Task_Due,
      'Task_StatusID':aTask.Task_StatusID,
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    print(message);
  }


  @override
  _TaskControllerControllerState createState() => _TaskControllerControllerState();

}

// ignore: camel_case_types
class _TaskControllerControllerState extends State<TaskController> {


  @override
  Widget build(BuildContext context) {
//setState(() {
//
//});
    return Container();
  }
}
