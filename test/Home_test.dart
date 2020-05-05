import 'package:flutter_test/flutter_test.dart';
import 'package:postgrad_tracker/View/Home.dart';
import 'Models_test.dart';



void main(){
  testWidgets('All input feild and button widgets should be on screen', (WidgetTester tester) async{
    await tester.pumpWidget(makeWidgetTestable(HomePage()));

  });
  

}