import 'DataModel.dart';

/// Parse object to given type [T] or throw exception if that's not possible.
T parseAsTyped<T>(dynamic object, {
  T? Function(dynamic object)? customParser,
}) {
  final T? value = tryParseAsTyped<T>(object, customParser: customParser);
  if (value == null)
    throw Exception('Parse failed.');
  return value;
}

/// Try parse object to given type [T].
T? tryParseAsTyped<T>(dynamic object, {
  T? Function(dynamic object)? customParser,
}) {
  if (object == null)
    return null;
  if (object is T)
    return object;

  if (customParser != null)
    return customParser(object);

  // Primitives or standard classes
  if (T == Duration) {
    final double? doubleValue = tryParseAsTyped<double>(object);
    if (doubleValue == null)
      return null;
    return Duration(
      milliseconds: (doubleValue * 1000).toInt(),
    ) as T?;
  }
  if (
    T == bool || T == int || T == double ||
    T == Uri || T == DateTime
  ) {
    final String stringValue = tryParseAsTyped<String>(object)!.toLowerCase();
    // Primitives
    if (T == bool)
      return (stringValue != 'false' && stringValue != '0') as T;
    if (T == int)
      return int.tryParse(stringValue) as T?;
    if (T == double)
      return double.tryParse(stringValue) as T?;
    // Standard classes
    if (T == Uri)
      return Uri.tryParse(stringValue) as T?;
    if (T == DateTime)
      return DateTime.tryParse(stringValue) as T?;
  }
  if (T == String)
    return object.toString() as T?;

  // Data classes
  if (T == Book)
    return Book.parse(object) as T?;
  if (T == BookTitle)
    return BookTitle.parse(object) as T?;
  if (T == Tag)
    return Tag.parse(object) as T?;
  if (T == Comment)
    return Comment.parse(object) as T?;
  if (T == User)
    return User.parse(object) as T?;

  // Enums
  if (T == TagType)
    return TagType.values[
      (tryParseAsTyped<int>(object) ?? 0).clamp(0, TagType.values.length - 1)
    ] as T?;

  return null;
}

/// Parse object to list of given type [T] or throw exception if that's not
/// possible.
List<T> parseList<T>(dynamic json, {
  T? Function(dynamic json)? customItemParser,
}) {
  final List<T>? value = tryParseList<T>(
    json,
    customItemParser: customItemParser,
  );
  if (value == null)
    throw Exception('Parse failed.');
  return value;
}

/// Try parse object to list of given type [T].
List<T>? tryParseList<T>(dynamic json, {
  T? Function(dynamic json)? customItemParser,
}) {
  if (json == null)
    return null;
  if (json is List<dynamic>) {
    final List<T> arr = [];
    for (final dynamic element in json) {
      final T? parsedElement = tryParseAsTyped<T>(
        element,
        customParser: customItemParser,
      );
      if (parsedElement != null)
        arr.add(parsedElement);
    }
    return arr;
  }
  return null;
}

/// Try parse object to map of given key type [K] and value type [V] or throw
/// exception if that's not possible.
Map<K, V> parseMap<K, V>(dynamic json, {
  K? Function(dynamic json)? customKeyParser,
  V? Function(dynamic json)? customValueParser,
}) {
  final Map<K, V>? value = tryParseMap<K, V>(
    json,
    customKeyParser: customKeyParser,
    customValueParser: customValueParser,
  );
  if (value == null)
    throw Exception('Parse failed.');
  return value;
}

/// Try parse object to map of given key type [K] and value type [V].
Map<K, V>? tryParseMap<K, V>(dynamic json, {
  K? Function(dynamic json)? customKeyParser,
  V? Function(dynamic json)? customValueParser,
}) {
  if (json == null)
    return null;
  if (json is Map<dynamic, dynamic>) {
    final Map<K, V> map = {};
    json.forEach((dynamic key, dynamic value) {
      final K? parsedKey = tryParseAsTyped<K>(
        key,
        customParser: customKeyParser,
      );
      if (parsedKey != null) {
        final V? parsedValue = tryParseAsTyped<V>(
          value,
          customParser: customValueParser,
        );
        if (parsedValue != null) {
          map[parsedKey] = parsedValue;
        }
      }
    });
    return map;
  }
  return null;
}
