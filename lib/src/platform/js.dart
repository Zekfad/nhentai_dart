import 'package:http/http.dart';


/// Returns whether current platform is web.
bool isJS() => true;

/// Returns whether current platform is desktop/mobile.
bool isIO() => false;

/// Returns platform appropriate [Client].
Client getClient(String userAgent) => Client();

/// Returns HTTP [Client] with proxy configuration.
Client getProxyClient(String proxyUri, String userAgent) {
  throw UnsupportedError('Proxy client is not supported on web.');
}

/// Returns platform User Agent.
String get platformUserAgent => 'DartJS/unknown';
