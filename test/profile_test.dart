import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/View/profile/student/ViewStudentProfile.dart';


Widget makeWidgetTestable(Widget widget){
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle,child: widget),
  );
}


void main(){

  testWidgets('All pages should be accessed!!!', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: childWidget));
  });



}