
import '../models.dart';
import 'try_parse_function.dart';


/// Parsers map for models.
/// 
/// Each parser in this map accepts a [dynamic] object and returns
/// an object of desired type or null.
const modelParsers = <Type, TryParseFunction<dynamic>>{
  Book: Book.tryParse,
  BookTitle: BookTitle.tryParse,
  Tag: Tag.tryParse,
  Comment: Comment.tryParse,
  User: User.tryParse,
};
