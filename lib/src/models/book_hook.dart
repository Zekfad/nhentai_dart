import 'package:dart_mappable/dart_mappable.dart';

import 'book.dart';


/// [Book] hook that passes down `media_id` to `images`.
class BookHook extends MappingHook {
  /// [Book] hook that passes down `media_id` to `images`.
  const BookHook();

  @override
  Map<String, dynamic> beforeDecode(dynamic value) => switch(value) {
    <String, dynamic>{
      'images': final Map<String, dynamic> images,
      'media_id': final mediaId,
    } => {
      ...value,
      'images': {
        ...images,
        'media_id': mediaId,
      },
    },
    _ => throw MapperException.unexpectedType(value.runtimeType, 'Map<String, dynamic>')
  };

  @override
  Map<String, dynamic> afterEncode(dynamic value) => switch(value) {
    <String, dynamic>{
      'media_id': final int media,
      'images' : <String, dynamic>{
        'pages': final List<dynamic> pages,
      },
    } => {
      ...value,
      'num_pages': pages.length,
      'media_id': media.toString(),
    },
    final value => throw MapperException.unexpectedType(value.runtimeType, 'Map<String, dynamic>'),
  };
}
