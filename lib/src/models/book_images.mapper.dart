// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'book_images.dart';

class BookImagesMapper extends ClassMapperBase<BookImages> {
  BookImagesMapper._();

  static BookImagesMapper? _instance;
  static BookImagesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BookImagesMapper._());
      CoverMapper.ensureInitialized();
      CoverThumbnailMapper.ensureInitialized();
      ImageMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'BookImages';

  static int _$media(BookImages v) => v.media;
  static const Field<BookImages, int> _f$media =
      Field('media', _$media, key: 'media_id');
  static Cover _$cover(BookImages v) => v.cover;
  static const Field<BookImages, Cover> _f$cover = Field('cover', _$cover);
  static CoverThumbnail _$thumbnail(BookImages v) => v.thumbnail;
  static const Field<BookImages, CoverThumbnail> _f$thumbnail =
      Field('thumbnail', _$thumbnail);
  static List<Image> _$pages(BookImages v) => v.pages;
  static const Field<BookImages, List<Image>> _f$pages =
      Field('pages', _$pages);

  @override
  final Map<Symbol, Field<BookImages, dynamic>> fields = const {
    #media: _f$media,
    #cover: _f$cover,
    #thumbnail: _f$thumbnail,
    #pages: _f$pages,
  };

  @override
  final MappingHook hook = const BookImagesHook();
  static BookImages _instantiate(DecodingData data) {
    return BookImages(
        media: data.dec(_f$media),
        cover: data.dec(_f$cover),
        thumbnail: data.dec(_f$thumbnail),
        pages: data.dec(_f$pages));
  }

  @override
  final Function instantiate = _instantiate;

  static BookImages fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<BookImages>(map));
  }

  static BookImages fromJson(String json) {
    return _guard((c) => c.fromJson<BookImages>(json));
  }
}

mixin BookImagesMappable {
  String toJson() {
    return BookImagesMapper._guard((c) => c.toJson(this as BookImages));
  }

  Map<String, dynamic> toMap() {
    return BookImagesMapper._guard((c) => c.toMap(this as BookImages));
  }

  @override
  String toString() {
    return BookImagesMapper._guard((c) => c.asString(this));
  }
}
