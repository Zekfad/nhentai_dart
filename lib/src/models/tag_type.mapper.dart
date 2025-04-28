// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tag_type.dart';

class TagTypeMapper extends EnumMapper<TagType> {
  TagTypeMapper._();

  static TagTypeMapper? _instance;
  static TagTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagTypeMapper._());
    }
    return _instance!;
  }

  static TagType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TagType decode(dynamic value) {
    switch (value) {
      case r'unknown':
        return TagType.unknown;
      case r'tag':
        return TagType.tag;
      case r'category':
        return TagType.category;
      case r'artist':
        return TagType.artist;
      case r'parody':
        return TagType.parody;
      case r'character':
        return TagType.character;
      case r'group':
        return TagType.group;
      case r'language':
        return TagType.language;
      default:
        return TagType.values[0];
    }
  }

  @override
  dynamic encode(TagType self) {
    switch (self) {
      case TagType.unknown:
        return r'unknown';
      case TagType.tag:
        return r'tag';
      case TagType.category:
        return r'category';
      case TagType.artist:
        return r'artist';
      case TagType.parody:
        return r'parody';
      case TagType.character:
        return r'character';
      case TagType.group:
        return r'group';
      case TagType.language:
        return r'language';
    }
  }
}

extension TagTypeMapperExtension on TagType {
  String toValue() {
    TagTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TagType>(this) as String;
  }
}
