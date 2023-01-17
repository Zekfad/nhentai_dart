import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import 'images/cover.dart';
import 'images/cover_thumbnail.dart';
import 'images/image.dart';

part 'book_images.mapper.dart';


class BookImagesHook extends MappingHook {
  const BookImagesHook();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is! Map<String, dynamic>)
      throw MapperException.unexpectedType(value.runtimeType, BookImages, 'Map<String, dynamic>');
    
    final int media;
    final _media = value['media_id'];
    if (_media is int)
      media = _media;
    else if (_media is String)
      media = int.parse(_media);
    else 
      throw MapperException.unexpectedType(_media.runtimeType, int, 'String');
    
    final Cover cover;
    final _cover = value['cover'];
    if (_cover is Cover)
      cover = _cover;
    else if (_cover is Map<String, dynamic>)
      cover = Cover.parse({
        ..._cover,
        'media_id': media,
      });
    else
      throw MapperException.unexpectedType(_cover.runtimeType, Cover, 'Map<String, dynamic>');

    final CoverThumbnail thumbnail;
    final _thumbnail = value['thumbnail'];
    if (_thumbnail is CoverThumbnail)
      thumbnail = _thumbnail;
    else if (_thumbnail is Map<String, dynamic>)
      thumbnail = CoverThumbnail.parse({
        ..._thumbnail,
        'parent': cover,
      });
    else
      throw MapperException.unexpectedType(_thumbnail.runtimeType, CoverThumbnail, 'Map<String, dynamic>');
  
    var i = 1;
    final List<Image> pages;
    final _pages = value['pages'];
    if(_pages is List<Image>)
      pages = _pages;
    else if(_pages is Iterable<dynamic>)
      pages = [
        for (final page in _pages)
          if (page is! Map<String, dynamic>)
            throw MapperException.unexpectedType(page.runtimeType, Image, 'Map<String, dynamic>')
          else Image.parse({
            ...page,
            'media_id': _media,
            'id': i++, 
          }),
      ];
    else
      throw MapperException.unexpectedType(_pages.runtimeType, List<Image>, 'Iterable<dynamic>');

    return BookImages(
      media: media, 
      cover: cover, 
      thumbnail: thumbnail, 
      pages: pages,
    );
  }
}

/// Book's images.
@immutable
@MappableClass(
  hook: BookImagesHook(),
)
class BookImages with BookImagesMappable {
  const BookImages({
    required this.media,
    required this.cover,
    required this.thumbnail,
    required this.pages,
  });

  /// Parses [BookImages] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [BookImages] object.
  /// * [BookImages] - then value will be returned as-is.
  static BookImages Function(dynamic value) get parse =>
    BookImagesMapper.container.fromValue<BookImages>;

  /// Parses [List] of [BookImages] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [BookImages] - then value will be returned as-is.
  static List<BookImages> Function(dynamic value) get parseList =>
    BookImagesMapper.container.fromValue<List<BookImages>>;

  /// Parses JSON string into [BookImages] similarly to [parse]. 
  static BookImages Function(String json) get parseJson =>
    BookImagesMapper.container.fromJson<BookImages>;

  /// Parses JSON string into [List] of [BookImages] instances similarly to 
  /// [parseList].
  static List<BookImages> Function(String json) get parseJsonList =>
    BookImagesMapper.container.fromJson<List<BookImages>>;

  /// Image associated media id.
  @MappableField(key: 'media_id')
  final int media;

  /// Book cover.
  @MappableField(key: 'cover')
  final Cover cover;

  /// Book thumbnail.
  @MappableField(key: 'thumbnail')
  final CoverThumbnail thumbnail;

  /// Book pages.
  @MappableField(key: 'pages')
  final List<Image> pages;
}
