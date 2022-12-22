/// Search sorting options.
enum SearchSort {
  /// Sort by recent uploads.
  recent(),
  /// Sort by popular uploads.
  popular('popular'),
  /// Sort by popular over the last month uploads.
  popularMonth('popular-month'),
  /// Sort by popular over the last week uploads.
  popularWeek('popular-week'),
  /// Sort by popular over the last day uploads.
  popularToday('poplar-today');

  /// Creates a search sort.
  const SearchSort([ this.value, ]);

  /// String value of search parameter.
  final String? value;

  /// Returns string value of search parameter.
  @override
  String toString() => value ?? '';
}
