// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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
  final MappableFields<BookImages> fields = const {
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
    return ensureInitialized().decodeMap<BookImages>(map);
  }

  static BookImages fromJson(String json) {
    return ensureInitialized().decodeJson<BookImages>(json);
  }
}

mixin BookImagesMappable {
  String toJson() {
    return BookImagesMapper.ensureInitialized()
        .encodeJson<BookImages>(this as BookImages);
  }

  Map<String, dynamic> toMap() {
    return BookImagesMapper.ensureInitialized()
        .encodeMap<BookImages>(this as BookImages);
  }

  BookImagesCopyWith<BookImages, BookImages, BookImages> get copyWith =>
      _BookImagesCopyWithImpl(this as BookImages, $identity, $identity);
  @override
  String toString() {
    return BookImagesMapper.ensureInitialized()
        .stringifyValue(this as BookImages);
  }
}

extension BookImagesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BookImages, $Out> {
  BookImagesCopyWith<$R, BookImages, $Out> get $asBookImages =>
      $base.as((v, t, t2) => _BookImagesCopyWithImpl(v, t, t2));
}

abstract class BookImagesCopyWith<$R, $In extends BookImages, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CoverCopyWith<$R, Cover, Cover> get cover;
  CoverThumbnailCopyWith<$R, CoverThumbnail, CoverThumbnail> get thumbnail;
  ListCopyWith<$R, Image, ImageCopyWith<$R, Image, Image>> get pages;
  $R call(
      {int? media,
      Cover? cover,
      CoverThumbnail? thumbnail,
      List<Image>? pages});
  BookImagesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BookImagesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BookImages, $Out>
    implements BookImagesCopyWith<$R, BookImages, $Out> {
  _BookImagesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BookImages> $mapper =
      BookImagesMapper.ensureInitialized();
  @override
  CoverCopyWith<$R, Cover, Cover> get cover =>
      $value.cover.copyWith.$chain((v) => call(cover: v));
  @override
  CoverThumbnailCopyWith<$R, CoverThumbnail, CoverThumbnail> get thumbnail =>
      $value.thumbnail.copyWith.$chain((v) => call(thumbnail: v));
  @override
  ListCopyWith<$R, Image, ImageCopyWith<$R, Image, Image>> get pages =>
      ListCopyWith(
          $value.pages, (v, t) => v.copyWith.$chain(t), (v) => call(pages: v));
  @override
  $R call(
          {int? media,
          Cover? cover,
          CoverThumbnail? thumbnail,
          List<Image>? pages}) =>
      $apply(FieldCopyWithData({
        if (media != null) #media: media,
        if (cover != null) #cover: cover,
        if (thumbnail != null) #thumbnail: thumbnail,
        if (pages != null) #pages: pages
      }));
  @override
  BookImages $make(CopyWithData data) => BookImages(
      media: data.get(#media, or: $value.media),
      cover: data.get(#cover, or: $value.cover),
      thumbnail: data.get(#thumbnail, or: $value.thumbnail),
      pages: data.get(#pages, or: $value.pages));

  @override
  BookImagesCopyWith<$R2, BookImages, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BookImagesCopyWithImpl($value, $cast, t);
}
