import 'package:dart_mappable/dart_mappable.dart';

import 'cover_thumbnail.dart';
import 'image.dart';
import 'image_with_known_dimensions.dart';


@MappableClass()
class Cover extends Image with ImageWithKnownDimensions {
  Cover({
    required super.media,
    required super.type,
    required super.width,
    required super.height,
  }) : super(id: 0);

  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('cover');

  @override
  CoverThumbnail get thumbnail =>
    throw UnsupportedError('Use thumbnail from book instead');
}
