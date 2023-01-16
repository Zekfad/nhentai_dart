// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'image.dart';

class ImageMapper extends MapperBase<Image> {
  static MapperContainer container = MapperContainer(
    mappers: {ImageMapper(), ImageTypeMapper()},
  );

  @override
  ImageMapperElement createElement(MapperContainer container) {
    return ImageMapperElement._(this, container);
  }

  @override
  String get id => 'Image';

  static final fromMap = container.fromMap<Image>;
  static final fromJson = container.fromJson<Image>;
}

class ImageMapperElement extends MapperElementBase<Image> {
  ImageMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Image decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Image fromMap(Map<String, dynamic> map) => Image(
      id: container.$get(map, 'id'),
      media: container.$get(map, 'media_id'),
      type: container.$get(map, 't'),
      width: container.$getOpt(map, 'w'),
      height: container.$getOpt(map, 'h'));

  @override
  Function get encoder => encode;
  dynamic encode(Image v) => toMap(v);
  Map<String, dynamic> toMap(Image i) => {
        'id': container.$enc(i.id, 'id'),
        'media_id': container.$enc(i.media, 'media'),
        't': container.$enc(i.type, 'type'),
        'w': container.$enc(i.width, 'width'),
        'h': container.$enc(i.height, 'height')
      };

  @override
  String stringify(Image self) =>
      'Image(media: ${container.asString(self.media)}, id: ${container.asString(self.id)}, type: ${container.asString(self.type)}, width: ${container.asString(self.width)}, height: ${container.asString(self.height)})';
}

mixin ImageMappable {
  String toJson() => ImageMapper.container.toJson(this as Image);
  Map<String, dynamic> toMap() => ImageMapper.container.toMap(this as Image);
  @override
  String toString() => ImageMapper.container.asString(this);
}
