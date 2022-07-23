import 'DataModel.dart';

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
}
