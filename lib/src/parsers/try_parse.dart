import 'model_parsers.dart';
import 'standard_classes_parsers.dart';
import 'try_parse_function.dart';


/// Parses dynamic [object] into object of type [T].
/// 
/// Throws a [FormatException] if data can't be parsed to [T].
T parse<T>(dynamic object, { TryParseFunction<T>? customParser, }) {
  final result = tryParse<T>(object);
  if (result != null)
    return result;
  throw const FormatException('Bad object passed to parse.');
}

/// Parses dynamic [object] into object of type [T].
/// 
/// Returns `null` if data can't be parsed to [T].
T? tryParse<T>(dynamic object, { TryParseFunction<T>? customParser, }) {
  if (object == null)
    return null;

  if (object is T)
    return object;

  if (customParser != null)
    return customParser(object);

  if (T == String)
    return object.toString() as T?;

  // Try to use parsers for strings
  if (object is String && standardClassesParsers.containsKey(T)) {
    return (standardClassesParsers[T]! as TryParseFunctionFrom<T, String>).call(object);
  }

  // Try to use dynamic parsers
  if (standardClassesParsersDynamic.containsKey(T)) {
    return (standardClassesParsersDynamic[T]! as TryParseFunction<T>).call(object);
  }

  // Try to use model parsers
  if (modelParsers.containsKey(T))
    return (modelParsers[T]! as TryParseFunction<T>).call(object);

  return null;
}
