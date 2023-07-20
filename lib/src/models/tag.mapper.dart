// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'tag.dart';

class TagMapper extends ClassMapperBase<Tag> {
  TagMapper._();

  static TagMapper? _instance;
  static TagMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagMapper._());
      TagTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Tag';

  static int _$id(Tag v) => v.id;
  static const Field<Tag, int> _f$id = Field('id', _$id);
  static TagType _$type(Tag v) => v.type;
  static const Field<Tag, TagType> _f$type = Field('type', _$type);
  static String _$name(Tag v) => v.name;
  static const Field<Tag, String> _f$name = Field('name', _$name);
  static int _$count(Tag v) => v.count;
  static const Field<Tag, int> _f$count = Field('count', _$count);
  static String _$url(Tag v) => v.url;
  static const Field<Tag, String> _f$url = Field('url', _$url);

  @override
  final Map<Symbol, Field<Tag, dynamic>> fields = const {
    #id: _f$id,
    #type: _f$type,
    #name: _f$name,
    #count: _f$count,
    #url: _f$url,
  };

  static Tag _instantiate(DecodingData data) {
    return Tag(
        id: data.dec(_f$id),
        type: data.dec(_f$type),
        name: data.dec(_f$name),
        count: data.dec(_f$count),
        url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static Tag fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Tag>(map));
  }

  static Tag fromJson(String json) {
    return _guard((c) => c.fromJson<Tag>(json));
  }
}

mixin TagMappable {
  String toJson() {
    return TagMapper._guard((c) => c.toJson(this as Tag));
  }

  Map<String, dynamic> toMap() {
    return TagMapper._guard((c) => c.toMap(this as Tag));
  }

  @override
  String toString() {
    return TagMapper._guard((c) => c.asString(this));
  }
}
