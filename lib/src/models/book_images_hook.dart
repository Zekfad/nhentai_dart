import 'package:dart_mappable/dart_mappable.dart';

import 'book_images.dart';
import 'image.dart';


/// Parses [BookImages] object, passes down `media_id` and assign relations
/// between thumbnail and cover.
class BookImagesHook extends MappingHook {
  /// Parses [BookImages] object, passes down `media_id` and assign relations
  /// between thumbnail and cover.
  const BookImagesHook();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is! Map<String, dynamic>) {
      throw MapperException.unexpectedType(value.runtimeType, 'Map<String, dynamic>');
    }
    
    final media = switch(value['media_id']) {
      final int media => media,
      final String media => int.parse(media),
      final media => throw MapperException.unexpectedType(media.runtimeType, 'String'),
    };

    final cover = switch(value['cover']) {
      final Cover cover => cover,
      final Map<String, dynamic> cover => Cover.parse({
        ...cover,
        'media_id': media,
      }),
      final cover => throw MapperException.unexpectedType(cover.runtimeType, 'Map<String, dynamic>'),
    };

    final thumbnail = switch(value['thumbnail']) {
      final CoverThumbnail thumbnail => thumbnail,
      final Map<String, dynamic> thumbnail => CoverThumbnail.parse({
        ...thumbnail,
        'parent': cover,
      }),
      final thumbnail => throw MapperException.unexpectedType(thumbnail.runtimeType, 'Map<String, dynamic>'),
    };

    var pageNo = 1;
    final pages = switch(value['pages']) {
      final List<Image> pages => pages,
      final Iterable<dynamic> pages => [
        for (final page in pages)
          switch(page) {
            final Map<String, dynamic> page => Image.parse({
              ...page,
              'media_id': media,
              'id': pageNo++,
            }),
            final page => throw MapperException.unexpectedType(page.runtimeType, 'Map<String, dynamic>')
          },
      ],
      final pages => throw MapperException.unexpectedType(pages.runtimeType, 'Iterable<dynamic>'),
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
