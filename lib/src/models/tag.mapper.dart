// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'tag.dart';

class TagMapper extends MapperBase<Tag> {
  static MapperContainer container = MapperContainer(
    mappers: {TagMapper()},
  )..linkAll({TagTypeMapper.container});

  @override
  TagMapperElement createElement(MapperContainer container) {
    return TagMapperElement._(this, container);
  }

  @override
  String get id => 'Tag';

  static final fromMap = container.fromMap<Tag>;
  static final fromJson = container.fromJson<Tag>;
}

class TagMapperElement extends MapperElementBase<Tag> {
  TagMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Tag decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Tag fromMap(Map<String, dynamic> map) => Tag(
      id: container.$get(map, 'id'),
      type: container.$get(map, 'type'),
      name: container.$get(map, 'name'),
      count: container.$get(map, 'count'),
      url: container.$get(map, 'url'));

  @override
  Function get encoder => encode;
  dynamic encode(Tag v) => toMap(v);
  Map<String, dynamic> toMap(Tag t) => {
        'id': container.$enc(t.id, 'id'),
        'type': container.$enc(t.type, 'type'),
        'name': container.$enc(t.name, 'name'),
        'count': container.$enc(t.count, 'count'),
        'url': container.$enc(t.url, 'url')
      };

  @override
  String stringify(Tag self) =>
      'Tag(id: ${container.asString(self.id)}, type: ${container.asString(self.type)}, name: ${container.asString(self.name)}, count: ${container.asString(self.count)}, url: ${container.asString(self.url)})';
}

mixin TagMappable {
  String toJson() => TagMapper.container.toJson(this as Tag);
  Map<String, dynamic> toMap() => TagMapper.container.toMap(this as Tag);
  @override
  String toString() => TagMapper.container.asString(this);
}
