part of 'images.dart';


/// Cover.
@MappableClass(
  hook: EncodeImageHook(),
)
@immutable
final class Cover extends Image with ImageWithKnownDimensions, CoverMappable {
  Cover({
    required super.media,
    required super.type,
    required int super.width,
    required int super.height,
  }) : super(
    id: 0,
  );

  /// Parses [Cover] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [Cover] object.
  /// * [Cover] - then value will be returned as-is.
  static Cover Function(dynamic value) get parse =>
    MapperContainer.globals.initialized.fromValue<Cover>;

  /// Parses [List] of [Cover] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [Cover] - then value will be returned as-is.
  static List<Cover> Function(dynamic value) get parseList =>
    MapperContainer.globals.initialized.fromValue<List<Cover>>;

  /// Parses JSON string into [Cover] similarly to [parse]. 
  static Cover Function(String json) get parseJson =>
    MapperContainer.globals.initialized.fromJson<Cover>;

  /// Parses JSON string into [List] of [Cover] instances similarly to 
  /// [parseList].
  static List<Cover> Function(String json) get parseJsonList =>
    MapperContainer.globals.initialized.fromJson<List<Cover>>;

  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('cover');
  
  @override
  CoverThumbnail get thumbnail =>
    throw UnsupportedError('Use thumbnail from book instead');
}
