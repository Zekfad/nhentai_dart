import 'package:dart_mappable/dart_mappable.dart';

part 'tag_type.mapper.dart';

/// Tag type.
@MappableEnum(
  defaultValue: TagType.unknown,
)
enum TagType {
  /// Unknown tag type.
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
  language;

  /// Parses [TagType] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [String] - then object will be parsed into [TagType] object.
  /// * [TagType] - then value will be returned as-is.
  static TagType Function(dynamic value) get parse =>
    TagTypeMapper.container.fromValue<TagType>;

  /// Parses [List] of [TagType] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [TagType] - then value will be returned as-is.
  static List<TagType> Function(dynamic value) get parseList =>
    TagTypeMapper.container.fromValue<List<TagType>>;

  /// Parses JSON string into [TagType] similarly to [parse]. 
  static TagType Function(String json) get parseJson =>
    TagTypeMapper.container.fromJson<TagType>;

  /// Parses JSON string into [List] of [TagType] instances similarly to 
  /// [parseList].
  static List<TagType> Function(String json) get parseJsonList =>
    TagTypeMapper.container.fromJson<List<TagType>>;

  /// Returns [TagType] by given [tagType] name.
  static TagType getByName(String tagType) =>
    TagType.values.firstWhere(
      (element) => element.name == tagType,
      orElse: () => TagType.unknown,
    );
}
