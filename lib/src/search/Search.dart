import '../DataModel.dart';
import '../utils.dart' show parseAsTyped, parseList;
import 'Query.dart';

class Search {
  const Search({
    required this.query,
    required this.sort,
    required this.page,
    required this.pages,
    required this.perPage,
    required this.books,
  }) : super();
  
  final SearchQuery query;
  final SearchSort sort;
  final int page;
  final int pages;
  final int perPage;
  final Iterable<Book> books;

  @override
  String toString() => 'Search "$query" (Sort: ${sort.toString() == '' ? 'recent' : sort}; $page/$pages; per page: $perPage)';

  static Search? parse(dynamic json, {
    required SearchQuery query,
    required int page,
    SearchSort sort = SearchSort.recent,
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
