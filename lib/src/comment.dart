import 'package:meta/meta.dart';

import 'parsers.dart' as parsers;
import 'user.dart';


/// Comment.
@immutable
class Comment {
  /// Creates comment.
  const Comment({
    required this.id,
    required this.bookId,
    required this.author,
    required this.date,
    required this.body,
  });

  /// Comment ID.
  final int id;
  /// Book's ID associated with comment.
  final int bookId;
  /// Comment author.
  final User author;
  /// Comment post date.
  final DateTime date;
  /// Comment content.
  final String body;

  /// Returns comment [body].
  @override
  String toString() => body;

  /// Parses comment from API [json] object.
  ///
  /// Returns `null` if [json] can't be parsed to [Comment].
  static Comment? tryParse(dynamic json) {
    if (json == null)
      return null;
    try {
      return Comment.parse(json);
    } on FormatException { // Ignore bad JSON.
      return null;
    }
  }

  /// Parses comment from API [json] object.
  /// 
  /// Throws a [FormatException] if [json] can't be parsed to [Comment].
  // ignore: sort_constructors_first
  factory Comment.parse(dynamic json) =>
    Comment(
      id: parsers.parse(json?['id']), 
      bookId: parsers.parse(json['gallery_id']), 
      author: User.parse(json['poster']), 
      date: parsers.parse(json?['post_date']), 
      body: parsers.parse(json?['body']),
    );
}
