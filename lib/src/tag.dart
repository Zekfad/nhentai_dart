import 'package:meta/meta.dart';

import 'parsers.dart' as parsers;
import 'tag_type.dart';


/// Tag.
@immutable
class Tag {
  /// Creates a tag.
  const Tag({
    required this.id,
    required this.type,
    required this.name,
    required this.count,
    required this.url,
  });

  /// Creates a "dummy" tag.
  /// 
  /// Such tag can be used with search, for example if you know
  /// tag [id] beforehand.
  Tag.dummy(this.id, [this.name = 'dummy']) :
    type = TagType.unknown,
    count = 0,
    url = Uri();

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

  /// Tag summary (name and tagged books count).
  String get summary => '$name ($count)';

  /// Tag type as a string.
  String get typeName => type.name;

  /// Returns tag [name].
  @override
  String toString() => name;

  /// Compares tags.
  /// 
  /// Tags are considered equal when they have the same [id], [type] and [name].
  @override
  bool operator ==(Object other) => (other is Tag)
    && id == other.id
    && type == other.type
    && name == other.name;

  @override
  int get hashCode => Object.hash(id, type, name);

  /// Parses tag from API [json] object.
  /// 
  /// Returns `null` if data can't be parsed to [Tag].
  static Tag? tryParse(dynamic json) {
    if (json == null)
      return null;
    try {
      return Tag.parse(json);
    } on FormatException { // Ignore bad JSON.
      return null;
    }
  }

  /// Parses tag from API [json] object.
  /// 
  /// Throws a [FormatException] if data can't be parsed to [Tag].
  // ignore: sort_constructors_first
  factory Tag.parse(dynamic json) {
    final type = TagType.getByName(parsers.parse(json?['type']));
    assert(
      type != TagType.unknown,
      '[TagType.getByName] Unknown tag type found while parsing JSON. '
      'If that\'s not an error open new issue for adding support for "${json?['type']}" type.',
    );
    return Tag(
      id   : parsers.parse(json?['id']),
      type : TagType.getByName(parsers.parse(json?['type'])),
      name : parsers.parse(json?['name']),
      count: parsers.parse(json?['count']),
      url  : parsers.parse(json?['url']),
    );
  }
}
