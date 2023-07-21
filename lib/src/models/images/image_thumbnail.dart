part of 'images.dart';


/// Thumbnail.
/// Inherits [parent]'s [Image.id], [Image.type], [Image.media].
@MappableClass(
  hook: EncodeImageHook(),
)
@immutable
final class ImageThumbnail extends Image with ImageThumbnailMappable {
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
