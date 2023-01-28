import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import 'tag_type.dart';

part 'tag.mapper.dart';


/// Tag.
@immutable
@MappableClass()
class Tag with TagMappable {
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
  const Tag.dummy(this.id, [this.name = 'dummy']) :
    type = TagType.unknown,
    count = 0,
    url = '';

  /// Parses [Tag] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [Tag] object.
  /// * [Tag] - then value will be returned as-is.
  static Tag Function(dynamic value) get parse =>
    TagMapper.container.fromValue<Tag>;

  /// Parses [List] of [Tag] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [Tag] - then value will be returned as-is.
  static List<Tag> Function(dynamic value) get parseList =>
    TagMapper.container.fromValue<List<Tag>>;

  /// Parses JSON string into [Tag] similarly to [parse]. 
  static Tag Function(String json) get parseJson =>
    TagMapper.container.fromJson<Tag>;

  /// Parses JSON string into [List] of [Tag] instances similarly to 
  /// [parseList].
  static List<Tag> Function(String json) get parseJsonList =>
    TagMapper.container.fromJson<List<Tag>>;

  /// Tag ID.
  @MappableField(key: 'id')
  final int id;
  
  /// Tag type.
  @MappableField(key: 'type')
  final TagType type;
  
  /// Tag name.
  @MappableField(key: 'name')
  final String name;
  
  /// Count of tagged books.
  @MappableField(key: 'count')
  final int count;
  
  /// Tag url.
  @MappableField(key: 'url')
  final String url;

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
}
