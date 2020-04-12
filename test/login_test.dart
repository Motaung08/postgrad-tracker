import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/Login.dart';
import 'package:http/http.dart' as http;



Widget makeWidgetTestable(Widget widget){
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle,child: widget),
  );
}


void main(){

  testWidgets('All input feild and button widgets should be on screen', (WidgetTester tester) async{
    await tester.pumpWidget(makeWidgetTestable(LoginPage()));

    final emailField = find.byKey(Key('emailInput'));

    expect(emailField, findsOneWidget);

    final passwordField = find.byKey(Key('passwordInput'));
    expect(passwordField, findsOneWidget);

    final RegisterButon = find.byKey(Key('RegisterButonInput'));
    expect(RegisterButon, findsOneWidget);

    final loginButon = find.byKey(Key('loginButonInput'));
    expect(loginButon, findsOneWidget);

    Finder hintText = find.byKey(new Key("Password"));
    expect(hintText.toString().contains(''), true);

  });
}

