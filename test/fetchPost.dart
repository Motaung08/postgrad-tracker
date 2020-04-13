import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class Post {
  dynamic data;
  Post.fromJson(this.data);
}


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

class MockClient extends Mock implements http.Client {}

main(){
  group('fetchPost', () {
//    test('returns a Post if the http call completes successfully', () async {
//      final client = MockClient();
//
//      // Use Mockito to return a successful response when it calls the
//      // provided http.Client.
//      when(client.get('https://witsinnovativeskyline.000webhostapp.com/login.php'))
//          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));
//
//      // ignore: deprecated_member_use
//      expect(await fetchPost(client), const TypeMatcher<Post>());
//    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('https://witsinnovativeskyline.000webhostapp.com/login.php'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchPost(client), throwsException);
    });
  });
}