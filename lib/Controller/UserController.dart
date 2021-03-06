import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/User.dart';
import 'package:http/http.dart' as http;
import 'package:postgrad_tracker/main.dart';

// ignore: must_be_immutable
class UserController extends StatefulWidget {

  Future<String> userRegistration(User userA) async {
    user.register = false;

    // SERVER API URL
    var url =
        //'http://146.141.21.17/register_user.php';
        'https://witsinnovativeskyline.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {'email': userA.email, 'password': userA.password, 'userType': userA.userTypeID};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      user.register=true;
      user.email=userA.email;
      user.password=userA.password;
      user.userTypeID=userA.userTypeID;
    }
    return message;
  }

  Future<bool> login(String email, String Password) async {

    bool proceed=false;

    final response = await http.post(
        //"http://146.141.21.17/login.php",
        "https://witsinnovativeskyline.000webhostapp.com/login.php",
        body: {
          'Email': email,
          'Password': Password
        });
    //print('******************************************** Clicked');

    var datauser = json.decode(response.body);

    print(datauser);

    if (datauser.length == 0) {

      proceed=false;
        String msg = "Incorrect email or password!";
        print(msg);

    } else {
      //print('Setting......................');

        user.email = datauser[0]['Email'];
        user.userTypeID = int.parse(datauser[0]['UserTypeId']);


      if (user.userTypeID==1){

        await studentController.GetStudDetails();



        await studentTypeController.getTypes();

        await degreeController.getDegrees();

      }
      else{
        await supervisorController.GetSupDetails();

      }
      proceed=true;
      //Navigator.popAndPushNamed(context, '/Home');
    }

    return proceed;
  }

  String ResetString="";
  Future<String> ResetPassword(String email, String password) async{
    
    var data =
    {
      'Email': email,
      'Password': password
    };

    /*The script below should take in the email and check if there exists a user
    * associated with the given email address. */
    final response = await http.post(
        //"http://146.141.21.17/ResetPassword.php",
        "https://witsinnovativeskyline.000webhostapp.com/ResetPassword.php",
        body: json.encode(data) );

    var result = json.decode(response.body);
    //print('000000000000000000000000000000000    ');
    print(result);

    if (result=="No user found.") {

        ResetString = "No user found :(";
        print(ResetString);

    } else if (result=="Email Exists but password not reset.") {

        ResetString =
        "There was a problem updating the password, please try again.";

    }else{
      ResetString="Successfully updated password!";
    }

    return ResetString;

  }


  @override
  _UserControllerState createState() => _UserControllerState();
}

class _UserControllerState extends State<UserController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
