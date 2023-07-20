// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'comment.dart';

class CommentMapper extends ClassMapperBase<Comment> {
  CommentMapper._();

  static CommentMapper? _instance;
  static CommentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentMapper._());
      UserMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Comment';

  static int _$id(Comment v) => v.id;
  static const Field<Comment, int> _f$id = Field('id', _$id);
  static int _$bookId(Comment v) => v.bookId;
  static const Field<Comment, int> _f$bookId =
      Field('bookId', _$bookId, key: 'gallery_id');
  static User _$author(Comment v) => v.author;
  static const Field<Comment, User> _f$author =
      Field('author', _$author, key: 'poster');
  static DateTime _$date(Comment v) => v.date;
  static const Field<Comment, DateTime> _f$date =
      Field('date', _$date, key: 'post_date', hook: DateHook());
  static String _$body(Comment v) => v.body;
  static const Field<Comment, String> _f$body = Field('body', _$body);

  @override
  final Map<Symbol, Field<Comment, dynamic>> fields = const {
    #id: _f$id,
    #bookId: _f$bookId,
    #author: _f$author,
    #date: _f$date,
    #body: _f$body,
  };

  static Comment _instantiate(DecodingData data) {
    return Comment(
        id: data.dec(_f$id),
        bookId: data.dec(_f$bookId),
        author: data.dec(_f$author),
        date: data.dec(_f$date),
        body: data.dec(_f$body));
  }

  @override
  final Function instantiate = _instantiate;

  static Comment fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Comment>(map));
  }

  static Comment fromJson(String json) {
    return _guard((c) => c.fromJson<Comment>(json));
  }
}

mixin CommentMappable {
  String toJson() {
    return CommentMapper._guard((c) => c.toJson(this as Comment));
  }

  Map<String, dynamic> toMap() {
    return CommentMapper._guard((c) => c.toMap(this as Comment));
  }

  @override
  String toString() {
    return CommentMapper._guard((c) => c.asString(this));
  }
}
