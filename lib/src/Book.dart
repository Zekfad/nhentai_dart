import 'DataModel.dart';
import 'TagsList.dart';
import 'utils.dart' show tryParseAsTyped, parseAsTyped, parseList, parseMap;


/// Book title.
class BookTitle {
  /// Create book tittle.
  const BookTitle({
    required this.english,
    required this.japanese,
    required this.pretty,
  }) : super();

  /// English title.
  final String? english;
  /// Japanese title.
  final String? japanese;
  /// "Pretty" title. Short and without special prefixes/postfixes.
  final String pretty;

  /// Get [pretty] tittle.
  @override
  String toString() => pretty;

  /// Parse book title from API [json] object.
  static BookTitle? parse(dynamic json) {
    if (json == null)
      return null;
    APIException.throwIfError(json);
    return BookTitle(
      english : tryParseAsTyped(json?['english']),
      japanese: tryParseAsTyped(json?['japanese']),
      pretty  : parseAsTyped(json?['pretty']),
    );
  }
}

/// Book.
class Book {
  /// Create book.
  Book({
    required this.title,
    required this.id,
    required this.media,
    required this.favorites,
    required this.scanlator,
    required this.uploaded,
    required this.tags,
  }) : super();

  /// Book title.
  final BookTitle title;
  /// Book ID.
  final int id;
  /// Book media gallery ID.
  final int media;
  /// Book favorites count.
  final int favorites;
  /// Book scanlator.
  final String? scanlator;
  /// Book upload date.
  final DateTime uploaded;
  /// Book cover.
  late final Image cover;
  /// Book thumbnail.
  late final Image thumbnail;
  /// Book pages.
  late final Iterable<Image> pages;
  /// Book tags list.
  final TagsList tags;

  /// Get book pretty title.
  @override
  String toString() => title.toString();

  /// Parse book from API [json] object.
  static Book? parse(dynamic json) {
    if (json == null)
      return null;
    final images = parseMap<String, dynamic>(json?['images']);
    final scanlator = parseAsTyped<String>(json?['scanlator']);
    final book = Book(
      title    : parseAsTyped(json?['title']),
      id       : parseAsTyped(json?['id']),
      media    : parseAsTyped(json?['media_id']),
      favorites: parseAsTyped(json?['num_favorites']),
      // pages    : parseAsTyped(json?['num_pages']),
      scanlator: scanlator.isEmpty == true
        ? null
        : scanlator,
      uploaded : DateTime.fromMillisecondsSinceEpoch(parseAsTyped<int>(json?['upload_date']) * 1000),
      tags     : TagsList(parseList(json?['tags'])),
    );
    final cover = Image.parse(
      images['cover'],
      id: 0,
      book: book,
      thumbnail: false,
    );
    if (cover == null)
      throw APIException.parseError;
    final thumbnail = Image.parse(
      images['thumbnail'],
      id: 0,
      book: book,
      thumbnail: true,
    );
    if (thumbnail == null)
      throw APIException.parseError;
    int i = 0;
    return book
      ..cover = cover
      ..thumbnail = thumbnail
      ..pages = List.unmodifiable(
        parseList<Image>(
          images['pages'],
          customItemParser: (dynamic json) => Image.parse(
            json,
            id: ++i,
            book: book,
          ),
        ),
      );
  }
}
