// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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
  final MappableFields<Tag> fields = const {
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
    return ensureInitialized().decodeMap<Tag>(map);
  }

  static Tag fromJson(String json) {
    return ensureInitialized().decodeJson<Tag>(json);
  }
}

mixin TagMappable {
  String toJson() {
    return TagMapper.ensureInitialized().encodeJson<Tag>(this as Tag);
  }

  Map<String, dynamic> toMap() {
    return TagMapper.ensureInitialized().encodeMap<Tag>(this as Tag);
  }

  TagCopyWith<Tag, Tag, Tag> get copyWith =>
      _TagCopyWithImpl(this as Tag, $identity, $identity);
  @override
  String toString() {
    return TagMapper.ensureInitialized().stringifyValue(this as Tag);
  }
}

extension TagValueCopy<$R, $Out> on ObjectCopyWith<$R, Tag, $Out> {
  TagCopyWith<$R, Tag, $Out> get $asTag =>
      $base.as((v, t, t2) => _TagCopyWithImpl(v, t, t2));
}

abstract class TagCopyWith<$R, $In extends Tag, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, TagType? type, String? name, int? count, String? url});
  TagCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Tag, $Out>
    implements TagCopyWith<$R, Tag, $Out> {
  _TagCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tag> $mapper = TagMapper.ensureInitialized();
  @override
  $R call({int? id, TagType? type, String? name, int? count, String? url}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (type != null) #type: type,
        if (name != null) #name: name,
        if (count != null) #count: count,
        if (url != null) #url: url
      }));
  @override
  Tag $make(CopyWithData data) => Tag(
      id: data.get(#id, or: $value.id),
      type: data.get(#type, or: $value.type),
      name: data.get(#name, or: $value.name),
      count: data.get(#count, or: $value.count),
      url: data.get(#url, or: $value.url));

  @override
  TagCopyWith<$R2, Tag, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TagCopyWithImpl($value, $cast, t);
}
