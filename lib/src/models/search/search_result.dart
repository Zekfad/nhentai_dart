import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../book.dart';


/// Search result.
@immutable
@MappableClass()
class SearchResult {
  /// Creates a search result.
  const SearchResult({
    required this.pages,
    required this.perPage,
    required this.books,
  });
  
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
