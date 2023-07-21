@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library _internal_models;

import 'package:dart_mappable/dart_mappable.dart';

export 'models/book.dart' show Book;
export 'models/book_images.dart' show BookImages;
export 'models/book_title.dart' show BookTitle;
export 'models/comment.dart' show Comment;
export 'models/image.dart' show Cover, CoverThumbnail, Image, ImageThumbnail,
  ImageType;
export 'models/search.dart' show Search, SearchQuery, SearchQueryTag,
  SearchQueryTagExtension, SearchQueryText, SearchResult, SearchSort;
export 'models/tag.dart' show Tag;
export 'models/tag_type.dart' show TagType;
export 'models/tags_list_extension.dart' show TagsListExtension;
export 'models/user.dart' show User;
