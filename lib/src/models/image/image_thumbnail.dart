import 'image.dart';


class ImageThumbnail extends Image {
  ImageThumbnail(super.image, {
    required this.parent,
  });

  final Image parent;
}
