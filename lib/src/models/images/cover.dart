import 'package:dart_mappable/dart_mappable.dart';

import 'cover_thumbnail.dart';
import 'image.dart';
import 'image_with_known_dimensions.dart';

part 'cover.mapper.dart';


/// Mapping hook for [Cover].
class CoverHook extends MappingHook {
  const CoverHook();

  @override
  dynamic beforeEncode(dynamic value) => 
    ImageMapper.container.toMap<Image>(value as Image); 
}

/// Cover.
@MappableClass(
  hook: CoverHook(),
)
class Cover extends Image with ImageWithKnownDimensions, CoverMappable {
  Cover({
    required super.media,
    required super.type,
    required int width,
    required int height,
  }) : super(
    id: 0, 
    width: width, 
    height: height,
  );

  /// Parses [Cover] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [Cover] object.
  /// * [Cover] - then value will be returned as-is.
  static Cover Function(dynamic value) get parse =>
    CoverMapper.container.fromValue<Cover>;

  /// Parses [List] of [Cover] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [Cover] - then value will be returned as-is.
  static List<Cover> Function(dynamic value) get parseList =>
    CoverMapper.container.fromValue<List<Cover>>;

  /// Parses JSON string into [Cover] similarly to [parse]. 
  static Cover Function(String json) get parseJson =>
    CoverMapper.container.fromJson<Cover>;

  /// Parses JSON string into [List] of [Cover] instances similarly to 
  /// [parseList].
  static List<Cover> Function(String json) get parseJsonList =>
    CoverMapper.container.fromJson<List<Cover>>;

  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('cover');
  
  @override
  CoverThumbnail get thumbnail =>
    throw UnsupportedError('Use thumbnail from book instead');
}
