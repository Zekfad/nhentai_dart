import 'package:http/http.dart';
import 'package:meta/meta.dart';


/// API client exception.
@immutable
class ApiClientException implements Exception {
  /// Creates new API client exception
  const ApiClientException(this.message, {
    this.response,
    this.originalException,
  });

  /// Exception message.
  final String message;

  /// Request object.
  BaseRequest? get request => response?.request;

  /// Response object.
  final BaseResponse? response;

  /// Original exception (if any).
  final Exception? originalException;

  @override
  String toString() => 'ApiClientException: $message';
}
