// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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
  final MappableFields<Comment> fields = const {
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
    return ensureInitialized().decodeMap<Comment>(map);
  }

  static Comment fromJson(String json) {
    return ensureInitialized().decodeJson<Comment>(json);
  }
}

mixin CommentMappable {
  String toJson() {
    return CommentMapper.ensureInitialized()
        .encodeJson<Comment>(this as Comment);
  }

  Map<String, dynamic> toMap() {
    return CommentMapper.ensureInitialized()
        .encodeMap<Comment>(this as Comment);
  }

  CommentCopyWith<Comment, Comment, Comment> get copyWith =>
      _CommentCopyWithImpl(this as Comment, $identity, $identity);
  @override
  String toString() {
    return CommentMapper.ensureInitialized().stringifyValue(this as Comment);
  }
}

extension CommentValueCopy<$R, $Out> on ObjectCopyWith<$R, Comment, $Out> {
  CommentCopyWith<$R, Comment, $Out> get $asComment =>
      $base.as((v, t, t2) => _CommentCopyWithImpl(v, t, t2));
}

abstract class CommentCopyWith<$R, $In extends Comment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get author;
  $R call({int? id, int? bookId, User? author, DateTime? date, String? body});
  CommentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Comment, $Out>
    implements CommentCopyWith<$R, Comment, $Out> {
  _CommentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Comment> $mapper =
      CommentMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get author =>
      $value.author.copyWith.$chain((v) => call(author: v));
  @override
  $R call({int? id, int? bookId, User? author, DateTime? date, String? body}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (bookId != null) #bookId: bookId,
        if (author != null) #author: author,
        if (date != null) #date: date,
        if (body != null) #body: body
      }));
  @override
  Comment $make(CopyWithData data) => Comment(
      id: data.get(#id, or: $value.id),
      bookId: data.get(#bookId, or: $value.bookId),
      author: data.get(#author, or: $value.author),
      date: data.get(#date, or: $value.date),
      body: data.get(#body, or: $value.body));

  @override
  CommentCopyWith<$R2, Comment, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CommentCopyWithImpl($value, $cast, t);
}
