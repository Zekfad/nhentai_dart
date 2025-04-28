part of 'images.dart';


/// Thumbnail.
/// Inherits [parent]'s [Image.id], [Image.type], [Image.media].
@MappableClass(
  hook: EncodeImageHook(),
)
@immutable
final class ImageThumbnail extends Image with ImageThumbnailMappable {
  /// Thumbnail.
  /// Inherits [parent]'s [Image.id], [Image.type], [Image.media].
  ImageThumbnail({
    required this.parent,
    super.width,
    super.height,
  }) : super(
    id: parent.id,
    type: parent.type,
    media: parent.media,
  );

  /// Parses [ImageThumbnail] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [ImageThumbnail] object.
  /// * [ImageThumbnail] - then value will be returned as-is.
  static ImageThumbnail Function(dynamic value) get parse =>
    MapperContainer.globals.initialized.fromValue<ImageThumbnail>;

  /// Parses [List] of [ImageThumbnail] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [ImageThumbnail] - then value will be returned as-is.
  static List<ImageThumbnail> Function(dynamic value) get parseList =>
    MapperContainer.globals.initialized.fromValue<List<ImageThumbnail>>;

  /// Parses JSON string into [ImageThumbnail] similarly to [parse]. 
  static ImageThumbnail Function(String json) get parseJson =>
    MapperContainer.globals.initialized.fromJson<ImageThumbnail>;

  /// Parses JSON string into [List] of [ImageThumbnail] instances similarly to 
  /// [parseList].
  static List<ImageThumbnail> Function(String json) get parseJsonList =>
    MapperContainer.globals.initialized.fromJson<List<ImageThumbnail>>;

  /// Parent image.
  @MappableField(key: 'parent')
  final Image parent;

  @override
  String getFullFilename(String filename) =>
    super.getFullFilename('${filename}t');
}
