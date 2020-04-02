// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:postgrad_tracker/StudentRegister.dart';

// import '../lib/Login.dart';
// import '../lib/main.dart';
// import '../lib/user.dart';

// Widget makeWidgetTestable(Widget widget){
//   return MaterialApp(
//     home: DefaultAssetBundle(bundle: rootBundle, child: widget)
//   );
// }

// void main(){
//   testWidgets('all input field  and button widgets should be on screen',  (WidgetTester tester) async {
//     await tester.pumpWidget(makeWidgetTestable(LoginPage()));

//     final emailField = find.byKey(Key("emailField"));
//     expect(emailField, findsOneWidget);

//     final passwordField = find.byKey(Key("password"));
//     expect(passwordField, findsOneWidget);

//     final confirmPasswordField = find.byKey(Key("confirmPasswordField"));
//     expect(confirmPasswordField, findsOneWidget);

//     final studentFirstNameField = find.byKey(Key("studentFirstName"));
//     expect(studentFirstNameField, findsOneWidget);

//     final studentLastNameField = find.byKey(Key("studentLastNameField"));
//     expect(studentLastNameField, findsOneWidget);

//     final studentDegreeField = find.byKey(Key("studentDegree"));
//     expect(studentDegreeField, findsOneWidget);

//     final studentTypeField = find.byKey(Key("studentType"));
//     expect(studentTypeField, findsOneWidget);

//     final studentDateRegisteredField = find.byKey(Key("studentDateRegisteredField "));
//     expect(studentDateRegisteredField , findsOneWidget);

//     final registerButon = find.byKey(Key("registerButon"));
//     expect(registerButon, findsOneWidget);

//     final loginButon = find.byKey(Key("loginButon"));
//     expect(loginButon, findsOneWidget);


//   });

// }
