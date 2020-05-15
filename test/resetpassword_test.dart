import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/View/Login.dart';
import 'package:postgrad_tracker/View/resetpassword.dart';
import 'package:flutter/services.dart' show rootBundle;


Widget makeWidgetTestable(Widget widget){
  return MaterialApp(
      home:DefaultAssetBundle(bundle: rootBundle, child: widget)
  );
}

void main() {
 group('all input field  and button widgets should be on screen', ()
 {
   testWidgets('all input field  and button widgets should be on screen', (
       WidgetTester tester) async {
     await tester.pumpWidget(makeWidgetTestable(ResetPasswordView()));

     //password input field
     final passwordField = find.byKey(Key("PasswordInput"));
     expect(passwordField, findsOneWidget);

     //confirm password
     // ignore: non_constant_identifier_names
     final ConfirmPasswordField = find.byKey(Key("confirmPasswordInput"));
     expect(ConfirmPasswordField, findsOneWidget);

     // ignore: non_constant_identifier_names
     final StudentEmailField = find.byKey(Key('StudentEmailInput'));
     expect(StudentEmailField, findsOneWidget);

     // ignore: non_constant_identifier_names
     final ResetButon = find.byKey(Key("ResetButtonInput"));
     expect(ResetButon, findsOneWidget);
   });

   testWidgets('entering text on input fields', (WidgetTester tester) async {
     await tester.pumpWidget(makeWidgetTestable(LoginPage()));

     final forgotPassButton = find.byKey(Key("ForgotPasswordInput"));
     expect(forgotPassButton, findsOneWidget);
   });

 });

}