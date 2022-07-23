import 'DataModel.dart';
import 'parseUtils.dart' show tryParseAsTyped, parseAsTyped, parseList, parseMap;

/// Comment.
class Comment {
  /// Create comment.
  Comment({
    required this.id,
    required this.galleryId,
    required this.poster,
    required this.postDate,
    required this.body,
  }) : super();

  /// Comment ID.
  final int id;
  /// Gallery ID associated with comment.
  final int galleryId;
  /// Comment author.
  final User poster;
  /// Comment post date.
  final DateTime postDate;
  /// Comment content.
  final String body;

  /// Get [body].
  @override
  String toString() => body;

  /// Parse comment from API [json] object.
  static Comment? parse(dynamic json) {
    if(json == null)
      return null;

    return Comment(
      id: parseAsTyped(json?['id']), 
      galleryId: parseAsTyped(json['gallery_id']), 
      poster: parseAsTyped(json['poster']), 
      postDate: DateTime.fromMillisecondsSinceEpoch(parseAsTyped<int>(json?['post_date']) * 1000), 
      body: parseAsTyped(json?['body']),
      );
  }
}
