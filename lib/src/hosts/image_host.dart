import 'package:meta/meta.dart';

import 'host.dart';
import 'host_type.dart';
import 'http_host.dart';


/// Image host config,
@immutable
class ImageHost with HttpHost implements Host {
  /// Creates image host config.
  const ImageHost(
    this.authority, [
      this.ssl = true,
    ]
  );

  @override
  HostType get type => HostType.image;

  @override
  final String authority;

  @override
  final bool ssl;
}
