import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Home.dart';
import 'package:postgrad_tracker/auth.dart';
import 'package:postgrad_tracker/main.dart';
import 'Login.dart';
import 'package:http/http.dart' as http;

class StudentRegisterPage extends StatefulWidget {
//  StudentRegisterPage({Key key, this.title}) : super(key: key);
//  final String title;
  final Function toggleView;

  StudentRegisterPage({ this.toggleView });

  @override
    _StudentRegisterPageState createState() => _StudentRegisterPageState();
}

class _StudentRegisterPageState extends State<StudentRegisterPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  bool SuccessUser=false;
  bool SuccessStudent=false;
  bool passwordMatch=false;


  TextEditingController confirmPassCont = new TextEditingController();
  TextEditingController StudentTypeCont = new TextEditingController();


  //text field state
  String email='';
  String password='';
  String ConfirmPass='';
  String firstName='';
  String lastName='';
  String StudentNo='';
  String Degree='';
  String DateReg='';

  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

// Getting value from TextField widget.
  final userTypeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final StudentNoController = TextEditingController();
  final Student_FNameController = TextEditingController();
  final Student_LNameController = TextEditingController();
  final DegreeTypeController = TextEditingController();
  final RegistrationDateController = TextEditingController();

  Future userRegistration() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    //String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String userType=userTypeController.text;

    // SERVER API URL
    var url = 'https://witsinnovativeskyline.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {'email': email, 'password' : password, 'userType': userType};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        visible = false;
        SuccessUser=true;
      });
    }


    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                if (SuccessStudent && SuccessUser && passwordMatch){
                  Navigator.pushNamed(context, '/Home');
                }
                else{
                  print("Success Student " + SuccessStudent.toString());
                  print("Success Student " + SuccessUser.toString());
                  print("Success Student " + passwordMatch.toString());
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );

  }

  Future studentRegistration() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller

    String email = emailController.text;

    String StudentNo = StudentNoController.text;
    String Student_FName = Student_FNameController.text;
    String Student_LName = Student_LNameController.text;
    String DegreeType = DegreeTypeController.text;
    String RegistrationDate = RegistrationDateController.text;

    // SERVER API URL
    var url = 'https://witsinnovativeskyline.000webhostapp.com/register_student.php';

    // Store all data with Param Name.
    var data = {'email': email, 'StudentNo' : StudentNo,
      'Student_FName': Student_FName, 'Student_LName': Student_LName,
      'DegreeType': DegreeType, 'RegistrationDate': RegistrationDate};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        visible = false;
        SuccessStudent=true;
      });
    }


    // Showing Alert Dialog with Response JSON Message.
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: new Text(message),
//          actions: <Widget>[
//            FlatButton(
//              child: new Text("OK"),
//              onPressed: () {
//                //Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );

  }



  @override
  Widget build(BuildContext context) {


    final studentNumberField = TextFormField(
      controller: StudentNoController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter a Student Number' : null,
      onChanged: (val){
        setState(() => StudentNo = val);
      },
      style: style,
      decoration: InputDecoration(
          //contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

          hintText: "Student Number",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final studentFirstNameField = TextFormField(
      controller: Student_FNameController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter a first name' : null,
      onChanged: (val){
        setState(() => firstName = val);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

          hintText: "First Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final studentLastNameField = TextFormField(
      controller: Student_LNameController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter a last name' : null,
      onChanged: (val){
        setState(() => lastName = val);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Last Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final studentEmailField = TextFormField(
      controller: emailController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val){
        setState(() => email = val);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final studentDegreeField = TextFormField(
      controller: DegreeTypeController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter a Degree' : null,
      onChanged: (val){
        setState(() => Degree = val);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Degree",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final studentTypeField = TextFormField(
      controller: userTypeController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Full/Part time",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final studentDateRegisteredField = TextFormField(
      controller: RegistrationDateController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter Date Registered' : null,
      onChanged: (val){
        setState(() => DateReg = val);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Date Registered",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
      controller: passwordController,
      obscureText: true,
      validator: (val) => val.length<6 ? 'Enter a password 6+ chars long' : null,
      onChanged: (val){
        setState(() => password = val);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final confirmPasswordField = TextFormField(
      controller: confirmPassCont,
      //validator: (val) => val.toString()==password ? 'Passwords do not match.' : null,
      obscureText: true,
      onChanged: (val){
        setState(() => ConfirmPass = val);

      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    checkPasswordMatch(){
      if (passwordController.text==passwordController.text){
        passwordMatch=true;
      }
    }

    final registerButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          checkPasswordMatch();
          studentRegistration();
          userRegistration();


        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    Widget _divider() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            Text('or'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    }

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //widget.toggleView();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child:Form(
                child: SingleChildScrollView(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                            Image.asset(
                              "assets/logo.png",
                              fit: BoxFit.contain,
                            ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2.8 ,
                              child: studentFirstNameField
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width/2.8 ,
                                child: studentLastNameField
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width/2.8 ,
                                child: studentEmailField
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width/2.8 ,
                                child: studentDegreeField
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width/2.8 ,
                                child: studentTypeField
                            ),

                          ]),
                          Column(children: <Widget>[
                            SizedBox(
                              width: 15.0,
                            ),
                          ]),
                          Column(children: <Widget>[
                            SizedBox(
                                width: MediaQuery.of(context).size.width/2.8 ,
                                child: studentDateRegisteredField
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width/2.8 ,
                                child: studentNumberField
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width/2.8 ,
                                child: passwordField
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width/2.8 ,
                                child: confirmPasswordField
                            ),

                          ]),
                        ],
                      ),
                      registerButon,
                      Visibility(
                          visible: visible,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: CircularProgressIndicator()
                          )
                      ),
                      _divider(),
                      loginButon
                    ],
                  )
                )
            )
          ),
        ),
      ),
    );
  }
}

