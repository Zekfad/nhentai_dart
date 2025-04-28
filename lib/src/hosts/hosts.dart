import 'package:meta/meta.dart';

import '../models.dart';
import 'api_host.dart';
import 'host.dart';
import 'host_type.dart';
import 'image_host.dart';
import 'thumbnail_host.dart';


/// Hosts config.
@immutable
class Hosts {
  /// Creates default hosts config.
  const Hosts() : hosts = const {
    HostType.api: defaultApiHosts,
    HostType.image: defaultImageHosts,
    HostType.thumbnail: defaultThumbnailHosts,
  };

  /// Creates a hosts config with one host of each type.
  Hosts.only({
    ApiHost api = defaultApiHost,
    ImageHost image = defaultImageHost,
    ThumbnailHost thumbnail = defaultThumbnailHost,
  }) : hosts = {
    HostType.api: [ api, ],
    HostType.image: [ image, ],
    HostType.thumbnail: [ thumbnail, ],
  };

  /// Creates a hosts config with multiple host of each type.
  Hosts.multiple({
    List<ApiHost> api = defaultApiHosts,
    List<ImageHost> image = defaultImageHosts,
    List<ThumbnailHost> thumbnail = defaultThumbnailHosts,
  }) : hosts = {
    HostType.api: api,
    HostType.image: image,
    HostType.thumbnail: thumbnail,
  } {
    if (api.isEmpty || image.isEmpty || thumbnail.isEmpty) {
      throw ArgumentError('Missing hosts definition.');
    }
  }

  /// Default API host.
  static const defaultApiHost = ApiHost('nhentai.net');
  /// Default image host.
  static const defaultImageHost = ImageHost('i1.nhentai.net');
  /// Default thumbnail host.
  static const defaultThumbnailHost = ThumbnailHost('t1.nhentai.net');

  /// Default API hosts.
  static const defaultApiHosts = [
    defaultApiHost,
  ];
  /// Default image hosts.
  static const defaultImageHosts = [
    defaultImageHost,
    ImageHost('i2.nhentai.net'),
    ImageHost('i3.nhentai.net'),
    ImageHost('i4.nhentai.net'),
  ];
  /// Default thumbnail hosts.
  static const defaultThumbnailHosts = [
    defaultThumbnailHost,
    ThumbnailHost('t2.nhentai.net'),
    ThumbnailHost('t3.nhentai.net'),
    ThumbnailHost('t4.nhentai.net'),
  ];

  /// Hosts map.
  final Map<HostType, List<Host>> hosts;

  /// Preferred API host.
  ApiHost get api => getHost(HostType.api) as ApiHost;
  /// Preferred image host.
  ImageHost get image => getHost(HostType.image) as ImageHost;
  /// Preferred thumbnail host.
  ThumbnailHost get thumbnail => getHost(HostType.thumbnail) as ThumbnailHost;

  /// Returns preferred host of given [type] from [hosts] list.
  /// 
  /// Overload this function if you want to implement custom host preference.
  /// 
  /// By default returns first host in a list.
  @visibleForOverriding
  Host getHost(HostType type) =>
    hosts[type]!.first;

  /// Returns preferred host of given [type].
  Host operator[](HostType type) => getHost(type);

  /// Returns [Uri] for [image].
  Uri getImageUrl(Image image) => ((image.isThumbnail || image.isCover)
    ? thumbnail
    : this.image
  ).getUri('/galleries/${image.media}/${image.filename}');

  /// Returns [Uri] for [user]'s avatar.
  Uri getAvatarUrl(User user) =>
    image.getUri('/avatars/${user.avatarFilename}');
}
