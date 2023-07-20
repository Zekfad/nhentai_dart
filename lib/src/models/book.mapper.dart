// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'book.dart';

class BookMapper extends ClassMapperBase<Book> {
  BookMapper._();

  static BookMapper? _instance;
  static BookMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BookMapper._());
      BookTitleMapper.ensureInitialized();
      TagMapper.ensureInitialized();
      BookImagesMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Book';

  static BookTitle _$title(Book v) => v.title;
  static const Field<Book, BookTitle> _f$title = Field('title', _$title);
  static int _$id(Book v) => v.id;
  static const Field<Book, int> _f$id = Field('id', _$id);
  static int _$media(Book v) => v.media;
  static const Field<Book, int> _f$media =
      Field('media', _$media, key: 'media_id');
  static int _$favorites(Book v) => v.favorites;
  static const Field<Book, int> _f$favorites =
      Field('favorites', _$favorites, key: 'num_favorites');
  static String? _$scanlator(Book v) => v.scanlator;
  static const Field<Book, String> _f$scanlator =
      Field('scanlator', _$scanlator);
  static DateTime _$uploaded(Book v) => v.uploaded;
  static const Field<Book, DateTime> _f$uploaded =
      Field('uploaded', _$uploaded, key: 'upload_date', hook: DateHook());
  static List<Tag> _$tags(Book v) => v.tags;
  static const Field<Book, List<Tag>> _f$tags = Field('tags', _$tags);
  static BookImages _$images(Book v) => v.images;
  static const Field<Book, BookImages> _f$images = Field('images', _$images);

  @override
  final Map<Symbol, Field<Book, dynamic>> fields = const {
    #title: _f$title,
    #id: _f$id,
    #media: _f$media,
    #favorites: _f$favorites,
    #scanlator: _f$scanlator,
    #uploaded: _f$uploaded,
    #tags: _f$tags,
    #images: _f$images,
  };

  @override
  final MappingHook hook = const BookHook();
  static Book _instantiate(DecodingData data) {
    return Book(
        title: data.dec(_f$title),
        id: data.dec(_f$id),
        media: data.dec(_f$media),
        favorites: data.dec(_f$favorites),
        scanlator: data.dec(_f$scanlator),
        uploaded: data.dec(_f$uploaded),
        tags: data.dec(_f$tags),
        images: data.dec(_f$images));
  }

  @override
  final Function instantiate = _instantiate;

  static Book fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Book>(map));
  }

  static Book fromJson(String json) {
    return _guard((c) => c.fromJson<Book>(json));
  }
}

mixin BookMappable {
  String toJson() {
    return BookMapper._guard((c) => c.toJson(this as Book));
  }

  Map<String, dynamic> toMap() {
    return BookMapper._guard((c) => c.toMap(this as Book));
  }

  @override
  String toString() {
    return BookMapper._guard((c) => c.asString(this));
  }
}
