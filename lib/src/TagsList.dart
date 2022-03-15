import 'dart:collection';

import 'Tag.dart';


/// Unmodifiable tags list.
/// Extends unmodifiable list with helpful methods.
class TagsList extends ListBase<Tag> {
  /// Create unmodifiable tag list from iterable with tags.
  TagsList(
    Iterable<Tag> list,
  ) :
    _list = List.unmodifiable(list),
    super();

  /// Underlying unmodifiable list.
  final List<Tag> _list;

  /// Tags count.
  @override
  int get length => _list.length;

  /// Always throws, because tags list is unmodifiable.
  @override
  set length(int newLength) => throw UnsupportedError(
    'Cannot change tags list length because it is unmodifiable.',
  );

  /// Get tag by [index].
  @override
  Tag operator [](int index) => _list[index];

  /// Always throws, because tags list is unmodifiable.
  @override
  void operator []=(int index, Tag value) => throw UnsupportedError(
    'Cannot change tags list values because it is unmodifiable.',
  );

  /// Get unmodifiable subset of tags with requested [types].
  Iterable<Tag> get(List<TagType> types) => List.unmodifiable(
    _list.where((element) => types.contains(element.type)),
  );

  /// Get unmodifiable subset of tags without requested [types].
  Iterable<Tag> exclude(List<TagType> types) => List.unmodifiable(
    _list.where((element) => !types.contains(element.type)),
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
