import 'package:meta/meta.dart';


/// API exception.
@immutable
class APIException implements Exception {
  /// Create an API exception.
  const APIException(this.message);

  /// Exception message.
  final String message;

  /// Exception type with [message].
  @override
  String toString() => 'API Exception: $message';
}
