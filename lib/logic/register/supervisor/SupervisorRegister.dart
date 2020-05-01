import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:postgrad_tracker/ui/login/Login.dart';
import 'package:postgrad_tracker/auth.dart';

class SupervisorRegisterPage extends StatefulWidget {
  SupervisorRegisterPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  //final Function toggleView;
  //SupervisorRegisterPage({this.toggleView});
  final String title;

  @override
  _SupervisorRegisterPageState createState() => _SupervisorRegisterPageState();
}

class _SupervisorRegisterPageState extends State<SupervisorRegisterPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email='';
  String password='';
  // ignore: non_constant_identifier_names
  String Confirmpassword ='';
  String firstName='';
  String lastName='';
  // ignore: non_constant_identifier_names
  String StaffNo='';
  // ignore: non_constant_identifier_names
  String OfficeNo='';
  String error='';
  @override
  Widget build(BuildContext context) {
    final staffNumberField = TextFormField(
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter a Staff Number' : null,
      onChanged: (val){
        setState(() => StaffNo = val);
      },
      key: Key('staffNumberInput'),
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Staff Number",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final staffFirstNameField = TextFormField(
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter a First Name' : null,
      onChanged: (val){
        setState(() => firstName = val);
      },
      key: Key('staffFirstNameInput'),
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "First Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final staffLastNameField = TextFormField(
      obscureText: false,
      style: style,
      validator: (val) => val.isEmpty ? 'Enter a Last Name' : null,
      onChanged: (val){
        setState(() => lastName = val);
      },
      key: Key('staffLastNameInput'),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Last Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final staffEmailField = TextFormField(
      obscureText: false,
      style: style,
      validator: (val) => val.isEmpty ? 'Enter n email address.' : null,
      onChanged: (val){
        setState(() => email = val);
      },
      key: Key('staffEmailInput'),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final staffOfficeField = TextFormField(
      obscureText: false,
      style: style,
      key: Key("staffOfficeInput"),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Office",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
      validator: (val) => val.length<6 ? 'Enter a Password with 6+ chars.' : null,
      onChanged: (val){
        setState(() => password = val);
      },
      key: Key("passwordInput"),
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final confirmPasswordField = TextFormField(
      obscureText: true,
      style: style,
      validator: (val) => val.toString()==password ? 'Passwords must match.' : null,
      onChanged: (val){
        setState(() => Confirmpassword = val);
      },
      key: Key('confirmPasswordInput'),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final registerButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async{
//          if(_formKey.currentState.validate()){
//            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
//            if (result == null){
//                setState(() => error = ' Error: Invalid fields');
//            }
//          }
        },
        key: Key("registerButonInput"),
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

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
        key: Key('loginButonInput'),
        child: Text("Login",
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

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key:_formKey,
              child: SingleChildScrollView(
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
                            height: 15.0,
                          ),
                          SizedBox(
                              width: 150.0,
                              child: staffFirstNameField),
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                              width: 150.0,
                              child: staffLastNameField),
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                              width: 150.0,
                              child: staffEmailField
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                              width: 150.0,
                              child: staffOfficeField
                          ),
                        ]),
                        Column(children: <Widget>[
                          
                          SizedBox(
                            width: 15.0,
                          ),
                        ]),
                        Column(children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                              width: 150.0,
                              child: staffNumberField
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                              width: 150.0,
                              child: passwordField
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                              width: 150.0,
                              child: confirmPasswordField
                          ),

                        ]),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    registerButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    _divider(),
                    SizedBox(
                      height: 15.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(error,style: TextStyle(color: Colors.red, fontSize: 14),)


                  ],
                ),
              )
            )

          ),
        ),
      ),
    );
  }
}
