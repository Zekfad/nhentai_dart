import 'Exceptions.dart';
import 'utils.dart' show parseAsTyped;


/// Tag types.
enum TagType {
  unknown,
  /// Ordinary tag.
  tag,
  /// Category tag.
  category,
  /// Artist tag.
  artist,
  /// Parody tag.
  parody,
  /// Character tag.
  character,
  /// Group tag.
  group,
  /// Language tag.
  language,
}

/// Get [TagType] by [tagType] name.
TagType _getTagType(String tagType) {
  final type = TagType.values.firstWhere(
    (element) => element.name == tagType,
    orElse: () => TagType.unknown,
  );
  assert(
    type != TagType.unknown,
    'Unknown tag type found while parsing JSON. '
    'If that\'s not an error open new issue for adding support for "$tagType" type.',
  );
  return type;
}

/// Tag.
class Tag {
  /// Create tag.
  const Tag({
    required this.id,
    required this.type,
    required this.name,
    required this.count,
    required this.url,
  }) : super();

  /// Create dummy tag.
  /// This can be used with search, if you know tag [id] beforehand.
  Tag.dummy(this.id, [this.name = 'dummy']) :
    type = TagType.unknown,
    count = 0,
    url = Uri(),
    super();

  /// Tag ID.
  final int id;
  /// Tag type.
  final TagType type;
  /// Tag name.
  final String name;
  /// Count of tagged books.
  final int count;
  /// Tag url.
  final Uri url;

  /// Get tag summary (name and tagged books count).
  String get summary => '$name ($count)';

  /// Get tag type as string.
  String get typeName => type.name;

  /// Tag [name].
  @override
  String toString() => name;

  /// Compare tags.
  /// Tags are considered equal when they have the same [id], [type] and [name].
  @override
  bool operator ==(Object other) => (other is Tag)
    && id == other.id
    && type == other.type
    && name == other.name;

  @override
  int get hashCode => Object.hash(id, type, name);

  /// Parse tag from API [json] object.
  static Tag? parse(dynamic json) {
    if (json == null)
      return null;
    APIException.throwIfError(json);
    return Tag(
      id   : parseAsTyped(json?['id']),
      type : _getTagType(parseAsTyped(json?['type'])),
      name : parseAsTyped(json?['name']),
      count: parseAsTyped(json?['count']),
      url  : parseAsTyped(json?['url']),
    );
  }
}
