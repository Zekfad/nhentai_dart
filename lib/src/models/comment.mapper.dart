// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'comment.dart';

class CommentMapper extends MapperBase<Comment> {
  static MapperContainer container = MapperContainer(
    mappers: {CommentMapper()},
  )..linkAll({UserMapper.container});

  @override
  CommentMapperElement createElement(MapperContainer container) {
    return CommentMapperElement._(this, container);
  }

  @override
  String get id => 'Comment';

  static final fromMap = container.fromMap<Comment>;
  static final fromJson = container.fromJson<Comment>;
}

class CommentMapperElement extends MapperElementBase<Comment> {
  CommentMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Comment decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Comment fromMap(Map<String, dynamic> map) => Comment(
      id: container.$get(map, 'id'),
      bookId: container.$get(map, 'gallery_id'),
      author: container.$get(map, 'poster'),
      date: container.$get(map, 'post_date', const DateHook()),
      body: container.$get(map, 'body'));

  @override
  Function get encoder => encode;
  dynamic encode(Comment v) => toMap(v);
  Map<String, dynamic> toMap(Comment c) => {
        'id': container.$enc(c.id, 'id'),
        'gallery_id': container.$enc(c.bookId, 'bookId'),
        'poster': container.$enc(c.author, 'author'),
        'post_date': container.$enc(c.date, 'date', const DateHook()),
        'body': container.$enc(c.body, 'body')
      };

  @override
  String stringify(Comment self) =>
      'Comment(id: ${container.asString(self.id)}, bookId: ${container.asString(self.bookId)}, author: ${container.asString(self.author)}, date: ${container.asString(self.date)}, body: ${container.asString(self.body)})';
}

mixin CommentMappable {
  String toJson() => CommentMapper.container.toJson(this as Comment);
  Map<String, dynamic> toMap() =>
      CommentMapper.container.toMap(this as Comment);
  @override
  String toString() => CommentMapper.container.asString(this);
}
