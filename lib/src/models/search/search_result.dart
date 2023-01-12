import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../book.dart';

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
  
  static final fromMap = SearchResultMapper.fromMap;
  static final fromJson = SearchResultMapper.fromJson;

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
