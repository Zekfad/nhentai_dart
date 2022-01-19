import 'API.dart';
import 'Book.dart';
import 'Exceptions.dart';
import 'utils.dart' show parseAsTyped;


class ImageType {
  const ImageType._new(
    this.name,
    this.extension,
  ) : super();

  const ImageType._unknown(
    this.extension,
  ) :
    name = 'Unknown',
    super();

  final String name;
  final String extension;

  static const jpeg = ImageType._new('JPEG', 'jpg');
  static const png  = ImageType._new('PNG', 'png');
  static const gif  = ImageType._new('GIF', 'gif');

  static const Map<String, ImageType> types = {
    'j'   : jpeg,
    'jpg' : jpeg,
    'jpeg': jpeg,
    'p'   : png,
    'png' : png,
    'g'   : gif,
    'gif' : gif,
  };

  @override
  String toString() => extension;
}

/// Image.
/// Cover or normal page.
class Image {
  Image({
    required this.id,
    required this.book,
    required this.isThumbnail,
    required this.type,
    this.width,
    this.height,
  }) : super();

  /// Image ID.
  /// `0` for book cover.
  /// *Page number* for normal pages.
  final int id;
  /// Whether image is thumbnail.
  final bool isThumbnail;
  /// Image's related Book.
  final Book book;
  /// Image type (format and extension).
  final ImageType type;
  /// Image width is pixels.
  final int? width;
  /// Image height in pixels.
  final int? height;

  /// Whether image is book cover.
  bool get isCover => id == 0;

  /// Image filename.
  String get filename => '${isCover? (isThumbnail ? 'thumb' : 'cover') : (isThumbnail ? '${id}t' : id)}.${type.extension}';

  /// Get image description.
  /// Consists of book title and image [filename].
  @override
  String toString() => '[$book/$filename]';

  /// Get image thumbnail.
  /// This method will return itself if it's already a thumbnail or cover.
  Image get thumbnail => isThumbnail || isCover
    ? this
    : Image(
      id: id,
      book: book,
      isThumbnail: true,
      type: type,
    );

  /// Get image url using hosts settings from [api] client or [hosts] config.
  Uri getUrl({
    API? api,
    Hosts? hosts,
  }) {
    final url = (api?.hosts ?? hosts)?.getImageUrl(this);
    if (url == null)
      throw Exception('Either api or hosts must be provided.');
    return url;
  }  

  /// Parse image from API [json] object.
  /// You must provide [book] which this image belongs to.
  static Image? parse(dynamic json, {
    required Book book,
    int id = 0,
    bool thumbnail = false,
  }) {
    if (json == null)
      return null;
    APIException.throwIfError(json);
    final _type = parseAsTyped<String>(json?['t']);
    final type = ImageType.types[_type.toLowerCase()];
    assert(
      type != null,
      'Unknown image type found while parsing JSON. '
      'If that\'s not an error open new issue for adding support for "$_type" type.',
    );
    return Image(
      id       : id,
      book     : book,
      isThumbnail: thumbnail,
      type     : type ?? ImageType._unknown(_type),
      width    : parseAsTyped(json?['w'])!,
      height   : parseAsTyped(json?['h'])!,
    );
  }
}
