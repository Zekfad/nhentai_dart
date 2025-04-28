// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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

  @override
  final String id = 'Book';

  static BookTitle _$title(Book v) => v.title;
  static const Field<Book, BookTitle> _f$title = Field('title', _$title);
  static int _$id(Book v) => v.id;
  static const Field<Book, int> _f$id = Field('id', _$id);
  static int _$media(Book v) => v.media;
  static const Field<Book, int> _f$media =
      Field('media', _$media, key: r'media_id');
  static int _$favorites(Book v) => v.favorites;
  static const Field<Book, int> _f$favorites =
      Field('favorites', _$favorites, key: r'num_favorites');
  static String? _$scanlator(Book v) => v.scanlator;
  static const Field<Book, String> _f$scanlator =
      Field('scanlator', _$scanlator);
  static DateTime _$uploaded(Book v) => v.uploaded;
  static const Field<Book, DateTime> _f$uploaded =
      Field('uploaded', _$uploaded, key: r'upload_date', hook: DateHook());
  static List<Tag> _$tags(Book v) => v.tags;
  static const Field<Book, List<Tag>> _f$tags = Field('tags', _$tags);
  static BookImages _$images(Book v) => v.images;
  static const Field<Book, BookImages> _f$images = Field('images', _$images);

  @override
  final MappableFields<Book> fields = const {
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
    return ensureInitialized().decodeMap<Book>(map);
  }

  static Book fromJson(String json) {
    return ensureInitialized().decodeJson<Book>(json);
  }
}

mixin BookMappable {
  String toJson() {
    return BookMapper.ensureInitialized().encodeJson<Book>(this as Book);
  }

  Map<String, dynamic> toMap() {
    return BookMapper.ensureInitialized().encodeMap<Book>(this as Book);
  }

  BookCopyWith<Book, Book, Book> get copyWith =>
      _BookCopyWithImpl<Book, Book>(this as Book, $identity, $identity);
  @override
  String toString() {
    return BookMapper.ensureInitialized().stringifyValue(this as Book);
  }
}

extension BookValueCopy<$R, $Out> on ObjectCopyWith<$R, Book, $Out> {
  BookCopyWith<$R, Book, $Out> get $asBook =>
      $base.as((v, t, t2) => _BookCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BookCopyWith<$R, $In extends Book, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  BookTitleCopyWith<$R, BookTitle, BookTitle> get title;
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags;
  BookImagesCopyWith<$R, BookImages, BookImages> get images;
  $R call(
      {BookTitle? title,
      int? id,
      int? media,
      int? favorites,
      String? scanlator,
      DateTime? uploaded,
      List<Tag>? tags,
      BookImages? images});
  BookCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BookCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Book, $Out>
    implements BookCopyWith<$R, Book, $Out> {
  _BookCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Book> $mapper = BookMapper.ensureInitialized();
  @override
  BookTitleCopyWith<$R, BookTitle, BookTitle> get title =>
      $value.title.copyWith.$chain((v) => call(title: v));
  @override
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags => ListCopyWith(
      $value.tags, (v, t) => v.copyWith.$chain(t), (v) => call(tags: v));
  @override
  BookImagesCopyWith<$R, BookImages, BookImages> get images =>
      $value.images.copyWith.$chain((v) => call(images: v));
  @override
  $R call(
          {BookTitle? title,
          int? id,
          int? media,
          int? favorites,
          Object? scanlator = $none,
          DateTime? uploaded,
          List<Tag>? tags,
          BookImages? images}) =>
      $apply(FieldCopyWithData({
        if (title != null) #title: title,
        if (id != null) #id: id,
        if (media != null) #media: media,
        if (favorites != null) #favorites: favorites,
        if (scanlator != $none) #scanlator: scanlator,
        if (uploaded != null) #uploaded: uploaded,
        if (tags != null) #tags: tags,
        if (images != null) #images: images
      }));
  @override
  Book $make(CopyWithData data) => Book(
      title: data.get(#title, or: $value.title),
      id: data.get(#id, or: $value.id),
      media: data.get(#media, or: $value.media),
      favorites: data.get(#favorites, or: $value.favorites),
      scanlator: data.get(#scanlator, or: $value.scanlator),
      uploaded: data.get(#uploaded, or: $value.uploaded),
      tags: data.get(#tags, or: $value.tags),
      images: data.get(#images, or: $value.images));

  @override
  BookCopyWith<$R2, Book, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BookCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
