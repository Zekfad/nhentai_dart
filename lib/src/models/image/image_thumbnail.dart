import 'image.dart';


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
}
