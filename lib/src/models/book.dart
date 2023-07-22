import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import 'book_hook.dart';
import 'book_images.dart';
import 'book_title.dart';
import 'date_hook.dart';
import 'image.dart';
import 'mapper_container_extension.dart';
import 'tag.dart';

part 'book.mapper.dart';

/// Book.
@MappableClass(
  hook: BookHook(),
)
@immutable
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
    MapperContainer.globals.initialized.fromValue<Book>;

  /// Parses [List] of [Book] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [Book] - then value will be returned as-is.
  static List<Book> Function(dynamic value) get parseList =>
    MapperContainer.globals.initialized.fromValue<List<Book>>;

  /// Parses JSON string into [Book] similarly to [parse]. 
  static Book Function(String json) get parseJson =>
    MapperContainer.globals.initialized.fromJson<Book>;

  /// Parses JSON string into [List] of [Book] instances similarly to 
  /// [parseList].
  static List<Book> Function(String json) get parseJsonList =>
    MapperContainer.globals.initialized.fromJson<List<Book>>;

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
  final List<Tag> tags;

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
