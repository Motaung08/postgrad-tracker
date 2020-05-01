import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/main.dart';
import '../profile/studentsupervisor/StudentSuperVisorRegister.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

//  final Function toggleView;
//  LoginPage({ this.toggleView });

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();
  String msg='';
  //text field state

  TextEditingController _emailController =  new TextEditingController();
  TextEditingController _passwordController =  new TextEditingController();
  //

  Future<List> _login() async{

    final response = await http.post("https://witsinnovativeskyline.000webhostapp.com/login.php",body: {
      "Email": _emailController.text,
      "Password": _passwordController.text
    },);
   // print('ugh x2');
    var datauser= json.decode(response.body);
    //print(datauser.length);

    if(datauser.length==0){
      setState(() {
        msg="Incorrect email or password!";

      });
    }else{
      setState(() {
        Email=datauser[0]['Email'];
        userType=int.parse(datauser[0]['UserTypeId']);
      });
      Navigator.popAndPushNamed(context, '/Home');
    }
    //print(response.body);
    //print("*********************************************************************************");

    return datauser;

  }

  @override
  Widget build(BuildContext context) {

    final emailField = new TextFormField(
      controller: _emailController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Username cannot be blank.' : null,
      style: style,
      key: Key('emailInput'),
//      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
      controller: _passwordController,
      obscureText: true,
      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
      style: style,
      key: Key('passwordInput'),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          _login();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
        key: Key('loginButonInput'),
      ),
    );

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    final RegisterButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentSupChoicePage()),
          );
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
        key: Key('RegisterButonInput'),
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: Padding(

              padding: const EdgeInsets.all(36.0),
              child: Form(

                key: _formKey,

                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      SizedBox(
                        height: 15.0,
                      ),
                      emailField,
                      SizedBox(
                        height: 15.0,
                      ),
                      passwordField,
                      SizedBox(
                        height: 15.0,
                      ),
                      loginButon,
                      SizedBox(
                        height: 15.0,
                      ),
                      _divider(),
                      SizedBox (
                        height: 15.0,
                      ),
                      RegisterButton,
                      SizedBox (
                        height: 15.0,
                      ),
                      Text(
                        msg,
                        style: TextStyle(color: Colors.red, fontSize: 18.0),
                      ),

                    ],
                  ),
              ),
            ),
          ),
          )

      ),
    );
  }

}

