import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../../api.dart';
import '../../get_image_url.dart' as get_image_url;
import '../../hosts.dart';
import 'image_type.dart';
import 'cover.dart';
import 'image_thumbnail.dart';


class ImageHooks extends MappingHooks {
  const ImageHooks();

  @override
  dynamic beforeEncode(dynamic value) {
    if(value is! Image)
      throw MapperException.unexpectedType(value.runtimeType, Map<String, dynamic>, 'Image');

    return {
      't': value.type.extension,
      'w': value.width,
      'h': value.height,
    };
  }
}

@MappableClass(
  hooks: ImageHooks(),
)
class Image {
  const Image({
    required this.id,
    required this.media,
    required this.type,
    this.width,
    this.height,
  });

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
