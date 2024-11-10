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
      case 'unknown':
        return TagType.unknown;
      case 'tag':
        return TagType.tag;
      case 'category':
        return TagType.category;
      case 'artist':
        return TagType.artist;
      case 'parody':
        return TagType.parody;
      case 'character':
        return TagType.character;
      case 'group':
        return TagType.group;
      case 'language':
        return TagType.language;
      default:
        return TagType.values[0];
    }
  }

  @override
  dynamic encode(TagType self) {
    switch (self) {
      case TagType.unknown:
        return 'unknown';
      case TagType.tag:
        return 'tag';
      case TagType.category:
        return 'category';
      case TagType.artist:
        return 'artist';
      case TagType.parody:
        return 'parody';
      case TagType.character:
        return 'character';
      case TagType.group:
        return 'group';
      case TagType.language:
        return 'language';
    }
  }
}

extension TagTypeMapperExtension on TagType {
  String toValue() {
    TagTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TagType>(this) as String;
  }
}
