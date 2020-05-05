import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/View/register/StudentSuperVisorRegister.dart';
import 'package:postgrad_tracker/main.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {


  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();
  String msg = '';

  //text field state

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _isHidden=true;

  void toggleVisibility(){
    setState(() {
      _isHidden=!_isHidden;
    });
  }
  //
  Future _tryLogin() async{

    msg= await userController.login(_emailController.text, _passwordController.text);

    if(msg==""){
      setState(() {

      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => homePage),
      );
    }

  }


  @override
  Widget build(BuildContext context) {

    final forgotPassButton = new Container(
      alignment: Alignment.bottomLeft,
      key: Key("ForgotPasswordInput"),
      child:
        FlatButton(

          onPressed: (){
            Navigator.pushNamed(context, '/ResetPassword');
          },
          textColor: Color(0xff009999),
          child: Text('Forgot Password?'),
        ),

    );


    final emailField = new TextFormField(
      controller: _emailController,
      obscureText: false,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter an email address.';
        }
        return null;
      },
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
      controller: _passwordController,

      obscureText: _isHidden,
      validator: (val) =>
          val.isEmpty ? 'Password cannot be empty.' : null,
      style: style,
      decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",

          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),) ,
      suffixIcon: IconButton(icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility) , onPressed: toggleVisibility, focusColor: Color(0xff009999),)
      ),

    );


    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if(_formKey.currentState.validate()){
            await _tryLogin();
            setState(() {

            });
          }
        },
        key: Key('LoginInput'),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }



    // ignore: non_constant_identifier_names
    final RegisterButon = Material(
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
        key: Key('RegisterBttnInput'),
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

                  SizedBox(
                    height: 15.0,
                  ),
                  emailField,
                  SizedBox(
                    height: 15.0,
                  ),
                  passwordField,
                  forgotPassButton,
//                  SizedBox(
//                    height: 15.0,
//                  ),
                  loginButon,
                  SizedBox(
                    height: 15.0,
                  ),
                  _divider(),
                  SizedBox(
                    height: 15.0,
                  ),
                  RegisterButon,
                  SizedBox(
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
      )),
    );
  }
}
