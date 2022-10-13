import 'try_parse.dart';
import 'try_parse_function.dart';


/// Parses dynamic [json] into [List] with values of type [T]
/// 
/// Throws a [FormatException] if data can't be parsed.
List<T> parseList<T>(dynamic json, { TryParseFunction<T>? customItemParser, }) {
  final list = tryParseList(json, customItemParser: customItemParser);
  if (list != null)
    return list;
  throw const FormatException('Bad JSON');
}

/// Parses dynamic [json] into [List] with values of type [T]
/// 
/// Returns `null` if data can't be parsed to [List].
List<T>? tryParseList<T>(dynamic json, { TryParseFunction<T>? customItemParser, }) {
  if (json == null)
    return null;
  if (json is List<dynamic>) {
    final list = <T>[];
    for (final element in json) {
      final parsedElement = tryParse(
        element,
        customParser: customItemParser,
      );
      if (parsedElement != null)
        list.add(parsedElement);
    }
    return list;
  }
}
