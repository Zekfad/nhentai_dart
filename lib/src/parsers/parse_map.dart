import 'try_parse.dart';
import 'try_parse_function.dart';

/// Parses dynamic [json] into [Map] with keys of type [K]
/// and values of type [V].
/// 
/// Throws a [FormatException] if data can't be parsed.
Map<K, V> parseMap<K, V>(dynamic json, {
  TryParseFunction<K>? customKeyParser,
  TryParseFunction<V>? customValueParser,
}) {
  final map = tryParseMap<K, V>(
    json,
    customKeyParser: customKeyParser,
    customValueParser: customValueParser,
  );
  if (map != null)
    return map;
  throw const FormatException('Bad JSON');
}

/// Parses dynamic [json] into [Map] with keys of type [K]
/// and values of type [V].
///
/// Returns `null` if data can't be parsed to [Map].
Map<K, V>? tryParseMap<K, V>(dynamic json, {
  TryParseFunction<K>? customKeyParser,
  TryParseFunction<V>? customValueParser,
}) {
  if (json == null)
    return null;
  if (json is Map<dynamic, dynamic>) {
    final map = <K, V>{};
    for (final entry in json.entries) {
      final parsedKey = tryParse<K>(
        entry.key,
        customParser: customKeyParser,
      );
      if (parsedKey != null) {
        final parsedValue = tryParse<V>(
          entry.value,
          customParser: customValueParser,
        );
        if (parsedValue != null)
          map[parsedKey] = parsedValue;
      }
    }
    return map;
  }
}
