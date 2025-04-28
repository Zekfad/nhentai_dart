part of 'images.dart';


/// Cover thumbnail.
/// Inherits [parent]'s [Image.id], [Image.type], [Image.media].
@MappableClass(
  hook: EncodeImageHook(),
)
@immutable
final class CoverThumbnail extends Image with ImageWithKnownDimensions, CoverThumbnailMappable implements Cover, ImageThumbnail {
  /// Cover thumbnail.
  /// Inherits [parent]'s [Image.id], [Image.type], [Image.media].
  CoverThumbnail({
    required this.parent,
    required int super.width,
    required int super.height,
  }) : super(
    id: parent.id,
    type: parent.type,
    media: parent.media,
  );
  
  /// Parses [CoverThumbnail] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [CoverThumbnail] object.
  /// * [CoverThumbnail] - then value will be returned as-is.
  static CoverThumbnail Function(dynamic value) get parse =>
    MapperContainer.globals.initialized.fromValue<CoverThumbnail>;

  /// Parses [List] of [CoverThumbnail] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [CoverThumbnail] - then value will be returned as-is.
  static List<CoverThumbnail> Function(dynamic value) get parseList =>
    MapperContainer.globals.initialized.fromValue<List<CoverThumbnail>>;

  /// Parses JSON string into [CoverThumbnail] similarly to [parse]. 
  static CoverThumbnail Function(String json) get parseJson =>
    MapperContainer.globals.initialized.fromJson<CoverThumbnail>;

  /// Parses JSON string into [List] of [CoverThumbnail] instances similarly to 
  /// [parseList].
  static List<CoverThumbnail> Function(String json) get parseJsonList =>
    MapperContainer.globals.initialized.fromJson<List<CoverThumbnail>>;

  @override
  final Cover parent;
  
  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('thumb');
  
  @override
  CoverThumbnail get thumbnail => this;
}
