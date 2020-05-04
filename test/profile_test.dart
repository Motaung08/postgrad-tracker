import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


class MyWidget extends StatelessWidget {
  final String title;
  final String message;

  const MyWidget({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}

void main(){
  group('All input feild and button widgets should be on screen', ()
  {
    testWidgets(
        'Students Profile - Name', (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: 'Name', message: 'StudentsName'));
      final titleFinder = find.text('Name');
      final messageFinder = find.text('StudentsName');

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });

    testWidgets(
        'Students Profile - StudentNo', (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: 'StudentNumber', message: '1431795'));
      final titleFinder = find.text('StudentNumber');
      final messageFinder = find.text('1431795');

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });

    testWidgets(
        'Students Profile - StudentEmail', (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: 'email', message: 'tshepang@gmail.com'));
      final titleFinder = find.text('email');
      final messageFinder = find.text('tshepang@gmail.com');

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });

    testWidgets(
        'Students Profile - Degree', (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: 'DegreeType', message: 'Degree'));
      final titleFinder = find.text('DegreeType');
      final messageFinder = find.text('Degree');

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });

    testWidgets(
        'Students Profile - DateOfRegistration', (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: 'DateOfRegistration', message: 'DOR'));
      final titleFinder = find.text('DateOfRegistration');
      final messageFinder = find.text('DOR');

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });



  });

}