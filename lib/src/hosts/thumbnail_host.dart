import 'package:meta/meta.dart';

import 'host.dart';
import 'host_type.dart';
import 'http_host.dart';


/// Thumbnail host config,
@immutable
class ThumbnailHost with HttpHost implements Host {
  /// Creates thumbnail host config.
  const ThumbnailHost(
    this.authority, [
      this.ssl = true,
    ]
  );

  @override
  HostType get type => HostType.thumbnail;

  @override
  final String authority;

  @override
  final bool ssl;
}
