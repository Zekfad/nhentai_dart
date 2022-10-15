import 'package:meta/meta.dart';

import 'host.dart';
import 'host_type.dart';
import 'http_host.dart';


/// API host config,
@immutable
class ApiHost with HttpHost implements Host {
  /// Creates API host config.
  const ApiHost(
    this.authority, [
      this.ssl = true,
    ]
  );

  @override
  HostType get type => HostType.api;

  @override
  final String authority;

  @override
  final bool ssl;
}
