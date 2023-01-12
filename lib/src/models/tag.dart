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

  static final fromMap = TagMapper.fromMap;
  static final fromJson = TagMapper.fromJson;

  /// Creates a "dummy" tag.
  /// 
  /// Such tag can be used with search, for example if you know
  /// tag [id] beforehand.
  const Tag.dummy(this.id, [this.name = 'dummy']) :
    type = TagType.unknown,
    count = 0,
    url = '';

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
