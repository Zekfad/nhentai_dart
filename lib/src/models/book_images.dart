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
    
    final _cover = value['cover'];
    if (_cover is! Map<String, dynamic>)
      throw MapperException.unexpectedType(_cover.runtimeType, Cover, 'Map<String, dynamic>');
    
    final _thumbnail = value['thumbnail'];
    if (_thumbnail is! Map<String, dynamic>)
      throw MapperException.unexpectedType(_thumbnail.runtimeType, CoverThumbnail, 'Map<String, dynamic>');
  
    final _pages = value['pages'];
    if (_pages is! Iterable<dynamic>)
      throw MapperException.unexpectedType(_pages.runtimeType, List<Image>, 'Iterable<dynamic>');
    
    final _media = value['media_id'];
    if (_media is! String && _media is! int)
      throw MapperException.unexpectedType(_media.runtimeType, int, 'String | int');
    
    final cover = Cover.parse({
      ..._cover,
      'media_id': _media,
    });

		var i = 0;
		final pages = [
			for (final page in _pages)
				if (page is! Map<String, dynamic>)
					throw MapperException.unexpectedType(page.runtimeType, Image, 'Map<String, dynamic>')
				else {
					...page,
					'media_id': _media,
					'id': i++, 
				},
		];

    return {
      ...value,
      'cover': cover,
      'thumbnail': {
        ..._thumbnail,
        'parent': cover,
      },
      'pages': pages,
    };
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
