// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'search_result.dart';

class SearchResultMapper extends ClassMapperBase<SearchResult> {
  SearchResultMapper._();

  static SearchResultMapper? _instance;
  static SearchResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SearchResultMapper._());
      BookMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SearchResult';

  static int _$pages(SearchResult v) => v.pages;
  static const Field<SearchResult, int> _f$pages =
      Field('pages', _$pages, key: 'num_pages');
  static int _$perPage(SearchResult v) => v.perPage;
  static const Field<SearchResult, int> _f$perPage =
      Field('perPage', _$perPage, key: 'per_page');
  static List<Book> _$books(SearchResult v) => v.books;
  static const Field<SearchResult, List<Book>> _f$books =
      Field('books', _$books, key: 'result');

  @override
  final Map<Symbol, Field<SearchResult, dynamic>> fields = const {
    #pages: _f$pages,
    #perPage: _f$perPage,
    #books: _f$books,
  };

  static SearchResult _instantiate(DecodingData data) {
    return SearchResult(
        pages: data.dec(_f$pages),
        perPage: data.dec(_f$perPage),
        books: data.dec(_f$books));
  }

  @override
  final Function instantiate = _instantiate;

  static SearchResult fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SearchResult>(map));
  }

  static SearchResult fromJson(String json) {
    return _guard((c) => c.fromJson<SearchResult>(json));
  }
}

mixin SearchResultMappable {
  String toJson() {
    return SearchResultMapper._guard((c) => c.toJson(this as SearchResult));
  }

  Map<String, dynamic> toMap() {
    return SearchResultMapper._guard((c) => c.toMap(this as SearchResult));
  }

  @override
  String toString() {
    return SearchResultMapper._guard((c) => c.asString(this));
  }
}
