/// HTTP host mixin.
mixin HttpHost {
  /// Host authority.
  /// 
  /// Can be IP address or domain.
  /// Can contain authorization and port number.
  String get authority;
  /// Whether host is requires HTTPS connection.
  bool get ssl;

  /// Returns [Uri] with current host [authority].
  Uri getUri([
    String unencodedPath = '',
    Map<String, dynamic>? queryParameters,
  ]) => (ssl ? Uri.https : Uri.http).call(
    authority,
    unencodedPath,
    queryParameters,
  );
}
