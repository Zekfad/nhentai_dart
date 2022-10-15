import 'package:meta/meta.dart';


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
  @internal
  const ImageType.unknown(
    this.extension,
  ) :
    name = 'Unknown',
    isUnknown = true;

  /// Returns [ImageType] by corresponding [type] string.
  @internal
  factory ImageType.getByType(String type) =>
    _typesMap[type.toLowerCase()] ?? ImageType.unknown(type);

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