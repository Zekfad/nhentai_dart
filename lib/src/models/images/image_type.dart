import 'package:meta/meta.dart';

part 'known_image_type.dart';
part 'unknown_image_type.dart';

/// Image type.
/// 
/// Represents type name and extension.
/// 
/// Refer to [KnownImageType] enum for known types.
@immutable
sealed class ImageType {
  /// Returns [KnownImageType] type if possible otherwise [UnknownImageType].
  factory ImageType(String type) =>
    KnownImageType._typesMap[type.toLowerCase()] ??
      UnknownImageType(type);

  /// Creates new "unknown" image type.
  const factory ImageType.unknown(
    String extension, [
      String name,
    ]
  ) = UnknownImageType;

  /// Internal constructor.
  const ImageType._(
    this.extension,
    this.name,
  );

  /// Check whether [type] is known.
  static bool isKnown(String type) => KnownImageType._typesMap.containsKey(
    type.toLowerCase(),
  );

  /// Human-readable type name.
  final String name;
  /// File extension.
  final String extension;
}
