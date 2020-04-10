import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postgrad_tracker/StudentRegister.dart';


Widget makeWidgetTestable(Widget widget){
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle, child: widget)
  );
}

void main(){
  testWidgets('all input field  and button widgets should be on screen',  (WidgetTester tester) async {
    await tester.pumpWidget(makeWidgetTestable(StudentRegisterPage()));

    final emailField = find.byKey(Key("email"));
    expect(emailField, findsOneWidget);

    final passwordField = find.byKey(Key("password"));
    expect(passwordField, findsOneWidget);

    final confirmPasswordField = find.byKey(Key("confirmPassword"));
    expect(confirmPasswordField, findsOneWidget);

    final studentFirstNameField = find.byKey(Key("studentFirstName"));
    expect(studentFirstNameField, findsOneWidget);

    final studentLastNameField = find.byKey(Key("studentLastName"));
    expect(studentLastNameField, findsOneWidget);

    final studentDegreeField = find.byKey(Key("studentDegree"));
    expect(studentDegreeField, findsOneWidget);

    final studentTypeField = find.byKey(Key("studentType"));
    expect(studentTypeField, findsOneWidget);

//    final studentDateRegisteredField = find.byKey(Key("studentDateRegisteredField "));
//    expect(studentDateRegisteredField , findsOneWidget);

//    final registerButon = find.byKey(Key("registerButon"));
//    expect(registerButon, findsOneWidget);

  });

}