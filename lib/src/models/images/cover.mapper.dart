// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'cover.dart';

class CoverMapper extends MapperBase<Cover> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {CoverMapper()},
      ))
        ..linkAll({ImageMapper.container}));

  @override
  CoverMapperElement createElement(MapperContainer container) {
    return CoverMapperElement._(this, container);
  }

  @override
  String get id => 'Cover';

  static final fromMap = container.fromMap<Cover>;
  static final fromJson = container.fromJson<Cover>;
}

class CoverMapperElement extends MapperElementBase<Cover> {
  CoverMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Cover decode(dynamic v) => const CoverHook().decode(
      v,
      (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
      container);
  Cover fromMap(Map<String, dynamic> map) => Cover(
      media: container.$get(map, 'media_id'),
      type: container.$get(map, 't'),
      width: container.$get(map, 'w'),
      height: container.$get(map, 'h'));

  @override
  Function get encoder => encode;
  dynamic encode(Cover v) =>
      const CoverHook().encode<Cover>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(Cover c) => {
        'media_id': container.$enc(c.media, 'media'),
        't': container.$enc(c.type, 'type'),
        'w': container.$enc(c.width, 'width'),
        'h': container.$enc(c.height, 'height')
      };

  @override
  String stringify(Cover self) =>
      'Cover(media: ${container.asString(self.media)}, id: ${container.asString(self.id)}, type: ${container.asString(self.type)}, width: ${container.asString(self.width)}, height: ${container.asString(self.height)})';
}

mixin CoverMappable {
  String toJson() => CoverMapper.container.toJson(this as Cover);
  Map<String, dynamic> toMap() => CoverMapper.container.toMap(this as Cover);
  @override
  String toString() => CoverMapper.container.asString(this);
}
