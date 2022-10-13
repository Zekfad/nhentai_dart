import 'package:meta/meta.dart';

import '../book.dart';
import '../parsers.dart' as parsers;
import 'search_query.dart';
import 'search_sort.dart';


/// Search result.
@immutable
class Search {
  /// Creates a search result.
  const Search({
    required this.query,
    required this.sort,
    required this.page,
    required this.pages,
    required this.perPage,
    required this.books,
  });
  
  /// Query used for this search.
  final SearchQuery query;
  /// Sort used for this search.
  final SearchSort sort;
  /// Associated search page.
  final int page;
  /// Total pages available for current [query].
  final int pages;
  /// Number of maximum [books] per single search page.
  final int perPage;
  /// Books found for current [query], [sort] and [page] parameters.
  /// 
  /// [books] length can't exceed [perPage] size.
  final Iterable<Book> books;

  /// Returns string summary of this search.
  @override
  String toString() => 'Search "$query" (Sort: ${sort.toString() == '' ? 'recent' : sort}; $page/$pages; per page: $perPage)';

  /// Parses search from API [json] object.
  /// 
  /// Requires associated [query], [page] and [sort] parameters.
  /// 
  /// Returns `null` if [json] can't be parsed to [Search].
  static Search? tryParse(dynamic json, {
    required SearchQuery query,
    required int page,
    required SearchSort sort,
  }) {
    if (json == null)
      return null;
    try {
      return Search.parse(
        json,
        query: query,
        page: page,
        sort: sort,
      );
    } on FormatException { // Ignore bad JSON.
      return null;
    }
  }

  /// Parses search from API [json] object.
  /// 
  /// Requires associated [query], [page] and [sort] parameters.
  /// 
  /// Throws a [FormatException] if [json] can't be parsed to [Search].
  // ignore: sort_constructors_first
  factory Search.parse(dynamic json, {
    required SearchQuery query,
    required int page,
    required SearchSort sort,
  }) => Search(
    query  : query,
    sort   : sort,
    page   : page,
    pages  : parsers.parse(json?['num_pages']),
    perPage: parsers.parse(json?['per_page']),
    books  : parsers.parseList(json?['result']),
  );
}
