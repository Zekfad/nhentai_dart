import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import 'book_images_hook.dart';
import 'images/images.dart';
import 'mapper_container_extension.dart';

part 'book_images.mapper.dart';


/// Book's images.
@MappableClass(
  hook: BookImagesHook(),
)
@immutable
class BookImages with BookImagesMappable {
  /// Book's images.
  const BookImages({
    required this.media,
    required this.cover,
    required this.thumbnail,
    required this.pages,
  });

  /// Parses [BookImages] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [BookImages] object.
  /// * [BookImages] - then value will be returned as-is.
  static BookImages Function(dynamic value) get parse =>
    MapperContainer.globals.initialized.fromValue<BookImages>;

  /// Parses [List] of [BookImages] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [BookImages] - then value will be returned as-is.
  static List<BookImages> Function(dynamic value) get parseList =>
    MapperContainer.globals.initialized.fromValue<List<BookImages>>;

  /// Parses JSON string into [BookImages] similarly to [parse]. 
  static BookImages Function(String json) get parseJson =>
    MapperContainer.globals.initialized.fromJson<BookImages>;

  /// Parses JSON string into [List] of [BookImages] instances similarly to 
  /// [parseList].
  static List<BookImages> Function(String json) get parseJsonList =>
    MapperContainer.globals.initialized.fromJson<List<BookImages>>;

  /// Image associated media id.
  @MappableField(key: 'media_id')
  final int media;

  /// Book cover.
  @MappableField(key: 'cover')
  final Cover cover;

  /// Book thumbnail.
  @MappableField(key: 'thumbnail')
  final CoverThumbnail thumbnail;

  /// Book pages.
  @MappableField(key: 'pages')
  final List<Image> pages;
}
