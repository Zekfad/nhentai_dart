import 'package:meta/meta.dart';

import 'image.dart';


/// Thumbnail.
@immutable
class ImageThumbnail extends Image {
  ImageThumbnail({
    required this.parent,
    super.width,
    super.height,
  }) : super(
    id: parent.id,
    type: parent.type,
    media: parent.media,
  );

  final Image parent;

  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('${filename}t');
}
