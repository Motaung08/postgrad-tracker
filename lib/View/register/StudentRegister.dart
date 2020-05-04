import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/Model/DegreeType.dart';

import 'package:postgrad_tracker/Model/PostGradType.dart';
import 'package:postgrad_tracker/Model/Student.dart';
import 'package:postgrad_tracker/Model/StudentType.dart';

import 'package:postgrad_tracker/Model/User.dart';
import 'package:postgrad_tracker/View/Login.dart';
import 'package:postgrad_tracker/main.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class StudentRegisterPage extends StatefulWidget {

   Future initialize() async{
    print('initializing student types and degrees.');
    await studentTypeController.getTypes();
    await degreeController.getDegrees();
    print('Student type '+studentTypes.length.toString());
  }

  @override
  _StudentRegisterPageState createState() => _StudentRegisterPageState();
}





class _StudentRegisterPageState extends State<StudentRegisterPage> {
   Future initializeRegister () async {
    await widget.initialize();
    print("Student types: "+studentTypes.length.toString());


    print("Degrees: "+degrees.length.toString());

    //widget.initialize();
    _dropdownMenuItems = buildDropdownMenuItems(degrees);
    _selectedDegree = degrees[0];
     //print('Degrees size: '+degrees.length.toString());

    _dropdownStudTypeMenuItems = buildDropdownStudentTypeMenuItems(_studenttype);
    _selectedStudType = _dropdownStudTypeMenuItems[0].value;
    setState(() {

    });

  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  List<DegreeType> _degree = degrees;
  List<DropdownMenuItem<DegreeType>> _dropdownMenuItems;
  DegreeType _selectedDegree;

  List<StudentType> _studenttype = studentTypes;
  List<DropdownMenuItem<StudentType>> _dropdownStudTypeMenuItems;
  StudentType _selectedStudType;


  @override
  void initState() {
//    //widget.initialize();
    initializeRegister();
//   // _dropdownMenuItems = buildDropdownMenuItems(degrees);
//    //_selectedDegree = degrees[0];
//    // print('Degrees size: '+degrees.length.toString());
//
//   // _dropdownStudTypeMenuItems = buildDropdownStudentTypeMenuItems(_studenttype);
//    //_selectedStudType = _dropdownStudTypeMenuItems[0].value;
//
//    super.initState();
  }

  List<DropdownMenuItem<DegreeType>> buildDropdownMenuItems(List companies)  {
    List<DropdownMenuItem<DegreeType>> items = List();
    for (DegreeType degree in companies) {
      items.add(
        DropdownMenuItem(
          value: degree,
          child: Text(degree.Degree_Type, style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat', fontSize: 20.0),),

        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(DegreeType selectedDegree) {
    setState(() {
      _selectedDegree = selectedDegree;
    });
  }


  List<DropdownMenuItem<StudentType>> buildDropdownStudentTypeMenuItems(List types) {
    List<DropdownMenuItem<StudentType>> items = List();
    for (StudentType type in types) {
      items.add(
        DropdownMenuItem(
          value: type,
          child: Text(type.Student_Type, style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat', fontSize: 20.0),overflow: TextOverflow.ellipsis,),

        ),
      );
    }
    return items;
  }

  onChangeStudTypeDropdownItem(StudentType selectedType) {
    setState(() {
      _selectedStudType = selectedType;
    });
  }


  final _formKey = GlobalKey<FormState>();
  String error = '';

  bool SuccessUser = false;
  bool SuccessStudent = false;
  bool passwordMatch = false;

  TextEditingController confirmPassCont = new TextEditingController();
  TextEditingController StudentTypeCont = new TextEditingController();

  //text field state
  String email = '';
  String password = '';
  // ignore: non_constant_identifier_names
  String ConfirmPass = '';
  String firstName = '';
  String lastName = '';
  // ignore: non_constant_identifier_names
  String StudentNo = '';
  // ignore: non_constant_identifier_names
  String Degree = '';
  String studentType='';
  // ignore: non_constant_identifier_names
  String DateReg = '';

  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

// Getting value from TextField widget.
  final studentTypeTextController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final StudentNoController = TextEditingController();
  final Student_FNameController = TextEditingController();
  final Student_LNameController = TextEditingController();
  final DegreeTypeController = TextEditingController();
  final RegistrationDateController = TextEditingController();

  Future studentRegistration() async {

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    User userA=new User();
    userA.register=false;
    Student studentA=new Student();
    studentA.register=false;
    // Getting value from Controller

    userA.email = emailController.text;
    studentA.email=userA.email;
    userA.password = passwordController.text;
    userA.userTypeID = 1;
    studentA.studentNo = StudentNoController.text;
    studentA.fName = Student_FNameController.text;
    studentA.lName = Student_LNameController.text;
    //studentA.degreeID = int.parse(DegreeTypeController.text);

    //studentA.degreeID=1;

    studentA.degreeID=_selectedDegree.DegreeID;

    studentA.registrationDate = DateTime.parse(RegistrationDateController.text);
    //studentA.studentTypeID=int.parse(studentTypeController.text);
    userA.userTypeID=1;

   // studentA.studentTypeID=1;

    studentA.studentTypeID=_selectedStudType.StudentTypeID;

    var registered = await studentController.studentRegistration(studentA, userA);
    String message="";
    //Empty string indicates no errors -> success
    if (registered==""){
      message="Successfuly registered.";
    }
    else{
      message=registered;
    }
    print('...............Student registration:      '+message+'      ...............');


    if (student.register==true){
      setState(() {
        visible=false;
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
                //Navigator.of(context).pop();
                if (student.register==true){
                  Navigator.pushNamed(context, '/Home');
                }
                else{
                  setState(() {
                    visible=false;
                  });
                  Navigator.of(context).pop();
                }

              },
            ),
          ],
        );
      },
    );
  }

  bool _isHidden=true;

  void toggleVisibility(){
    setState(() {
      _isHidden=!_isHidden;
    });
  }

  bool _isHiddenConf=true;

  void toggleVisibilityConf(){
    setState(() {
      _isHiddenConf=!_isHiddenConf;
    });
  }


  @override
  Widget build(BuildContext context) {
    //widget.initialize();
    //initializeRegister();

    final studentNumberField = TextFormField(
      controller: StudentNoController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter a Student Number' : null,
      onChanged: (val) {
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
      onChanged: (val) {
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
      onChanged: (val) {
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
      validator: (val){
        if (val.isEmpty) {
          return 'Please enter an email address!.';
        }
        if (val.contains("@students.wits.ac.za")==false){
          return 'Invalid student email address';
        }
        return null;
      },
      onChanged: (val) {
        setState(() => email = val);
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final dropdownDegree =     new Container(
      padding: EdgeInsets.symmetric(horizontal: 20) ,

      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),

      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            DropdownButton(
              value: _selectedDegree,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItem,
              isExpanded: true,

              //style: style,


              //style: style,
            ),

            //Text('Selected: ${_selectedDegree.DegreeType}'),
          ],
        ),
      ),
    );

    final dropdownStudType = new Container(
      padding: EdgeInsets.symmetric(horizontal: 20) ,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),

      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            DropdownButton(
              value: _selectedStudType,
              items: _dropdownStudTypeMenuItems,
              onChanged: onChangeStudTypeDropdownItem,
              isExpanded: true,


              //style: style,


              //style: style,
            ),

            //Text('Selected: ${_selectedDegree.DegreeType}'),
          ],
        ),
      ),
    );

    final studentDegreeField = TextFormField(
      controller: DegreeTypeController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter a Degree' : null,
      onChanged: (val) {
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
      controller: studentTypeTextController,
      validator: (val) => val.isEmpty ? 'Enter Student Type' : null,
      onChanged: (val) {
        setState(() => studentType = val);
      },
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
      onChanged: (val) {
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
      obscureText: _isHidden,

      validator: (val) =>
          val.length < 6 ? 'Enter a password 6+ chars long' : null,
      onChanged: (val) {
        setState(() => password = val);
      },
      style: style,
      decoration: InputDecoration(
        suffixIcon: IconButton(icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility), onPressed: toggleVisibility),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final confirmPasswordField = TextFormField(
      controller: confirmPassCont,

      validator: (val) {

        if (val.isEmpty) {
          return 'Confirm password.';
        }
        if (val !=passwordController.text){
          return 'Passwords must match';
        }
        return null;
      },
      obscureText: _isHiddenConf,
      onChanged: (val) {
        setState(() => ConfirmPass = val);
      },
      style: style,
      decoration: InputDecoration(
          suffixIcon: IconButton(icon: _isHiddenConf ? Icon(Icons.visibility_off) : Icon(Icons.visibility), onPressed: toggleVisibilityConf),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );


    //final RegisterUser
    final registerButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {

          if (_formKey.currentState.validate()){
            studentRegistration();
          }

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
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.contain,
                          ),

                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(children: <Widget>[
                                SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 2.8,
                                    child: studentFirstNameField),
                                SizedBox(
                                  height: 15.0,
                                ),
                                SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 2.8,
                                    child: studentLastNameField),
                                SizedBox(
                                  height: 15.0,
                                ),
                                SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 2.8,
                                    child: studentEmailField),
                                SizedBox(
                                  height: 15.0,
                                ),
                                SizedBox(
                                   width:
                                    MediaQuery.of(context).size.width / 2.8,
                                    child: dropdownDegree
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 2.8,
                                    child: dropdownStudType
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),

                              ]),
                              Column(children: <Widget>[
                                SizedBox(
                                  width: 15.0,
                                ),
                              ]),
                              Column(children: <Widget>[
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    child: studentDateRegisteredField),
                                SizedBox(
                                  height: 15.0,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    child: studentNumberField),
                                SizedBox(
                                  height: 15.0,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    child: passwordField),
                                SizedBox(
                                  height: 15.0,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    child: confirmPasswordField),
                              ]),
                            ],
                          ),


                          registerButon,

                          Visibility(
                              visible: visible,
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: CircularProgressIndicator())),
                          _divider(),
                          loginButon
                        ],
                      )))),
        ),
      ),
    );
  }
}

