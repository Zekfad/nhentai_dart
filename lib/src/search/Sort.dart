/// Search sorting options.
class SearchSort {
  /// Create search sort.
  const SearchSort._(this._value) : super();

  /// String value of search parameter.
  final String _value;

  /// Get string value of search parameter.
  @override
  String toString() => _value;

  /// Sort by recent uploads.
  static const recent = SearchSort._('');
  /// Sort by popular uploads.
  static const popular = SearchSort._('popular');
  /// Sort by popular over the last month uploads.
  static const popularMonth = SearchSort._('popular-month');
  /// Sort by popular over the last week uploads.
  static const popularWeek = SearchSort._('popular-week');
  /// Sort by popular over the last day uploads.
  static const popularToday = SearchSort._('poplar-today');
}
