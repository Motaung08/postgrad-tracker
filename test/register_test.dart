import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:postgrad_tracker/View/Login.dart';
import 'package:postgrad_tracker/View/register/StudentSuperVisorRegister.dart';
import 'package:postgrad_tracker/View/register/SupervisorRegister.dart';

import 'fetchPost.dart';


class Post {
  dynamic data;
  Post.fromJson(this.data);
}

class MockClient extends Mock implements http.Client {}

Future<Post> fetchPost(http.Client client) async {
  final response =
  await client.get('https://witsinnovativeskyline.000webhostapp.com/register_user.php');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Widget makeWidgetTestable(Widget widget){
  return MaterialApp(
    home: DefaultAssetBundle(bundle: rootBundle,child: widget),
  );
}

main() {
  group('Server connection', () {
    test(
        'returns a Post if the Login http call completes successfully', () async {
      final client = MockClient();

      when(client.get(
          'https://witsinnovativeskyline.000webhostapp.com/register_user.php'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));
    });

    test(
        'returns a Post if the Register http call completes successfully', () async {
      final client = MockClient();

      when(client.get(
          'https://witsinnovativeskyline.000webhostapp.com/register_user.php'))
          .thenAnswer((_) async =>
          http.Response('{"title: RegisterChoice"}', 200));
    });

    test(
        'returns a Post if the Register http call completes successfully', () async {
      final client = MockClient();

      when(client.get(
          'https://witsinnovativeskyline.000webhostapp.com/register_user.php'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchPost(client), throwsException);
    });

    testWidgets('All input feild and button widgets should be on screen', (
        WidgetTester tester) async {
      await tester.pumpWidget(makeWidgetTestable(LoginPage()));

    });
//    testWidgets('All input feild and button widgets should be on screen', (
//        WidgetTester tester) async {
//      await tester.pumpWidget(makeWidgetTestable(StudentRegisterPage()));
//
//    });


    testWidgets('All input feild and button widgets should be on screen', (
        WidgetTester tester) async {
      await tester.pumpWidget(makeWidgetTestable(StudentSupChoicePage()));

    });

    testWidgets('All input feild and button widgets should be on screen', (
        WidgetTester tester) async {
      await tester.pumpWidget(makeWidgetTestable(SupervisorRegisterPage()));

    });




  });



}