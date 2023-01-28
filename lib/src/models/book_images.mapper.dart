// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'book_images.dart';

class BookImagesMapper extends MapperBase<BookImages> {
  static MapperContainer container = MapperContainer(
    mappers: {BookImagesMapper()},
  )..linkAll({
      CoverMapper.container,
      CoverThumbnailMapper.container,
      ImageMapper.container,
    });

  @override
  BookImagesMapperElement createElement(MapperContainer container) {
    return BookImagesMapperElement._(this, container);
  }

  @override
  String get id => 'BookImages';

  static final fromMap = container.fromMap<BookImages>;
  static final fromJson = container.fromJson<BookImages>;
}

class BookImagesMapperElement extends MapperElementBase<BookImages> {
  BookImagesMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  BookImages decode(dynamic v) => const BookImagesHook().decode(
      v,
      (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
      container);
  BookImages fromMap(Map<String, dynamic> map) => BookImages(
      media: container.$get(map, 'media_id'),
      cover: container.$get(map, 'cover'),
      thumbnail: container.$get(map, 'thumbnail'),
      pages: container.$get(map, 'pages'));

  @override
  Function get encoder => encode;
  dynamic encode(BookImages v) =>
      const BookImagesHook().encode<BookImages>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(BookImages b) => {
        'media_id': container.$enc(b.media, 'media'),
        'cover': container.$enc(b.cover, 'cover'),
        'thumbnail': container.$enc(b.thumbnail, 'thumbnail'),
        'pages': container.$enc(b.pages, 'pages')
      };

  @override
  String stringify(BookImages self) =>
      'BookImages(media: ${container.asString(self.media)}, cover: ${container.asString(self.cover)}, thumbnail: ${container.asString(self.thumbnail)}, pages: ${container.asString(self.pages)})';
}

mixin BookImagesMappable {
  String toJson() => BookImagesMapper.container.toJson(this as BookImages);
  Map<String, dynamic> toMap() =>
      BookImagesMapper.container.toMap(this as BookImages);
  @override
  String toString() => BookImagesMapper.container.asString(this);
}
