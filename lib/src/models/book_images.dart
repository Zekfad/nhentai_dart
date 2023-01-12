import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../../../data_model.dart';
import 'image/image_model.dart';

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
    
    final _media = value['media_id'];
    if(_media is! String)
      throw MapperException.unexpectedType(_media.runtimeType, int, 'String');

    final media = int.parse(_media);
    final cover = Cover(
      ImageModelMapper.fromMap({
        ..._cover,
        'media_id': media,
        'id': 0,
      }),
    );

    final thumbnail = CoverThumbnail(
      parent: cover,
      ImageModelMapper.fromMap({
        ..._cover,
        'media_id': media,
        'id': 0,
      }), 
    );

    var pageNo = 1;
    final pages = _pages.map((page) {
      if (page is! Map<String, dynamic>)
        throw MapperException.unexpectedType(page.runtimeType, Image, 'Map<String, dynamic>');
    
      return Image(
        ImageModel.fromMap({
          ...page,
          'media_id': media,
          'id': pageNo++,
        }),
      );
    }).toList();

    return BookImages(
      media: media,
      cover: cover,
      thumbnail: thumbnail,
      pages: pages,
    );
  }

  @override
  dynamic encode(BookImages self) => {
    'cover': self.cover.toMap(),
    'thumbnail': self.cover.toMap(),
    'pages': self.pages.map((page) => page.toMap()).toList(),
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
