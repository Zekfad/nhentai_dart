import '../DataModel.dart';


abstract class SearchQuery {
  @override
  String toString();
}

class SearchText implements SearchQuery {
  const SearchText(this.value) : super();

  final String value;

  @override
  String toString() => value;
}

class SearchTag implements SearchQuery {
  const SearchTag(this.tag) : super();

  final Tag tag;

  @override
  String toString() => '${tag.type.name}:"$tag"';
}
