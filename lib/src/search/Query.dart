import '../DataModel.dart';


/// Search query abstraction.
abstract class SearchQuery {
  @override
  String toString();
}


/// Search query with text.
class SearchText implements SearchQuery {
  /// Create text query.
  const SearchText(this.value) : super();

  /// Underlying search text.
  final String value;

  @override
  String toString() => value;
}

/// Search query with tag.
class SearchTag implements SearchQuery {
  /// Create tag query.
  const SearchTag(this.tag) : super();

  /// Underlying search tag.
  final Tag tag;

  @override
  String toString() => '${tag.type.name}:"$tag"';
}
