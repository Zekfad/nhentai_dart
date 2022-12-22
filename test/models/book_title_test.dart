import 'package:nhentai/data_model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'search_test.dart' as search_test;


void run(BookTitle? title, {
  required String json,
  required String english,
  required String japanese,
  required String pretty,
}) {
  final _title = title ?? Mapper.fromJson<BookTitle>(json);

  group('bookTitle parsing test', () {
    test('english', () {
      expect(_title.english, search_test.titleEnglish);
    });
    test('japanese', () {
      expect(_title.japanese, search_test.titleJapanese);
    });
    test('pretty', () {
      expect(_title.pretty, search_test.titlePretty);
    });
  });
}

void main() => run(null,
  json: search_test.bookTitleJson,
  english: search_test.titleEnglish, 
  japanese: search_test.titleJapanese, 
  pretty: search_test.titlePretty,
);
