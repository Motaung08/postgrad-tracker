import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/StudentSuperVisorRegister.dart';

Widget makeWidgetTestable(Widget widget){
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle, child: widget),
  );
}

void main(){
  testWidgets('button widgets should be on screen', (WidgetTester tester) async {
    await tester.pumpWidget(makeWidgetTestable(StudentSupChoicePage()));

    // Supervisor button
    final supervisorButon = find.byKey(Key('supervisorButonInput'));
    expect(supervisorButon, findsOneWidget);

    // Student button
    final studentButon = find.byKey(Key('studentButonInput'));
    expect(studentButon , findsOneWidget);
  });
}