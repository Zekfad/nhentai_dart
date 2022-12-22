import 'package:meta/meta.dart';

import '../tag.dart';
import 'search_query.dart';


/// Search query with tag.
@immutable
class SearchQueryTag implements SearchQuery {
  /// Creates a tag query.
  const SearchQueryTag(this.tag);

  /// Underlying search tag.
  final Tag tag;

  @override
  String toString() => '${tag.type.name}:"$tag"';
}
