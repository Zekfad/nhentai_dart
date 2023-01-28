// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'book.dart';

class BookMapper extends MapperBase<Book> {
  static MapperContainer container = MapperContainer(
    mappers: {BookMapper()},
  )..linkAll({
      BookTitleMapper.container,
      TagMapper.container,
      BookImagesMapper.container,
    });

  @override
  BookMapperElement createElement(MapperContainer container) {
    return BookMapperElement._(this, container);
  }

  @override
  String get id => 'Book';

  static final fromMap = container.fromMap<Book>;
  static final fromJson = container.fromJson<Book>;
}

class BookMapperElement extends MapperElementBase<Book> {
  BookMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Book decode(dynamic v) => const BookHook().decode(
      v,
      (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
      container);
  Book fromMap(Map<String, dynamic> map) => Book(
      title: container.$get(map, 'title'),
      id: container.$get(map, 'id'),
      media: container.$get(map, 'media_id'),
      favorites: container.$get(map, 'num_favorites'),
      scanlator: container.$getOpt(map, 'scanlator'),
      uploaded: container.$get(map, 'upload_date', const DateHook()),
      tags: container.$get(map, 'tags'),
      images: container.$get(map, 'images'));

  @override
  Function get encoder => encode;
  dynamic encode(Book v) =>
      const BookHook().encode<Book>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(Book b) => {
        'title': container.$enc(b.title, 'title'),
        'id': container.$enc(b.id, 'id'),
        'media_id': container.$enc(b.media, 'media'),
        'num_favorites': container.$enc(b.favorites, 'favorites'),
        'scanlator': container.$enc(b.scanlator, 'scanlator'),
        'upload_date': container.$enc(b.uploaded, 'uploaded', const DateHook()),
        'tags': container.$enc(b.tags, 'tags'),
        'images': container.$enc(b.images, 'images')
      };

  @override
  String stringify(Book self) =>
      'Book(title: ${container.asString(self.title)}, id: ${container.asString(self.id)}, media: ${container.asString(self.media)}, favorites: ${container.asString(self.favorites)}, scanlator: ${container.asString(self.scanlator)}, uploaded: ${container.asString(self.uploaded)}, tags: ${container.asString(self.tags)}, images: ${container.asString(self.images)})';
}

mixin BookMappable {
  String toJson() => BookMapper.container.toJson(this as Book);
  Map<String, dynamic> toMap() => BookMapper.container.toMap(this as Book);
  @override
  String toString() => BookMapper.container.asString(this);
}
