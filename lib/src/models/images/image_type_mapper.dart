import 'package:dart_mappable/dart_mappable.dart';

import 'image_type.dart';


class ImageTypeMapper extends SimpleMapper<ImageType> {
  const ImageTypeMapper();

  @override
  ImageType decode(dynamic value) {
    if (value is ImageType)
      return value;

    if (value is! String)
      throw MapperException.unexpectedType(value.runtimeType, 'String');

    final type = ImageType(value);
    assert(
      type is KnownImageType,
      'Unknown image type found while parsing JSON. '
      'If that\'s not an error open new issue for adding support for "${type.extension}" type.',
    );

    return type;
  }

  @override
  String encode(ImageType self) => self.extension[0];
}
