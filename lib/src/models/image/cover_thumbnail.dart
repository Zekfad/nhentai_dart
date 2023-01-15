import 'package:dart_mappable/dart_mappable.dart';

import '../../../data_model.container.dart';
import 'cover.dart';
import 'image.dart';
import 'image_thumbnail.dart';
import 'image_with_known_dimensions.dart';

part 'cover_thumbnail.mapper.dart';


class CoverThumbnailHook extends MappingHook {
  const CoverThumbnailHook();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is! Map<String, dynamic>)
      throw MapperException.unexpectedType(value.runtimeType, ImageThumbnail, 'Map<String, dynamic>');

    final image = Image.fromValue({
      'id': 0,
      'media_id': 0,
      ...value,
    });
    return CoverThumbnail(
      parent: nhentaiModelsContainer.fromValue<Cover>(value['parent']),
      width: image.width!, 
      height: image.height!,
    );
  }

  @override
  dynamic beforeEncode(dynamic value) => 
    ImageMapper.container.toMap(value);
}

/// Cover thumbnail.
@MappableClass(
  hook: CoverThumbnailHook(),
)
class CoverThumbnail extends Image with ImageWithKnownDimensions, CoverThumbnailMappable implements Cover, ImageThumbnail {
  CoverThumbnail({
    required this.parent,
    required int width,
    required int height,
  }) : super(
    id: parent.id,
    type: parent.type,
    media: parent.media,
    width: width,
    height: height,
  );

  static final fromMap = CoverThumbnailMapper.fromMap;
  static final fromJson = CoverThumbnailMapper.fromJson;

  @override
  final Cover parent;
  
  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('thumb');
  
  @override
  CoverThumbnail get thumbnail => this;
}
