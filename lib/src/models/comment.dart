import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../date_hook.dart';
import 'user.dart';


/// Comment.
@immutable
@MappableClass()
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
  @MappableField(key: 'id')
  final int id;
  
  /// Book's ID associated with comment.
  @MappableField(key: 'gallery_id')
  final int bookId;
  
  /// Comment author.
  @MappableField(key: 'poster')
  final User author;
  
  /// Comment post date.
  @MappableField(key: 'post_date', hooks: DateHooks())
  final DateTime date;
  
  /// Comment content.
  @MappableField(key: 'body')
  final String body;

  /// Returns comment [body].
  @override
  String toString() => body;
}
