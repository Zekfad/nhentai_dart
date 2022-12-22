import 'package:nhentai/data_model.dart';
import 'package:nhentai/nhentai.dart';
import 'package:nhentai/src/models/book_images.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'image_test.dart' as image_test;
import 'search_test.dart' as search_test;

void run(BookImages? images, {
  required String json,
  required int pagesCount,
  required ImageType firstPageType,
  required int firstPageWidth,
  required int firstPageHeight,
  required String firstPageFilename,
  required String firstPageUrl,
  required String firstPageThumbnailUrl,
  required ImageType coverType,
  required int coverWidth,
  required int coverHeight,
  required String coverFilename,
  required String coverUrl,
  required ImageType thumbnailType,
  required int thumbnailWidth,
  required int thumbnailHeight,
  required String thumbnailFilename,
  required String thumbnailUrl,
}) {
  final _images = images ?? Mapper.fromJson<BookImages>(json);

  group('bookImages parsing test', () {
    test('page count', () {
      expect(_images.pages.length, pagesCount);
    });
    group('first page', () {
      image_test.run(_images.pages.first, 
        json: '',
        type: firstPageType,
        width: firstPageWidth,
        height: firstPageHeight,
        filename: firstPageFilename,
        url: firstPageUrl,
      );
      test('thumbnail url', () {
        expect(
          _images.pages.first.thumbnail.getUrl(hosts: const Hosts()).toString(),
          firstPageThumbnailUrl,
        );
      });
    });
    group('cover', () {
      image_test.run(_images.cover, 
        json: '', 
        type: coverType, 
        filename: coverFilename, 
        url: coverUrl,
        width: coverWidth,
        height: coverHeight,
      );
    });
    group('thumbnail', () {
      image_test.run(_images.thumbnail, 
        json: '', 
        type: thumbnailType, 
        filename: thumbnailFilename, 
        url: thumbnailUrl,
        width: thumbnailWidth,
        height: thumbnailHeight,
      );
    });
  });
}

void main() => run(null, 
  json: search_test.imagesJson, 
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
