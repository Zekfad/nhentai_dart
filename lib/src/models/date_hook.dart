import 'package:dart_mappable/dart_mappable.dart';

/// Decodes and encodes [DateTime] as [int] with Unix timestamp in seconds.
class DateHook extends MappingHook {
  /// Decodes and encodes [DateTime] as [int] with Unix timestamp in seconds.
  const DateHook();

  @override
  DateTime beforeDecode(dynamic value) => switch(value) {
    int() => DateTime.fromMillisecondsSinceEpoch(
      value * Duration.millisecondsPerSecond,
      isUtc: true,
    ),
    _ => throw MapperException.unexpectedType(value.runtimeType, 'int'),
  };

  @override
  int beforeEncode(dynamic value) => switch(value) {
    DateTime() => value.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond,
    _ => throw MapperException.unexpectedType(value.runtimeType, 'DateTime'),
  };
}
