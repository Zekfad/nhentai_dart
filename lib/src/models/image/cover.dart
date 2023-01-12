import 'cover_thumbnail.dart';
import 'image.dart';


class Cover extends Image {
  Cover(super.image);

  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('cover');

  @override
  CoverThumbnail get thumbnail => 
    CoverThumbnail(this, parent: this);
}
