import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../date_hook.dart';
import 'user.dart';

part 'comment.mapper.dart';


/// Comment.
@immutable
@MappableClass()
class Comment with CommentMappable {
  /// Creates comment.
  const Comment({
    required this.id,
    required this.bookId,
    required this.author,
    required this.date,
    required this.body,
  });

  static final fromMap = CommentMapper.fromMap;
  static final fromJson = CommentMapper.fromJson;

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
  @MappableField(key: 'post_date', hook: DateHook())
  final DateTime date;
  
  /// Comment content.
  @MappableField(key: 'body')
  final String body;

  /// Returns comment [body].
  @override
  String toString() => body;
}
