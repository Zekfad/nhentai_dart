import 'try_parse_function.dart';


/// Parsers map for standard classes.
/// 
/// Each parser in this map accepts a string and returns
/// an object of desired type or null.
const standardClassesParsers = <Type, TryParseFunctionFrom<dynamic, String>>{
  bool    : _parseBool,
  int     : int.tryParse,
  double  : double.tryParse,
  Uri     : Uri.tryParse,
  DateTime: _tryParseDateTimeFromString,
};

/// Parsers map for standard classes.
/// 
/// Each parser in this map accepts a [dynamic] object and returns
/// an object of desired type or null.
const standardClassesParsersDynamic = <Type, TryParseFunction<dynamic>>{
  DateTime: _tryParseDateTime,
};


/// Parses [bool] from a [string] representation.
bool _parseBool(String string) =>
  string != 'false' && string != '0';


/// Parses [DateTime] from a unix timestamp in [int] form.
/// 
/// Returns `null` if data can't be parsed to [DateTime].
DateTime? _tryParseDateTimeFromInt(int timestamp) =>
  DateTime.fromMillisecondsSinceEpoch(
    timestamp * Duration.millisecondsPerSecond,
  );

/// Parses [DateTime] from a unix timestamp in [double] form.
/// 
/// Returns `null` if data can't be parsed to [DateTime].
DateTime? _tryParseDateTimeFromDouble(double timestamp) =>
  DateTime.fromMillisecondsSinceEpoch(
    (timestamp * Duration.millisecondsPerSecond).truncate(),
  );

/// Parses [DateTime] from a unix timestamp in [String] from.
/// 
/// Returns `null` if data can't be parsed to [DateTime].
DateTime? _tryParseDateTimeFromString(String timestamp) {
  final doubleValue = double.tryParse(timestamp);
  return doubleValue == null
    ? null
    : _tryParseDateTimeFromDouble(doubleValue);
}

/// Parses [DateTime] from a unix timestamp.
/// 
/// Returns `null` if data can't be parsed to [DateTime].
DateTime? _tryParseDateTime(dynamic timestamp) {
  switch (timestamp.runtimeType) {
    case int:
      return _tryParseDateTimeFromInt(timestamp as int);
    case double:
      return _tryParseDateTimeFromDouble(timestamp as double);
    case String:
      return _tryParseDateTimeFromString(timestamp as String);
    default:
      return null;
  }
}
