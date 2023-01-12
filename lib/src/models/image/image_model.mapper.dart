// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'image_model.dart';

class ImageModelMapper extends MapperBase<ImageModel> {
  static MapperContainer container = MapperContainer(
    mappers: {ImageModelMapper(), ImageTypeMapper()},
  );

  @override
  ImageModelMapperElement createElement(MapperContainer container) {
    return ImageModelMapperElement._(this, container);
  }

  @override
  String get id => 'ImageModel';

  static final fromMap = container.fromMap<ImageModel>;
  static final fromJson = container.fromJson<ImageModel>;
}

class ImageModelMapperElement extends MapperElementBase<ImageModel> {
  ImageModelMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  ImageModel decode(dynamic v) => const ImageHook().decode(
      v,
      (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
      container);
  ImageModel fromMap(Map<String, dynamic> map) => ImageModel(
      id: container.$get(map, 'id'),
      media: container.$get(map, 'media_id'),
      type: container.$get(map, 't'),
      width: container.$getOpt(map, 'w'),
      height: container.$getOpt(map, 'h'));

  @override
  Function get encoder => encode;
  dynamic encode(ImageModel v) =>
      const ImageHook().encode<ImageModel>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(ImageModel i) => {
        'id': container.$enc(i.id, 'id'),
        'media_id': container.$enc(i.media, 'media'),
        't': container.$enc(i.type, 'type'),
        'w': container.$enc(i.width, 'width'),
        'h': container.$enc(i.height, 'height')
      };

  @override
  String stringify(ImageModel self) =>
      'ImageModel(media: ${container.asString(self.media)}, id: ${container.asString(self.id)}, type: ${container.asString(self.type)}, width: ${container.asString(self.width)}, height: ${container.asString(self.height)})';
}

mixin ImageModelMappable {
  String toJson() => ImageModelMapper.container.toJson(this as ImageModel);
  Map<String, dynamic> toMap() =>
      ImageModelMapper.container.toMap(this as ImageModel);
  @override
  String toString() => ImageModelMapper.container.asString(this);
}
