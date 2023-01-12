import 'image_thumbnail.dart';


class CoverThumbnail extends ImageThumbnail {
  CoverThumbnail(super.image, {required super.parent});

  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('thumb');

  @override
  CoverThumbnail get thumbnail => this;

}
