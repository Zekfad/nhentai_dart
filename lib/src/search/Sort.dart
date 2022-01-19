class SearchSort {
  const SearchSort._(this.value) : super();

  final String value;

  @override
  String toString() => value;

  static const recent = SearchSort._('');
  static const popular = SearchSort._('popular');
  static const popularMonth = SearchSort._('popular-month');
  static const popularWeek = SearchSort._('popular-week');
  static const popularToday = SearchSort._('poplar-today');
}
