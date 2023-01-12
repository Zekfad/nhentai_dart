import 'dart:collection';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import 'tag.dart';
import 'tag_type.dart';

class TagsListMapper extends SimpleMapper<TagsList> {
  const TagsListMapper();

  @override
  TagsList decode(dynamic value) {
    if(value is! Iterable<dynamic>)
      throw MapperException.unexpectedType(value.runtimeType, TagsList, 'Iterable<dynamic>');
    
    return TagsList(
      value.map((tag) {
        if(tag is! Map<String, dynamic>)
          throw MapperException.unexpectedType(tag.runtimeType, Tag, 'Map<String, dynamic>');
        
        return Tag.fromMap(tag);
      }),
    );
  }

  @override
  dynamic encode(TagsList self) => self._list.map((e) => e.toMap()).toList();

}

/// Unmodifiable tags list.
/// Extends unmodifiable list and adds helpful methods.
@immutable
class TagsList extends ListBase<Tag> {
  /// Creates an unmodifiable tag list from iterable with tags.
  TagsList(
    Iterable<Tag> list,
  ) :
    _list = List.unmodifiable(list);

  /// Underlying unmodifiable list.
  final List<Tag> _list;

  /// Tags count.
  @override
  int get length => _list.length;

  /// Always throws [UnsupportedError], because tags list is unmodifiable.
  @override
  set length(int newLength) => throw UnsupportedError(
    'Cannot change tags list length because it is unmodifiable.',
  );

  /// Get tag by [index].
  @override
  Tag operator [](int index) => _list[index];

  /// Always throws [UnsupportedError], because tags list is unmodifiable.
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
