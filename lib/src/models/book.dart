import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../date_hook.dart';
import 'book_images.dart';
import 'book_title.dart';
import 'image.dart';
import 'tags_list.dart';

part 'book.mapper.dart';

class BookHook extends MappingHook {
  const BookHook();

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
      },
    };
  }
}

/// Book.
@immutable
@MappableClass(
  hook: BookHook(),
  includeCustomMappers: [
    TagsListMapper,
  ],
)
class Book with BookMappable {
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

  /// Parses [Book] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [Book] object.
  /// * [Book] - then value will be returned as-is.
  static Book Function(dynamic value) get parse =>
    BookMapper.container.fromValue<Book>;

  /// Parses [List] of [Book] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [Book] - then value will be returned as-is.
  static List<Book> Function(dynamic value) get parseList =>
    BookMapper.container.fromValue<List<Book>>;

  /// Parses JSON string into [Book] similarly to [parse]. 
  static Book Function(String json) get parseJson =>
    BookMapper.container.fromJson<Book>;

  /// Parses JSON string into [List] of [Book] instances similarly to 
  /// [parseList].
  static List<Book> Function(String json) get parseJsonList =>
    BookMapper.container.fromJson<List<Book>>;

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
  @MappableField(key: 'upload_date', hook: DateHook())
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
