// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'search_result.dart';

class SearchResultMapper extends MapperBase<SearchResult> {
  static MapperContainer container = MapperContainer(
    mappers: {SearchResultMapper()},
  )..linkAll({BookMapper.container});

  @override
  SearchResultMapperElement createElement(MapperContainer container) {
    return SearchResultMapperElement._(this, container);
  }

  @override
  String get id => 'SearchResult';

  static final fromMap = container.fromMap<SearchResult>;
  static final fromJson = container.fromJson<SearchResult>;
}

class SearchResultMapperElement extends MapperElementBase<SearchResult> {
  SearchResultMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  SearchResult decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  SearchResult fromMap(Map<String, dynamic> map) => SearchResult(
      pages: container.$get(map, 'num_pages'),
      perPage: container.$get(map, 'per_page'),
      books: container.$get(map, 'result'));

  @override
  Function get encoder => encode;
  dynamic encode(SearchResult v) => toMap(v);
  Map<String, dynamic> toMap(SearchResult s) => {
        'num_pages': container.$enc(s.pages, 'pages'),
        'per_page': container.$enc(s.perPage, 'perPage'),
        'result': container.$enc(s.books, 'books')
      };

  @override
  String stringify(SearchResult self) =>
      'SearchResult(pages: ${container.asString(self.pages)}, perPage: ${container.asString(self.perPage)}, books: ${container.asString(self.books)})';
}

mixin SearchResultMappable {
  String toJson() => SearchResultMapper.container.toJson(this as SearchResult);
  Map<String, dynamic> toMap() =>
      SearchResultMapper.container.toMap(this as SearchResult);
  @override
  String toString() => SearchResultMapper.container.asString(this);
}
