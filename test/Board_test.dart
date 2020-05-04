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
void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MyWidget(title: 'Project_Board', message: 'proj_board'));

    // Create the Finders.
    final titleFinder = find.text('Project_Board');
    final messageFinder = find.text('proj_board');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);

  });
}