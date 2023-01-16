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

  /// Returns [TagType] by given [tagType] name.
  static TagType getByName(String tagType) =>
    TagType.values.firstWhere(
      (element) => element.name == tagType,
      orElse: () => TagType.unknown,
    );
}
