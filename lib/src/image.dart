import 'package:meta/meta.dart';

import 'api.dart';
import 'book.dart';
import 'get_image_url.dart' as get_image_url;
import 'hosts.dart';
import 'image_type.dart';
import 'parsers.dart' as parsers;


/// Image.
/// Cover or usual page.
@immutable
class Image {
  /// Creates an image for a given [book].
  const Image({
    required this.id,
    required this.book,
    required this.isThumbnail,
    required this.type,
    this.width,
    this.height,
  });

  /// Image ID.
  /// * `0` for book cover.
  /// * _Page number_ for usual pages.
  final int id;
  /// Whether image is thumbnail.
  final bool isThumbnail;
  /// Book associated with this image.
  final Book book;
  /// Image type (provides format and extension).
  final ImageType type;
  /// Image width in pixels.
  final int? width;
  /// Image height in pixels.
  final int? height;

  /// Whether image is a book cover.
  bool get isCover => id == 0;

  /// Image filename.
  String get filename => '${isCover
    ? (isThumbnail ? 'thumb' : 'cover')
    : (isThumbnail ? '${id}t' : '$id')
  }.${type.extension}';

  /// Returns image description that is [book] title and image [filename].
  @override
  String toString() => '[$book/$filename]';

  /// Image thumbnail.
  /// If called upon thumbnail or cover returns this object.
  Image get thumbnail => (isThumbnail || isCover)
    ? this
    : Image(
      id: id,
      book: book,
      isThumbnail: true,
      type: type,
    );

  /// Returns image url using hosts settings from [api] client or
  /// provided [hosts] config.
  /// 
  /// Throws [ArgumentError] if [hosts] and [api] are both missing.
  Uri getUrl({
    API? api,
    Hosts? hosts,
  }) => get_image_url.getImageUrl(this, api: api, hosts: hosts);

  /// Parses image from API [json] object.
  /// 
  /// Requires [book] which this image belongs to.
  /// 
  /// By default [id] is `0` which means image will be parsed as cover.
  /// 
  /// Returns `null` if [json] can't be parsed to [Image].
  static Image? tryParse(dynamic json, {
    required Book book,
    int id = 0,
    bool thumbnail = false,
  }) {
    if (json == null)
      return null;
    try {
      return Image.parse(
        json,
        book: book,
        id: id,
        thumbnail:
        thumbnail,
      );
    } on FormatException { // Ignore bad JSON.
      return null;
    }
  }

  /// Parses image from API [json] object.
  /// 
  /// Requires [book] which this image belongs to.
  /// 
  /// By default [id] is `0` which means image will be parsed as cover.
  /// 
  /// Throws a [FormatException] if [json] can't be parsed to [Image].
  // ignore: sort_constructors_first
  factory Image.parse(dynamic json, {
    required Book book,
    int id = 0,
    bool thumbnail = false,
  }) {
    final type = ImageType.getByType(parsers.parse(json?['t']));
    assert(
      !type.isUnknown,
      'Unknown image type found while parsing JSON. '
      'If that\'s not an error open new issue for adding support for "${type.extension}" type.',
    );
    return Image(
      id         : id,
      book       : book,
      isThumbnail: thumbnail,
      type       : type,
      width      : parsers.parse(json?['w']),
      height     : parsers.parse(json?['h']),
    );
  }
}
