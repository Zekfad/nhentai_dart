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

  /// Returns [TagType] by given [tagType] name.
  static TagType getByName(String tagType) =>
    TagType.values.firstWhere(
      (element) => element.name == tagType,
      orElse: () => TagType.unknown,
    );
}
