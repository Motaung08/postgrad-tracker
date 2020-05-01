import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/ui/home/Home.dart';
import 'StdSupervReg_test.dart';


void main(){
  testWidgets('All input feild and button widgets should be on screen', (WidgetTester tester) async{
    await tester.pumpWidget(makeWidgetTestable(HomePage()));

  });
  

}