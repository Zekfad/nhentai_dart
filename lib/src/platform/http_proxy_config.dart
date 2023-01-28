import 'dart:io';


/// HTTP proxy config.
class HttpProxyConfig {
  /// Creates new HTTP proxy from string [uri].
  /// 
  /// [uri] must be in format of `http://host:port` or
  /// `http://username:password@host:port`.
  HttpProxyConfig(String uri) {
    final _uri = Uri.tryParse(uri);

    if (_uri == null || _uri.scheme != 'http')
      throw ArgumentError.value(uri, 'uri', 'Proxy URI must be valid.');

    this.uri = _uri;

    final _match = RegExp(r'^(?<username>.+?):(?<password>.+?)$')
      .firstMatch(_uri.userInfo);

    username = _match?.namedGroup('username');
    password = _match?.namedGroup('password');
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
