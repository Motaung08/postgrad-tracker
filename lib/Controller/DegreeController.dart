import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:postgrad_tracker/Model/DegreeType.dart';
import 'package:postgrad_tracker/main.dart';

class DegreeController extends StatefulWidget {

  Future getDegrees() async{

    //final response = await http.post("http://146.141.21.17/getDegreeTypes.php");
    final response = await http.post("https://witsinnovativeskyline.000webhostapp.com/getDegreeTypes.php");

    //print('Assigning title for '+student.studentTypeID.toString());

    var result = json.decode(response.body);

    for (int i=0; i<result.length;i++){
      DegreeType degree=new DegreeType();
      degree.DegreeID=int.parse(result[i]['DegreeID']);
      degree.Degree_Type=result[i]['Degree_Type'];
      degrees.add(degree);
      //print(degree.Degree_Type);
    }


  }

  @override
  _DegreeControllerState createState() => _DegreeControllerState();
}

class _DegreeControllerState extends State<DegreeController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
