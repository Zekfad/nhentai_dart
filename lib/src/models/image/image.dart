import 'package:meta/meta.dart';

import '../../api.dart';
import '../../get_image_url.dart' as get_image_url;
import '../../hosts.dart';
import 'cover.dart';
import 'image_model.dart';
import 'image_thumbnail.dart';
import 'image_type.dart';


class Image implements ImageModel {
  // Work around ImageModelMappable overriding ==.
  Image(ImageModel image) : _image = image;

  final ImageModel _image;

  @override int get media => _image.media;
  @override int get id => _image.id;
  @override ImageType get type => _image.type;
  @override int? get width => _image.width;
  @override int? get height => _image.height;
  
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
    : ImageThumbnail(_image,
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

  @override
  String toJson() => _image.toJson();

  @override
  Map<String, dynamic> toMap() => _image.toMap();
}
