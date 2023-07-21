part of 'image_type.dart';


/// Unknown image type.
@immutable
class UnknownImageType extends ImageType {
  /// Creates new "unknown" image type.
  const UnknownImageType(
    super.extension, [
      super.name = 'Unknown',
    ]
  ) : super._();
}
