import 'package:meta/meta.dart';

import 'parsers.dart' as parsers;


/// Book title.
@immutable
class BookTitle {
  /// Creates a book title.
  const BookTitle({
    required this.english,
    required this.japanese,
    required this.pretty,
  }) : super();

  /// English title.
  final String? english;
  /// Japanese title.
  final String? japanese;
  /// "Pretty" title - short and without special prefixes/postfixes.
  final String pretty;

  /// Returns [pretty] tittle.
  @override
  String toString() => pretty;

  /// Parses book title from API [json] object.
  ///
  /// Returns `null` if [json] can't be parsed to [BookTitle].
  static BookTitle? tryParse(dynamic json) {
    if (json == null)
      return null;
    try {
      return BookTitle.parse(json);
    } on FormatException { // Ignore bad JSON.
      return null;
    }
  }

  /// Parses book title from API [json] object.
  /// 
  /// Throws a [FormatException] if [json] can't be parsed to [BookTitle].
  // ignore: sort_constructors_first
  factory BookTitle.parse(dynamic json) =>
    BookTitle(
      english : parsers.tryParse<String>(json?['english']),
      japanese: parsers.tryParse<String>(json?['japanese']),
      pretty  : parsers.parse(json?['pretty']),
    );
}
