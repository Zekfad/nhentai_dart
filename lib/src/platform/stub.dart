import 'package:http/http.dart';


/// Returns whether current platform is web.
bool isJS() {
  throw UnsupportedError('Stub code is called');
}

/// Returns whether current platform is desktop/mobile.
bool isIO() {
  throw UnsupportedError('Stub code is called');
}

/// Returns platform appropriate [Client].
Client getClient(String userAgent) {
  throw UnsupportedError('Stub code is called');
}

/// Returns HTTP [Client] with proxy configuration.
Client getProxyClient(String proxyUri, String userAgent) {
  throw UnsupportedError('Stub code is called');
}

/// Returns platform User Agent.
String get platformUserAgent {
  throw UnsupportedError('Stub code is called');
}
