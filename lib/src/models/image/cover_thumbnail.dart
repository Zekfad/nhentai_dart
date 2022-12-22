import 'package:dart_mappable/dart_mappable.dart';

import 'cover.dart';
import 'image.dart';
import 'image_thumbnail.dart';
import 'image_with_known_dimensions.dart';


@MappableClass()
class CoverThumbnail extends Image with ImageWithKnownDimensions implements Cover, ImageThumbnail {
  CoverThumbnail({
    required this.parent,
    required super.width,
    required super.height,
  }) : super(
    id: parent.id,
    type: parent.type,
    media: parent.media,
  );

  @override
  final Cover parent;

  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('thumb');

  @override
  CoverThumbnail get thumbnail => this;
}
