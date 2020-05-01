import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/logic/register/supervisor/SupervisorRegister.dart';


void main(){
  testWidgets('All input feild and button widgets should be on screen', (WidgetTester tester) async{
    await tester.pumpWidget(makeWidgetTestable(SupervisorRegisterPage()));

    //Test for staffNumberField
    final staffNumberField = find.byKey(Key('staffNumberInput'));
    expect(staffNumberField, findsOneWidget);

    // Test staffFirstNameField
    final staffFirstNameField = find.byKey(Key('staffFirstNameInput'));
    expect(staffFirstNameField, findsOneWidget);

    // Test staffLastNameField
    final staffLastNameField = find.byKey(Key('staffLastNameInput'));
    expect(staffLastNameField, findsOneWidget);

    // Test staffEmailField
    final staffEmailField = find.byKey(Key('staffEmailInput'));
    expect(staffEmailField, findsOneWidget);

    // Test staffOfficeField
    final staffOfficeField = find.byKey(Key('staffOfficeInput'));
    expect(staffOfficeField, findsOneWidget);

    // Test passwordField
    final passwordField = find.byKey(Key('passwordInput'));
    expect(passwordField, findsOneWidget);

    // Test confirmPasswordField
    final confirmPasswordField = find.byKey(Key('confirmPasswordInput'));
    expect(confirmPasswordField, findsOneWidget);

    //Test registerButon
    final registerButon = find.byKey(Key("registerButonInput"));
    expect(registerButon, findsOneWidget);

    // Test loginButon
    final loginButon = find.byKey(Key("loginButonInput"));
    expect(loginButon, findsOneWidget);
  });
}
Widget makeWidgetTestable(Widget widget){
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle,child: widget),
  );
}