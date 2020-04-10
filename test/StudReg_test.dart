import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/StudentRegister.dart';
import 'package:flutter/material.dart';
import 'package:postgrad_tracker/main.dart';

void main(){

  testWidgets('All input feild and button widgets should be on screen',(WidgetTester tester) async{
    await tester.pumpWidget(makeWidgetTestable(StudentRegisterPage()));
    final studentEmailField = find.byKey(Key("emailInput"));
    expect(studentEmailField, findsOneWidget);
  });
}

Widget makeWidgetTestable(Widget widget) {
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle,child: widget)
  );
}