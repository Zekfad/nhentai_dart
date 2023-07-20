import 'package:dart_mappable/dart_mappable.dart';

import 'book_images.dart';
import 'image.dart';


/// Parses [BookImages] object, passes down `media_id` and assign relations
/// between thumbnail and cover.
class BookImagesHook extends MappingHook {
  const BookImagesHook();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is! Map<String, dynamic>)
      throw MapperException.unexpectedType(value.runtimeType, 'Map<String, dynamic>');
    
    final media = switch(value['media_id']) {
      final int _media => _media,
      final String _media => int.parse(_media),
      final _media => throw MapperException.unexpectedType(_media.runtimeType, 'String'),
    };

    final cover = switch(value['cover']) {
      final Cover _cover => _cover,
      final Map<String, dynamic> _cover => Cover.parse({
        ..._cover,
        'media_id': media,
      }),
      final _cover => throw MapperException.unexpectedType(_cover.runtimeType, 'Map<String, dynamic>'),
    };

    final thumbnail = switch(value['thumbnail']) {
      final CoverThumbnail _thumbnail => _thumbnail,
      final Map<String, dynamic> _thumbnail => CoverThumbnail.parse({
        ..._thumbnail,
        'parent': cover,
      }),
      final _thumbnail => throw MapperException.unexpectedType(_thumbnail.runtimeType, 'Map<String, dynamic>'),
    };

    var pageNo = 1;
    final pages = switch(value['pages']) {
      final List<Image> _pages => _pages,
      final Iterable<dynamic> _pages => [
        for (final page in _pages)
          switch(page) {
            final Map<String, dynamic> _page => Image.parse({
              ..._page,
              'media_id': media,
              'id': pageNo++,
            }),
            final _page => throw MapperException.unexpectedType(_page.runtimeType, 'Map<String, dynamic>')
          },
      ],
      final _pages => throw MapperException.unexpectedType(_pages.runtimeType, 'Iterable<dynamic>'),
    };

    return BookImages(
      media: media, 
      cover: cover, 
      thumbnail: thumbnail, 
      pages: pages,
    );
  }

  @override
  Map<String, dynamic>? afterEncode(dynamic value) => switch(value) {
    final Map<String, dynamic> value => value..remove('media_id'),
    final value => throw MapperException.unexpectedType(value.runtimeType, 'Map<String, dynamic>'),
  };
}
