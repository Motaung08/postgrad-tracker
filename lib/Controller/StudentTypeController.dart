import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:postgrad_tracker/Model/StudentType.dart';
import 'package:postgrad_tracker/main.dart';

class StudentTypeController extends StatefulWidget {

  Future getTypes() async{
    //print('I am called');
    final response = await http.post("https://witsinnovativeskyline.000webhostapp.com/getStudentTypes.php");

    //print('Assigning title for '+student.studentTypeID.toString());

    var result = json.decode(response.body);

    for (int i=0; i<result.length;i++){
      StudentType studentType = new StudentType();
      studentType.StudentTypeID=int.parse(result[i]['StudentTypeID']);
      studentType.Student_Type=result[i]['Student_Type'];
      studentTypes.add(studentType);
    }


  }

  @override
  _StudentTypeControllerState createState() => _StudentTypeControllerState();
}

class _StudentTypeControllerState extends State<StudentTypeController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
