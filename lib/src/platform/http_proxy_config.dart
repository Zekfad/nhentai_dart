import 'dart:io';


/// HTTP proxy config.
class HttpProxyConfig {
  /// Creates new HTTP proxy from string [uri].
  /// 
  /// [uri] must be in format of `http://host:port` or
  /// `http://username:password@host:port`.
  HttpProxyConfig(String uri) {
    final proxyUri = Uri.tryParse(uri);

    if (proxyUri == null || proxyUri.scheme != 'http') {
      throw ArgumentError.value(uri, 'uri', 'Proxy URI must be valid.');
    }

    this.uri = proxyUri;

    final credentials = proxyUri.userInfo;
    if (credentials.indexOf(':') case final index when index != -1) {
      username = credentials.substring(0, index);
      password = credentials.substring(index + 1);
    }
  }

  /// Proxy [Uri].
  late final Uri uri;
  /// Proxy HTTP authorization username.
  late final String? username;
  /// Proxy HTTP authorization password.
  late final String? password;

  /// Proxy host.
  String get host => uri.host;

  /// Proxy port.
  int get port => uri.port;

  /// Whether proxy has HTTP authorization credentials.
  bool get hasCredentials => username != null && password != null;

  /// Proxy HTTP authorization credentials.
  HttpClientBasicCredentials? get credentials => !hasCredentials ? null
    : HttpClientBasicCredentials(username!, password!);

  /// Proxy [uri] in the format used by browser PAC (proxy auto-config) scripts.
  String get pacString => 'PROXY ${uri.host}:${uri.port}';
}
