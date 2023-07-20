// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'book_title.dart';

class BookTitleMapper extends ClassMapperBase<BookTitle> {
  BookTitleMapper._();

  static BookTitleMapper? _instance;
  static BookTitleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BookTitleMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'BookTitle';

  static String? _$english(BookTitle v) => v.english;
  static const Field<BookTitle, String> _f$english =
      Field('english', _$english);
  static String? _$japanese(BookTitle v) => v.japanese;
  static const Field<BookTitle, String> _f$japanese =
      Field('japanese', _$japanese);
  static String _$pretty(BookTitle v) => v.pretty;
  static const Field<BookTitle, String> _f$pretty = Field('pretty', _$pretty);

  @override
  final Map<Symbol, Field<BookTitle, dynamic>> fields = const {
    #english: _f$english,
    #japanese: _f$japanese,
    #pretty: _f$pretty,
  };

  static BookTitle _instantiate(DecodingData data) {
    return BookTitle(
        english: data.dec(_f$english),
        japanese: data.dec(_f$japanese),
        pretty: data.dec(_f$pretty));
  }

  @override
  final Function instantiate = _instantiate;

  static BookTitle fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<BookTitle>(map));
  }

  static BookTitle fromJson(String json) {
    return _guard((c) => c.fromJson<BookTitle>(json));
  }
}

mixin BookTitleMappable {
  String toJson() {
    return BookTitleMapper._guard((c) => c.toJson(this as BookTitle));
  }

  Map<String, dynamic> toMap() {
    return BookTitleMapper._guard((c) => c.toMap(this as BookTitle));
  }

  @override
  String toString() {
    return BookTitleMapper._guard((c) => c.asString(this));
  }
}
