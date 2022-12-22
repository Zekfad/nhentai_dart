library book_test;

import 'package:nhentai/data_model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'book_title_test.dart' as book_title_test;
import 'search_test.dart' as search_test;
import 'book_images.dart' as book_images_test;


void run(Book? book, {
  required String json,
  required int id,
  required int media,
  required int tagCount,
}) {
  final _book = book ?? Mapper.fromJson<Book>(json);

  group('book parsing test', () {
    test('id', () {
      expect(_book.id, id);
    });
    test('media', () {
      expect(_book.media, media);
    });
    book_title_test.run(_book.title,
      json: '',
      english: search_test.titleEnglish,
      japanese: search_test.titleJapanese,
      pretty: search_test.titlePretty,
    );
    book_images_test.run(_book.images, 
      json: '', 
      pagesCount: search_test.pagesCount, 
      firstPageType: search_test.firstPageType, 
      firstPageWidth: search_test.firstPageWidth, 
      firstPageHeight: search_test.firstPageHeight, 
      firstPageFilename: search_test.firstPageFilename, 
      firstPageUrl: search_test.firstPageUrl, 
      firstPageThumbnailUrl: search_test.firstPageThumbnailUrl, 
      coverType: search_test.coverType, 
      coverWidth: search_test.coverWidth, 
      coverHeight: search_test.coverHeight, 
      coverFilename: search_test.coverFilename, 
      coverUrl: search_test.coverUrl, 
      thumbnailType: search_test.thumbnailType, 
      thumbnailWidth: search_test.thumbnailWidth, 
      thumbnailHeight: search_test.thumbnailHeight, 
      thumbnailFilename: search_test.thumbnailFilename, 
      thumbnailUrl: search_test.thumbnailUrl,
    );
    test('tagCount', () {
      expect(_book.tags.length, tagCount);
    });
  });
}

void main() => run(null,
  json: search_test.bookJson,
  id: search_test.bookId,
  media: search_test.mediaId,
  tagCount: search_test.tagCount,
);
