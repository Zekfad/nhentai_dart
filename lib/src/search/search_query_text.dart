import 'package:meta/meta.dart';

import 'search_query.dart';


/// Search query with text.
@immutable
class SearchQueryText implements SearchQuery {
  /// Creates a text query.
  const SearchQueryText(this.value);

  /// Underlying search text.
  final String value;

  @override
  String toString() => value;
}
