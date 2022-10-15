import 'package:meta/meta.dart';

import 'api_host.dart';
import 'host_type.dart';
import 'http_host.dart';
import 'image_host.dart';
import 'thumbnail_host.dart';


/// Host config.
@immutable
abstract class Host implements HttpHost {
  /// Creates host config of corresponding [type].
  factory Host(HostType type,
    String authority, [
      bool ssl = true,
    ]
  ) {
    switch (type) {
      case HostType.api:
        return ApiHost(authority, ssl);
      case HostType.image:
        return ImageHost(authority, ssl);
      case HostType.thumbnail:
        return ThumbnailHost(authority, ssl);
    }
  }

  /// Host type.
  HostType get type;
}
