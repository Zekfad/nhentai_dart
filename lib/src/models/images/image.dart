part of 'images.dart';


/// Image.
@MappableClass(
  hook: EncodeImageHook(),
  includeCustomMappers: [
    ImageTypeMapper(),
  ],
)
@immutable
final class Image with ImageMappable {
  const Image({
    required this.id,
    required this.media,
    required this.type,
    this.width,
    this.height,
  });

  /// Parses [Image] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [Image] object.
  /// * [Image] - then value will be returned as-is.
  static Image Function(dynamic value) get parse =>
    MapperContainer.globals.initialized.fromValue<Image>;

  /// Parses [List] of [Image] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [Image] - then value will be returned as-is.
  static List<Image> Function(dynamic value) get parseList =>
    MapperContainer.globals.initialized.fromValue<List<Image>>;

  /// Parses JSON string into [Image] similarly to [parse]. 
  static Image Function(String json) get parseJson =>
    MapperContainer.globals.initialized.fromJson<Image>;

  /// Parses JSON string into [List] of [Image] instances similarly to 
  /// [parseList].
  static List<Image> Function(String json) get parseJsonList =>
    MapperContainer.globals.initialized.fromJson<List<Image>>;

  /// Associated book media gallery ID.
  @MappableField(key: 'media_id')
  final int media;

  /// Image ID.
  /// * `0` for book cover.
  /// * _Page number_ for usual pages.
  @MappableField(key: 'id')
  final int id;
  
  /// Image type (provides format and extension).
  @MappableField(key: 't')
  final ImageType type;
  
  /// Image width in pixels.
  @MappableField(key: 'w')
  final int? width;
  
  /// Image height in pixels.
  @MappableField(key: 'h')
  final int? height;
  
  /// Whether image is thumbnail.
  bool get isThumbnail => this is ImageThumbnail;

  /// Whether image is a book cover.
  bool get isCover => this is Cover;

  /// Returns image description that is associated book [media] and image [filename].
  @override
  String toString() => '[$media/$filename]';

  /// Image thumbnail.
  /// If called upon thumbnail or cover returns this object.
  ImageThumbnail get thumbnail => this is ImageThumbnail
    ? this as ImageThumbnail
    : ImageThumbnail(
      parent: this,
    );

  /// Returns image url using hosts settings from [api] client or
  /// provided [hosts] config.
  /// 
  /// Throws [ArgumentError] if [hosts] and [api] are both missing.
  Uri getUrl({
    API? api,
    Hosts? hosts,
  }) => get_image_url.getImageUrl(this, api: api, hosts: hosts);

  String get filename => getFullFilename('$id');

  @mustCallSuper
  @visibleForOverriding
  String getFullFilename(String filename) => '$filename.${type.extension}';
}
