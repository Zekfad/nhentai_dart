import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../date_hook.dart';
import 'book_images.dart';
import 'book_title.dart';
import 'image.dart';
import 'tags_list.dart';


class BookHooks extends MappingHooks {
  const BookHooks();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is! Map<String, dynamic>)
      throw MapperException.unexpectedType(value.runtimeType, Book, 'Map<String, dynamic>');

    final _images = value['images'];
    if (_images is! Map<String, dynamic>)
      throw MapperException.unexpectedType(_images.runtimeType, BookImages, 'Map<String, dynamic>');

    return {
      ...value,
      'images': {
        ..._images,
        'media_id': value['media_id'],
      }
    };
  }
}

/// Book.
@immutable
@MappableClass(
  hooks: BookHooks(),
)
class Book {
  /// Creates a book.
  const Book({
    required this.title,
    required this.id,
    required this.media,
    required this.favorites,
    required this.scanlator,
    required this.uploaded,
    required this.tags,
    required this.images,
  });
  /// Book title.
  @MappableField(key: 'title')
  final BookTitle title;

  /// Book ID.
  @MappableField(key: 'id')
  final int id;
  
  /// Book media gallery ID.
  @MappableField(key: 'media_id')
  final int media;
  
  /// Book favorites count.
  @MappableField(key: 'num_favorites')
  final int favorites;
  
  /// Book scanlator.
  @MappableField(key: 'scanlator')
  final String? scanlator;
  
  /// Book upload date.
  @MappableField(key: 'upload_date', hooks: DateHooks())
  final DateTime uploaded;

  /// Book tags list.
  @MappableField(key: 'tags')
  final TagsList tags;

  /// Collection of images.
  @MappableField(key: 'images')
  final BookImages images;

  /// Book cover.
  Cover get cover => images.cover;
  /// Book thumbnail.
  CoverThumbnail get thumbnail => images.thumbnail;
  /// Book pages.
  List<Image> get pages => images.pages;

  /// Get book pretty title.
  @override
  String toString() => title.toString();
}
