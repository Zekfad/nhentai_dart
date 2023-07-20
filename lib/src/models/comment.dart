import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import 'date_hook.dart';
import 'mapper_base_container_extension.dart';
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

  /// Parses [Comment] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [Comment] object.
  /// * [Comment] - then value will be returned as-is.
  static Comment Function(dynamic value) get parse =>
    CommentMapper.ensureInitialized().container.fromValue<Comment>;

  /// Parses [List] of [Comment] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [Comment] - then value will be returned as-is.
  static List<Comment> Function(dynamic value) get parseList =>
    CommentMapper.ensureInitialized().container.fromValue<List<Comment>>;

  /// Parses JSON string into [Comment] similarly to [parse]. 
  static Comment Function(String json) get parseJson =>
    CommentMapper.ensureInitialized().container.fromJson<Comment>;

  /// Parses JSON string into [List] of [Comment] instances similarly to 
  /// [parseList].
  static List<Comment> Function(String json) get parseJsonList =>
    CommentMapper.ensureInitialized().container.fromJson<List<Comment>>;
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
