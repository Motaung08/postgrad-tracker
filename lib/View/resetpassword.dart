import 'package:flutter/material.dart';
import 'package:postgrad_tracker/main.dart';

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String msg="";
  var emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController confirmPassCont = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  // ignore: non_constant_identifier_names
  String ConfirmPass = '';

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

  Future _tryReset() async{
    _formKey.currentState.validate();
    msg= await userController.ResetPassword(email, password);
    print('******************************************************   '+msg);
    if (msg=="Successfully updated password!"){
      msg="";
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {

    final studentEmailField = TextFormField(
      controller: emailController,
      obscureText: false,
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
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
          hintText: "New Password",
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

    // ignore: non_constant_identifier_names
    final ResetButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff009999),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _tryReset();

        },
        child: Text("Reset",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final error= new Text(
      msg,
      style: TextStyle(color: Colors.red, fontSize: 18.0),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Reset Password"),
          backgroundColor: Color(0xff009999),
        ),
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
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    //width: MediaQuery.of(context).size.width / 2.8,
                                      child: studentEmailField
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    //width:
                                    //MediaQuery.of(context).size.width / 2.8,
                                      child: passwordField),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    //width:
                                    //MediaQuery.of(context).size.width / 2.8,
                                      child: confirmPasswordField
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  error,
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  ResetButon
                                ]
                            )
                        )
                    )
                )
            )
        )
    );
  }
}