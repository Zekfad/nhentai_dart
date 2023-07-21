part of 'image_type.dart';


/// Known image type.
/// Represents type name and extension.
enum KnownImageType implements ImageType {
  /// Joint Photographic Experts Group image type.
  jpeg('jpg', 'JPEG'),
  /// Portable Network Graphics image type.
  png('png', 'PNG'),
  /// Graphics Interchange Format image type.
  gif('gif', 'GIF'),

  ;
  /// Internal constructor.
  /// 
  /// Creates "known" image type with known file extension.
  const KnownImageType(
    this.extension,
    this.name,
  );

  /// Types map used in [ImageType.new].
  static const Map<String, ImageType> _typesMap = {
    'j'   : jpeg,
    'jpg' : jpeg,
    'jpeg': jpeg,
    'p'   : png,
    'png' : png,
    'g'   : gif,
    'gif' : gif,
  };

  /// File extension.
  @override
  final String extension;

  /// Human-readable type name.
  @override
  final String name;

  /// Returns human-readable type name.
  @override
  String toString() => name;
}
