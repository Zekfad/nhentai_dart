import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../../../data_model.dart';
import 'image/cover.dart';
import 'image/cover_thumbnail.dart';
import 'image/image.dart';

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
    if(_media is! String)
      throw MapperException.unexpectedType(_media.runtimeType, int, 'String');
    
    final cover = Cover.fromMap({
      ..._cover,
      'media_id': _media,
    });

    var i = 1;
    return {
      ...value,
      'cover': cover,
      'thumbnail': {
        ..._thumbnail,
        'parent': cover,
      },
      'pages': [
        for(final Map<String, dynamic> page in _pages.cast())
          {
            ...page,
            'media_id': _media,
            'id': i++, 
          }
      ]
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
