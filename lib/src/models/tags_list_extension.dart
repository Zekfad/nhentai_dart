import 'tag.dart';
import 'tag_type.dart';


extension TagsListExtension on List<Tag> {
  /// Get unmodifiable subset of tags with requested [types].
  Iterable<Tag> get(List<TagType> types) => List.unmodifiable(
    where((element) => types.contains(element.type)),
  );

  /// Get unmodifiable subset of tags without requested [types].
  Iterable<Tag> exclude(List<TagType> types) => List.unmodifiable(
    where((element) => !types.contains(element.type)),
  );

  /// Ordinary tags.
  Iterable<Tag> get tags => get(const [TagType.tag]);
  /// Category tags.
  Iterable<Tag> get categories => get(const [TagType.category]);
  /// Artist tags.
  Iterable<Tag> get artists => get(const [TagType.artist]);
  /// Parody tags.
  Iterable<Tag> get parodies => get(const [TagType.parody]);
  /// Character tags.
  Iterable<Tag> get characters => get(const [TagType.character]);
  /// Group tags.
  Iterable<Tag> get groups => get(const [TagType.group]);
  /// Language tags.
  Iterable<Tag> get languages => get(const [TagType.language]);
}
