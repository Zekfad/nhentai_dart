import 'package:dart_mappable/dart_mappable.dart';

class DateHook extends MappingHook {
  const DateHook();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is! int)
      throw MapperException.unexpectedType(value.runtimeType, DateTime, 'int');

    return DateTime.fromMillisecondsSinceEpoch(value * Duration.millisecondsPerSecond);
  }

  @override
  dynamic beforeEncode(dynamic value) {
    if (value is! DateTime)
      throw MapperException.unexpectedType(value.runtimeType, int, 'DateTime');

    return value.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
  }
}
