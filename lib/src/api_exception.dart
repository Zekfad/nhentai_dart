import 'package:meta/meta.dart';


/// API exception as returned from server.
@immutable
class ApiException implements Exception {
  /// Create an API exception.
  const ApiException(this.message);

  /// Exception message.
  final String message;

  /// Exception type with [message].
  @override
  String toString() => 'API Exception: $message';
}
