import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postgrad_tracker/View/resetpassword.dart';
import 'package:postgrad_tracker/View/register/StudentSuperVisorRegister.dart';
import 'package:postgrad_tracker/View/register/SupervisorRegister.dart';
import 'package:postgrad_tracker/View/register/StudentRegister.dart';
import 'package:postgrad_tracker/main.dart';
import 'package:flutter_test/flutter_test.dart';



Widget makeWidgetTestable(Widget widget){
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle,child: widget),
  );
}

void main(){
  group("All main tests", ()
  {
    testWidgets('All pages should be accessed!!!', (WidgetTester tester) async {
      await tester.pumpWidget(makeWidgetTestable(StudentSupChoicePage()));

//    await tester.pumpWidget(makeWidgetTestable(LoginPage()));

//    await tester.pumpWidget(makeWidgetTestable(StudentRegisterPage()));
//    await tester.pumpWidget(makeWidgetTestable(SupervisorRegisterPage()));
//    await tester.pumpWidget(makeWidgetTestable(Board()));
//    await tester.pumpWidget(makeWidgetTestable(ViewSupProfilePage()));
    });
    testWidgets('All pages should be accessed!!!', (WidgetTester tester) async {
      await tester.pumpWidget(makeWidgetTestable(MyApp()));
    });

    testWidgets('All pages should be accessed!!!', (WidgetTester tester) async {
      await tester.pumpWidget(makeWidgetTestable(SupervisorRegisterPage()));
    });

    testWidgets('All pages should be accessed!!!', (WidgetTester tester) async {
      await tester.pumpWidget(makeWidgetTestable(ResetPasswordView()));
    });

//    testWidgets('All pages should be accessed!!!', (WidgetTester tester) async {
//      await tester.pumpWidget(makeWidgetTestable(StudentRegisterPage()));
//      await tester.pump();
//    });
  });

}