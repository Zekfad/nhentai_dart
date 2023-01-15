import 'package:dart_mappable/dart_mappable.dart';

import 'cover_thumbnail.dart';
import 'image.dart';
import 'image_with_known_dimensions.dart';

part 'cover.mapper.dart';


/// Custom mapper for [Cover].
class CoverHook extends MappingHook {
  const CoverHook();

  @override
  Cover beforeDecode(dynamic value) {
    if (value is! Map<String, dynamic>)
      throw MapperException.unexpectedType(value.runtimeType, Cover, 'Map<String, dynamic>');

    final image = Image.fromValue({
      ...value,
      'id': 0,
    });
    return Cover(
      media: image.media, 
      type: image.type, 
      width: image.width!, 
      height: image.height!,
    );
  }

  @override
  dynamic beforeEncode(dynamic value) => 
    ImageMapper.container.toMap(value); 
}

/// Cover.
@MappableClass(
  hook: CoverHook(),
)
class Cover extends Image with ImageWithKnownDimensions, CoverMappable {
  Cover({
    required super.media,
    required super.type,
    required int width,
    required int height,
  }) : super(
    id: 0, 
    width: width, 
    height: height,
  );

  static final fromMap = CoverMapper.fromMap;
  static final fromJson = CoverMapper.fromJson;
  
  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('cover');
  
  @override
  CoverThumbnail get thumbnail =>
    throw UnsupportedError('Use thumbnail from book instead');
}
