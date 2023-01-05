import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../../../data_model.dart';

@CustomMapper()
class BookImagesMapper extends SimpleMapper<BookImages> {
  const BookImagesMapper();

  @override
  BookImages decode(dynamic value) {
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
    
    final media = Mapper.fromValue<int>(value['media_id']);
    final cover = Mapper.fromValue<Cover>({
      ..._cover,
      'media_id': media,
    });

    final thumbnail = Mapper.fromValue<CoverThumbnail>({
      ..._thumbnail,
      'parent': cover,
    });

    var pageNo = 1;
    final pages = Mapper.fromIterable<List<Image>>(
      _pages.map((page) {
        if (page is! Map<String, dynamic>)
          throw MapperException.unexpectedType(page.runtimeType, Image, 'Map<String, dynamic>');
      
        return {
          ...page,
          'media_id': media,
          'id': pageNo++,
        };
      }),
    );

    return BookImages(
      media: media,
      cover: cover,
      thumbnail: thumbnail,
      pages: pages,
    );
  }

  @override
  dynamic encode(BookImages self) => {
    'cover': Mapper.toMap(self.cover),
    'thumbnail': Mapper.toMap(self.thumbnail),
    'pages': Mapper.toIterable(self.pages),
  };

}

/// Book's images.
@immutable
class BookImages {
  const BookImages({
    required this.media,
    required this.cover,
    required this.thumbnail,
    required this.pages,
  });

  /// Image associated media id.
  final int media;

  /// Book cover.
  final Cover cover;

  /// Book thumbnail.
  final CoverThumbnail thumbnail;

  /// Book pages.
  final List<Image> pages;
}
