import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../book.dart';
import '../mapper_base_container_extension.dart';

part 'search_result.mapper.dart';


/// Search result.
@immutable
@MappableClass()
class SearchResult with SearchResultMappable {
  /// Creates a search result.
  const SearchResult({
    required this.pages,
    required this.perPage,
    required this.books,
  });
  
  /// Parses [SearchResult] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [SearchResult] object.
  /// * [SearchResult] - then value will be returned as-is.
  static SearchResult Function(dynamic value) get parse =>
    SearchResultMapper.ensureInitialized().container.fromValue<SearchResult>;

  /// Parses [List] of [SearchResult] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [SearchResult] - then value will be returned as-is.
  static List<SearchResult> Function(dynamic value) get parseList =>
    SearchResultMapper.ensureInitialized().container.fromValue<List<SearchResult>>;

  /// Parses JSON string into [SearchResult] similarly to [parse]. 
  static SearchResult Function(String json) get parseJson =>
    SearchResultMapper.ensureInitialized().container.fromJson<SearchResult>;

  /// Parses JSON string into [List] of [SearchResult] instances similarly to 
  /// [parseList].
  static List<SearchResult> Function(String json) get parseJsonList =>
    SearchResultMapper.ensureInitialized().container.fromJson<List<SearchResult>>;

  /// Total pages available.
  @MappableField(key: 'num_pages')
  final int pages;

  /// Number of maximum [books] per single search page.
  @MappableField(key: 'per_page')
  final int perPage;

  /// [books] length can't exceed [perPage] size.
  @MappableField(key: 'result')
  final List<Book> books;
}
