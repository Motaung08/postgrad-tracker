import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:postgrad_tracker/Controller/StudentController.dart';
import 'package:postgrad_tracker/View/register/StudentRegister.dart';

import 'Models_test.dart';

class Post {
  dynamic data;
  Post.fromJson(this.data);
}

class MockClient extends Mock implements http.Client {}

Future<Post> fetchPost(http.Client client) async {
  final response =
  await client.get('https://witsinnovativeskyline.000webhostapp.com/viewStudentProfile.php');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}


void main() {
  group('Server connection', () {
    test(
        'returns a Post if the StudentController http call completes successfully', () async {
      final client = MockClient();

      when(client.get(
          'https://witsinnovativeskyline.000webhostapp.com/viewStudentProfile.php'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));
    });

    test(
        'returns a Post if the StudentController http call completes successfully', () async {
      final client = MockClient();

      when(client.get(
          'https://witsinnovativeskyline.000webhostapp.com/viewStudentProfile.php'))
          .thenAnswer((_) async =>
          http.Response('{"title: ProjectBoard"}', 200));
    });

    test(
        'returns a Post if the Board http call completes successfully', () async {
      final client = MockClient();

      when(client.get(
          'https://witsinnovativeskyline.000webhostapp.com/viewStudentProfile.php'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchPost(client), throwsException);
    });

    testWidgets('All input feild and button widgets should be on screen', (
        WidgetTester tester) async {
      await tester.pumpWidget(makeWidgetTestable(StudentController()));
    });

//    testWidgets('All input feild and button widgets should be on screen', (
//        WidgetTester tester) async {
//      await tester.pumpWidget(makeWidgetTestable(StudentRegisterPage()));
//    });

  });

}
