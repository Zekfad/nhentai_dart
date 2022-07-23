// ignore_for_file: unused_import
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:nhentai/nhentai.dart';
import 'package:test/test.dart';

MockClient integrationTestMockClient = MockClient((request) async {
  switch (request.url.toString()) {
    case 'https://staging.company.com/api/customer/123':
      return Response('{"customer": "123", "name": "Jane Jimmy"}', 200);
    case 'https://staging.company.com/api/customer/155':
      return Response('{"customer": "155", "name": "Gregor"}', 200);
    default:
      return Response('{"customer": "155", "name": "Gregor"}', 200);
  }
});

void main() {
  // No tests yet.

  // group('Test API client', () {
  //   final api = API();

  //   test('Test get book', () {
  //     api.getBook(1);
  //   });
  // });
}
