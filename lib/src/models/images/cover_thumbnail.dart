import 'package:dart_mappable/dart_mappable.dart';

import 'cover.dart';
import 'image.dart';
import 'image_thumbnail.dart';
import 'image_with_known_dimensions.dart';

part 'cover_thumbnail.mapper.dart';


/// Custom mapper for [CoverThumbnail].
class CoverThumbnailHook extends MappingHook {
  const CoverThumbnailHook();

  @override
  dynamic beforeEncode(dynamic value) => 
    ImageMapper.container.toMap(value);
}

/// Cover thumbnail.
@MappableClass(
  // hook: CoverThumbnailHook(),
)
class CoverThumbnail extends Image with ImageWithKnownDimensions, CoverThumbnailMappable implements Cover, ImageThumbnail {
  CoverThumbnail({
    required this.parent,
    required int width,
    required int height,
  }) : super(
    id: parent.id,
    type: parent.type,
    media: parent.media,
    width: width,
    height: height,
  );
  
  /// Parses [CoverThumbnail] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [CoverThumbnail] object.
  /// * [CoverThumbnail] - then value will be returned as-is.
  static CoverThumbnail Function(dynamic value) get parse =>
    CoverThumbnailMapper.container.fromValue<CoverThumbnail>;

  /// Parses [List] of [CoverThumbnail] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [CoverThumbnail] - then value will be returned as-is.
  static List<CoverThumbnail> Function(dynamic value) get parseList =>
    CoverThumbnailMapper.container.fromValue<List<CoverThumbnail>>;

  /// Parses JSON string into [CoverThumbnail] similarly to [parse]. 
  static CoverThumbnail Function(String json) get parseJson =>
    CoverThumbnailMapper.container.fromJson<CoverThumbnail>;

  /// Parses JSON string into [List] of [CoverThumbnail] instances similarly to 
  /// [parseList].
  static List<CoverThumbnail> Function(String json) get parseJsonList =>
    CoverThumbnailMapper.container.fromJson<List<CoverThumbnail>>;

  @override
  final Cover parent;
  
  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('thumb');
  
  @override
  CoverThumbnail get thumbnail => this;
}
