import 'DataModel.dart';
import 'parseUtils.dart' show parseAsTyped;

/// Comment.
class Comment {
  /// Create comment.
  const Comment({
    required this.id,
    required this.bookId,
    required this.author,
    required this.date,
    required this.body,
  }) : super();

  /// Comment ID.
  final int id;
  /// Book ID associated with comment.
  final int bookId;
  /// Comment author.
  final User author;
  /// Comment post date.
  final DateTime date;
  /// Comment content.
  final String body;

  /// Get comment [body].
  @override
  String toString() => body;

  /// Parse comment from API [json] object.
  static Comment? parse(dynamic json) {
    if (json == null)
      return null;
    return Comment(
      id: parseAsTyped(json?['id']), 
      bookId: parseAsTyped(json['gallery_id']), 
      author: parseAsTyped(json['poster']), 
      date: DateTime.fromMillisecondsSinceEpoch(parseAsTyped<int>(json?['post_date']) * 1000), 
      body: parseAsTyped(json?['body']),
      );
  }
}
