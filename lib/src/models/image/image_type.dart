import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';


class ImageTypeMapper extends SimpleMapper<ImageType> {
  const ImageTypeMapper();

  @override
  ImageType decode(dynamic value) {
    final type = ImageType.getByType(value as String);
    assert(
      !type.isUnknown,
      'Unknown image type found while parsing JSON. '
      'If that\'s not an error open new issue for adding support for "${type.extension}" type.',
    );

    return type;
  }

  @override
  dynamic encode(ImageType self) => self.extension;
}

/// Image type.
/// Represents type name and extension.
@immutable
class ImageType {
  /// Internal constructor.
  /// 
  /// Creates "known" image type with known file extension.
  const ImageType._(
    this.name,
    this.extension,
  ) :
    isUnknown = false;


  /// Internal constructor.
  /// 
  /// Creates unknown image type.
  const ImageType._unknown(
    this.extension,
  ) :
    name = 'Unknown',
    isUnknown = true;

  /// Returns [ImageType] by corresponding [type] string.
  /// 
  /// If no such type is known, new "unknown" image type instance returned.
  factory ImageType.getByType(String type) =>
    _typesMap[type.toLowerCase()] ?? ImageType._unknown(type);

  /// Human-readable type name.
  final String name;
  /// File extension.
  final String extension;
  /// Whether is image type is unknown.
  @internal
  final bool isUnknown;

  /// Joint Photographic Experts Group image type.
  static const jpeg = ImageType._('JPEG', 'jpg');
  /// Portable Network Graphics image type.
  static const png  = ImageType._('PNG', 'png');
  /// Graphics Interchange Format image type.
  static const gif  = ImageType._('GIF', 'gif');

  /// Types map used in [ImageType.getByType].
  static const Map<String, ImageType> _typesMap = {
    'j'   : jpeg,
    'jpg' : jpeg,
    'jpeg': jpeg,
    'p'   : png,
    'png' : png,
    'g'   : gif,
    'gif' : gif,
  };

  /// Returns human-readable type name.
  @override
  String toString() => name;
}
