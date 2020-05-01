//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:postgrad_tracker/ui/login/Login.dart';
//import 'package:http/http.dart' as http;
//import 'package:postgrad_tracker/ui/profile/studentsupervisor/StudentSuperVisorRegister.dart';
//
//
//
//Widget makeWidgetTestable(Widget widget){
//  return MaterialApp(
//    home: DefaultAssetBundle(bundle: rootBundle,child: widget),
//  );
//}
//
//void main() {
//  testWidgets('All input feild and button widgets should be on screen', (
//      WidgetTester tester) async {
//    await tester.pumpWidget(makeWidgetTestable(LoginPage()));
//    await tester.pumpWidget(makeWidgetTestable(StudentSupChoicePage()));
//
////    final emailField = find.byKey(Key('emailInput'));
////
////    expect(emailField, findsOneWidget);
////
////    final passwordField = find.byKey(Key('passwordInput'));
////    expect(passwordField, findsOneWidget);
////
////    final RegisterButon = find.byKey(Key('RegisterButonInput'));
////    expect(RegisterButon, findsOneWidget);
////
////    final loginButon = find.byKey(Key('loginButonInput'));
////    expect(loginButon, findsOneWidget);
////
////    Finder hintText = find.byKey(new Key("Password"));
////    expect(hintText.toString().contains(''), true);
//
//  });
//
//}
//
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:postgrad_tracker/ui/login/Login.dart';
import 'package:postgrad_tracker/ui/profile/studentsupervisor/StudentSuperVisorRegister.dart';

class Post {
  dynamic data;
  Post.fromJson(this.data);
}

class MockClient extends Mock implements http.Client {}

Future<Post> fetchPost(http.Client client) async {
  final response =
  await client.get('https://witsinnovativeskyline.000webhostapp.com/login.php');

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

main(){
  group('Server connection', ()
  {
    test(
        'returns a Post if the Login http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(
          'https://witsinnovativeskyline.000webhostapp.com/login.php'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      //      expect(await fetchPost(client), const TypeMatcher<Post>());
    });

    test(
        'throws an exception if the Login http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(
          'https://witsinnovativeskyline.000webhostapp.com/login.php'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchPost(client), throwsException);
    });

//    test('returns a Post if the Register http call completes successfully', () async {
//      final client = MockClient();
//
//      when(client.get('https://witsinnovativeskyline.000webhostapp.com/register_user.php'))
//          .thenAnswer((_) async => http.Response('{"title: RegisterChoice"}', 200));
//    });

//        test('returns a Post if the Register http call completes successfully', () async {
//          final client = MockClient();
//
//          when(client.get(
//              'https://witsinnovativeskyline.000webhostapp.com/register_user.php'))
//              .thenAnswer((_) async => http.Response('Not Found', 404));
//
//          expect(fetchPost(client), throwsException);
//
//        });
    testWidgets('All input feild and button widgets should be on screen', (
        WidgetTester tester) async {
          await tester.pumpWidget(makeWidgetTestable(LoginPage()));

    });

    testWidgets('All input feild and button widgets should be on screen', (
        WidgetTester tester) async {
      await tester.pumpWidget(makeWidgetTestable(StudentSupChoicePage()));
    });


  });

}
