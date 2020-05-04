import 'package:flutter/material.dart';
import 'package:postgrad_tracker/main.dart';



class ViewSupProfilePage extends StatefulWidget {
//final User user;

  //const ViewSupProfilePage({Key key, this.user}) : super(key: key);
  @override
  _ViewSupProfilePageState createState() => _ViewSupProfilePageState();
}

String msg = '';

class _ViewSupProfilePageState extends State<ViewSupProfilePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


  @override
  Widget build(BuildContext context) {
    supervisorController.GetSupDetails();
    setState(() {

    });
    //final FullName = supervisor.fName + " " + supervisor.lName;

    final supervisorProfile = Container(
        child: Column(children: <Widget>[
          Text("Profile:  \n",
              //textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          Text("Name: " + supervisor.fName+" "+supervisor.lName + "\n",
              //textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text("Staff Number: " + supervisor.staffNo + "\n",
              //textAlign: TextAlign.start,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text("Email: " + supervisor.email + "\n",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text("Office Phone: " + supervisor.office + "\n",
              textAlign: TextAlign.start,
              style: style.copyWith(
                  color: Color(0xff009999),
                  fontWeight: FontWeight.bold,
                  fontSize: 18))
        ]));

    return Scaffold(
      body: Center(
          child: Row(children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[SizedBox(child: supervisorProfile)],
                ),
              ),
            ),
          ],
          )),
    );
  }
}