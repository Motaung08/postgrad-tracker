import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postgrad_tracker/Board.dart';
import 'package:postgrad_tracker/Login.dart';
import 'package:postgrad_tracker/StudentRegister.dart';
import 'package:postgrad_tracker/StudentSuperVisorRegister.dart';
import 'package:postgrad_tracker/SupervisorRegister.dart';
import 'package:postgrad_tracker/ViewSupProfile.dart';
import 'package:postgrad_tracker/main.dart';
import 'package:flutter_test/flutter_test.dart';



Widget makeWidgetTestable(Widget widget){
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle,child: widget),
  );
}

void main(){
  testWidgets('All pages should be accessed!!!', (
      WidgetTester tester) async {
    await tester.pumpWidget(makeWidgetTestable(MyApp()));
    await tester.pumpWidget(makeWidgetTestable(LoginPage()));
    await tester.pumpWidget(makeWidgetTestable(StudentSupChoicePage()));
    await tester.pumpWidget(makeWidgetTestable(StudentRegisterPage()));
    await tester.pumpWidget(makeWidgetTestable(SupervisorRegisterPage()));
    await tester.pumpWidget(makeWidgetTestable(Board()));
//    await tester.pumpWidget(makeWidgetTestable(ViewSupProfilePage()));
  });
}