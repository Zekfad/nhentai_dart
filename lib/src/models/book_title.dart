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

  static final fromMap = BookTitleMapper.fromMap;
  static final fromJson = BookTitleMapper.fromJson;

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
