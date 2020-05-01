import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/logic/register/student/StudentRegister.dart';
import 'package:flutter/material.dart';

void main(){

  testWidgets('All input feild and button widgets should be on screen',(WidgetTester tester) async{
    await tester.pumpWidget(makeWidgetTestable(StudentRegisterPage()));

    // test email field
    final studentEmailField = find.byKey(Key("emailInput"));
    expect(studentEmailField, findsOneWidget);

    // test students last name field
    final studentLastNameField = find.byKey(Key("studentLastNameInput"));
    expect(studentLastNameField, findsOneWidget);

    // test student first name field
    final studentFirstNameField = find.byKey(Key("studentFirstNameInput"));
    expect(studentFirstNameField, findsOneWidget);

    // test student password field
    final passwordField = find.byKey(Key('passwordInput'));
    expect(passwordField, findsOneWidget);

    // test student confirm password field
    final confirmPasswordField = find.byKey(Key('confirmPasswordInput'));
    expect(confirmPasswordField, findsOneWidget);

    // test student degree type field
    final studentDegreeField = find.byKey(Key('studentDegreeInput'));
    expect(studentDegreeField, findsOneWidget);

    // test student number field
    final studentNumberField = find.byKey(Key('studentNumberInput'));
    expect(studentNumberField, findsOneWidget);

    // test student registration date
    final studentDateRegisteredField = find.byKey(Key('studentDateRegisteredInput'));
    expect(studentDateRegisteredField, findsOneWidget);

    // test student type field
    final studentTypeField = find.byKey(Key('studentTypeInput'));
    expect(studentTypeField, findsOneWidget);

    // test register button
    final registerButon = find.byKey(Key('registerButtonInput'));
    expect(registerButon, findsOneWidget);

    // test login button
    final loginButon = find.byKey(Key('loginButtonInput'));
    expect(loginButon, findsOneWidget);

  });
}

Widget makeWidgetTestable(Widget widget) {
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle,child: widget)
  );
}