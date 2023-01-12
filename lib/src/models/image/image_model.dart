import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import 'image_type.dart';

part 'image_model.mapper.dart';


class ImageHook extends MappingHook {
  const ImageHook();

  @override
  dynamic beforeEncode(dynamic value) {
    if(value is! ImageModel)
      throw MapperException.unexpectedType(value.runtimeType, Map<String, dynamic>, 'ImageModel');

    return {
      't': value.type.extension,
      'w': value.width,
      'h': value.height,
    };
  }
}

@immutable
@MappableClass(
  hook: ImageHook(),
  includeCustomMappers: [
    ImageTypeMapper,
  ],
)
class ImageModel with ImageModelMappable {
  const ImageModel({
    required this.id,
    required this.media,
    required this.type,
    this.width,
    this.height,
  });

  static final fromMap = ImageModelMapper.fromMap;
  static final fromJson = ImageModelMapper.fromJson;

  /// Associated book media gallery ID.
  @MappableField(key: 'media_id')
  final int media;

  /// Image ID.
  /// * `0` for book cover.
  /// * _Page number_ for usual pages.
  @MappableField(key: 'id')
  final int id;
  
  /// Image type (provides format and extension).
  @MappableField(key: 't')
  final ImageType type;
  
  /// Image width in pixels.
  @MappableField(key: 'w')
  final int? width;
  
  /// Image height in pixels.
  @MappableField(key: 'h')
  final int? height;
}
