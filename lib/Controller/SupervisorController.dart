import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/Supervisor.dart';
import 'package:postgrad_tracker/Model/User.dart';
import 'package:http/http.dart' as http;
import 'package:postgrad_tracker/main.dart';

class SupervisorController extends StatefulWidget {

  Future<List> GetSupDetails() async {
    var msg="";
    final response = await http.post(
        "https://witsinnovativeskyline.000webhostapp.com/viewSupProfile.php",
        body: {
          "Email": user.email,
        });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      print("Nada");
      msg = " Error :( ";
    } else {

      supervisor.staffNo = datauser[0]['StaffNo'];
      supervisor.fName = datauser[0]['Supervisor_Firstname'];
      supervisor.lName = datauser[0]['Supervisor_Lastname'];
      supervisor.email=user.email;
      supervisor.office=datauser[0]['Supervisor_OfficePhone'];
      print("Assigning...");
      print(datauser);
    }


    return datauser;
  }

  Future<String> registration(Supervisor supervisorA, User userA) async {
    supervisor.register = false;
    String userRegistrationMessage="";
    String RegistrationSuccess="";
    userRegistrationMessage=await userController.userRegistration(userA);
    if (userRegistrationMessage=="Email Already Exists, Please Try Again With New Email Address..!"){
      RegistrationSuccess=userRegistrationMessage;
    }
    else{
      // SERVER API URL
      var url =
          'https://witsinnovativeskyline.000webhostapp.com/Register_Supervisor.php';

      // Store all data with Param Name.
      var data = {
        'email': supervisorA.email,
        'StaffNo': supervisorA.staffNo,
        'Sup_FName': supervisorA.fName,
        'Sup_LName': supervisorA.lName,
        'Supervisor_OfficePhone': supervisorA.office,
      };

      // Starting Web API Call.
      var response = await http.post(url, body: json.encode(data));

      // Getting Server response into variable.
      var message = jsonDecode(response.body);

      // If Web call Success than Hide the CircularProgressIndicator.
      if (response.statusCode == 200) {
        supervisor.register = true;
        RegistrationSuccess="Supervisor successfully registered!";
      }
    }

    return RegistrationSuccess;
  }

  @override
  _SupervisorControllerState createState() => _SupervisorControllerState();
}

class _SupervisorControllerState extends State<SupervisorController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}