import '../DataModel.dart';
import '../parseUtils.dart' show parseAsTyped, parseList;
import 'Query.dart';

/// Search.
class Search {
  /// Create search.
  const Search({
    required this.query,
    required this.sort,
    required this.page,
    required this.pages,
    required this.perPage,
    required this.books,
  }) : super();
  
  /// Query used for this search.
  final SearchQuery query;
  /// Sort used for this search.
  final SearchSort sort;
  /// Page, this search associated with.
  final int page;
  /// Total pages available for current [query].
  final int pages;
  /// Number of maximum [books] per single search [page].
  final int perPage;
  /// Books found for current [query], [sort] and [page] parameters.
  /// Count of elements count not be grater than [perPage].
  final Iterable<Book> books;

  /// Get string summary of this search.
  @override
  String toString() => 'Search "$query" (Sort: ${sort.toString() == '' ? 'recent' : sort}; $page/$pages; per page: $perPage)';

  /// Parse search from API [json] object.
  /// You also need to provide associated [query], [page] and [sort] options.
  static Search? parse(dynamic json, {
    required SearchQuery query,
    required int page,
    required SearchSort sort,
  }) {
    if (json == null)
      return null;
    APIException.throwIfError(json);
    return Search(
      query  : query,
      sort   : sort,
      page   : page,
      pages  : parseAsTyped(json?['num_pages']),
      perPage: parseAsTyped(json?['per_page']),
      books  : parseList(json?['result']),
    );
  }
}
