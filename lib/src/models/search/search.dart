import 'search_query.dart';
import 'search_result.dart';
import 'search_sort.dart';


/// Search result.
class Search extends SearchResult {
  /// Creates a search result.
  Search(SearchResult result, {
    required this.query,
    required this.sort,
    required this.page,
  }) : super(
      pages: result.pages, 
      perPage: result.perPage, 
      books: result.books,
    );
  
  /// Query used for this search.
  final SearchQuery query;
  /// Sort used for this search.
  final SearchSort sort;
  /// Associated search page.
  final int page;

  /// Returns string summary of this search.
  @override
  String toString() => 'Search "$query" (Sort: ${sort.toString() == '' ? 'recent' : sort}; $page/$pages; per page: $perPage)';
}
