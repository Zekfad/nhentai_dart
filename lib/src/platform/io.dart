import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'http_proxy_config.dart';


/// Returns whether current platform is web.
bool isJS() => false;

/// Returns whether current platform is desktop/mobile.
bool isIO() => true;

/// Returns platform appropriate [Client].
Client getClient(String userAgent) => IOClient(
  HttpClient()
    ..userAgent = userAgent,
);

/// Returns HTTP [Client] with proxy configuration.
Client getProxyClient(String proxyUri, String userAgent) {
  final proxyConfig = HttpProxyConfig(proxyUri);

  final proxyClient = HttpClient()
    ..userAgent = userAgent
    ..findProxy = (uri) => proxyConfig.pacString;

  // Proxy authentication
  if (proxyConfig.hasCredentials)
    proxyClient.addProxyCredentials(
      proxyConfig.host,
      proxyConfig.port,
      'Basic',
      proxyConfig.credentials!,
    );

  return IOClient(proxyClient);
}

/// Returns platform User Agent.
String get platformUserAgent => 'DartVM/${Platform.version.split(' ').first} ('
  '${Platform.operatingSystem}'
')';
