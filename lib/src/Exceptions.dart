/// API exception.
class APIException implements Exception {
  const APIException(this.message) : super();

  /// Exception message.
  final String message;

  /// Exception type with [message].
  @override
  String toString() => 'API Exceptions: $message';

  /// Exception for JSON parsing error.
  static const parseError = APIException('Bad JSON object');

  /// Check if [json] is an API error response and throw corresponding error.
  static void throwIfError(dynamic json) {
    final dynamic error = json?['error'];
    if (error != null) {
      if (error is String)
        throw APIException(error);
      if (error is bool)
        throw APIException('Generic exception.');
    }
  }
}
