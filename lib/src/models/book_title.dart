import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

part 'book_title.mapper.dart';


/// Book title.
@immutable
@MappableClass()
class BookTitle with BookTitleMappable {
  /// Creates a book title.
  const BookTitle({
    required this.english,
    required this.japanese,
    required this.pretty,
  });

  /// Parses [BookTitle] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [BookTitle] object.
  /// * [BookTitle] - then value will be returned as-is.
  static BookTitle Function(dynamic value) get parse =>
    BookTitleMapper.container.fromValue<BookTitle>;

  /// Parses [List] of [BookTitle] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [BookTitle] - then value will be returned as-is.
  static List<BookTitle> Function(dynamic value) get parseList =>
    BookTitleMapper.container.fromValue<List<BookTitle>>;

  /// Parses JSON string into [BookTitle] similarly to [parse]. 
  static BookTitle Function(String json) get parseJson =>
    BookTitleMapper.container.fromJson<BookTitle>;

  /// Parses JSON string into [List] of [BookTitle] instances similarly to 
  /// [parseList].
  static List<BookTitle> Function(String json) get parseJsonList =>
    BookTitleMapper.container.fromJson<List<BookTitle>>;

  /// English title.
  @MappableField(key: 'english')
  final String? english;

  /// Japanese title.
  @MappableField(key: 'japanese')
  final String? japanese;
  
  /// "Pretty" title - short and without special prefixes/postfixes.
  @MappableField(key: 'pretty')
  final String pretty;

  /// Returns [pretty] tittle.
  @override
  String toString() => pretty;
}
