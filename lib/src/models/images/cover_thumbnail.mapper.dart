// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'cover_thumbnail.dart';

class CoverThumbnailMapper extends MapperBase<CoverThumbnail> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {CoverThumbnailMapper()},
      ))
        ..linkAll({ImageMapper.container, CoverMapper.container}));

  @override
  CoverThumbnailMapperElement createElement(MapperContainer container) {
    return CoverThumbnailMapperElement._(this, container);
  }

  @override
  String get id => 'CoverThumbnail';

  static final fromMap = container.fromMap<CoverThumbnail>;
  static final fromJson = container.fromJson<CoverThumbnail>;
}

class CoverThumbnailMapperElement extends MapperElementBase<CoverThumbnail> {
  CoverThumbnailMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  CoverThumbnail decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  CoverThumbnail fromMap(Map<String, dynamic> map) => CoverThumbnail(
      parent: container.$get(map, 'parent'),
      width: container.$get(map, 'w'),
      height: container.$get(map, 'h'));

  @override
  Function get encoder => encode;
  dynamic encode(CoverThumbnail v) => toMap(v);
  Map<String, dynamic> toMap(CoverThumbnail c) => {
        'parent': container.$enc(c.parent, 'parent'),
        'w': container.$enc(c.width, 'width'),
        'h': container.$enc(c.height, 'height')
      };

  @override
  String stringify(CoverThumbnail self) =>
      'CoverThumbnail(media: ${container.asString(self.media)}, id: ${container.asString(self.id)}, type: ${container.asString(self.type)}, width: ${container.asString(self.width)}, height: ${container.asString(self.height)}, parent: ${container.asString(self.parent)})';
}

mixin CoverThumbnailMappable {
  String toJson() =>
      CoverThumbnailMapper.container.toJson(this as CoverThumbnail);
  Map<String, dynamic> toMap() =>
      CoverThumbnailMapper.container.toMap(this as CoverThumbnail);
  @override
  String toString() => CoverThumbnailMapper.container.asString(this);
}
