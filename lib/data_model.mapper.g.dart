import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'src/date_hook.dart';
import 'src/models/book.dart';
import 'src/models/book_images.dart';
import 'src/models/book_title.dart';
import 'src/models/comment.dart';
import 'src/models/image/cover.dart';
import 'src/models/image/cover_thumbnail.dart';
import 'src/models/image/image.dart';
import 'src/models/image/image_type.dart';
import 'src/models/search/search_result.dart';
import 'src/models/tag.dart';
import 'src/models/tag_type.dart';
import 'src/models/tags_list.dart';
import 'src/models/user.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  BookMapper._(),
  BookTitleMapper._(),
  CommentMapper._(),
  CoverMapper._(),
  ImageMapper._(),
  CoverThumbnailMapper._(),
  TagMapper._(),
  UserMapper._(),
  SearchResultMapper._(),
  // enum mappers
  TagTypeMapper._(),
  // custom mappers
  ImageTypeMapper(),
  TagsListMapper(),
  BookImagesMapper(),
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class BookMapper extends BaseMapper<Book> {
  BookMapper._();

  @override Function get decoder => decode;
  Book decode(dynamic v) => const BookHooks().decode(v, (v) => checked(v, (Map<String, dynamic> map) => fromMap(map)));
  Book fromMap(Map<String, dynamic> map) => Book(title: Mapper.i.$get(map, 'title'), id: Mapper.i.$get(map, 'id'), media: Mapper.i.$get(map, 'media_id'), favorites: Mapper.i.$get(map, 'num_favorites'), scanlator: Mapper.i.$getOpt(map, 'scanlator'), uploaded: Mapper.i.$get(map, 'upload_date', const DateHooks()), tags: Mapper.i.$get(map, 'tags'), images: Mapper.i.$get(map, 'images'));

  @override Function get encoder => (Book v) => encode(v);
  dynamic encode(Book v) => const BookHooks().encode<Book>(v, (v) => toMap(v));
  Map<String, dynamic> toMap(Book b) => {'title': Mapper.i.$enc(b.title, 'title'), 'id': Mapper.i.$enc(b.id, 'id'), 'media_id': Mapper.i.$enc(b.media, 'media'), 'num_favorites': Mapper.i.$enc(b.favorites, 'favorites'), 'scanlator': Mapper.i.$enc(b.scanlator, 'scanlator'), 'upload_date': Mapper.i.$enc(b.uploaded, 'uploaded', const DateHooks()), 'tags': Mapper.i.$enc(b.tags, 'tags'), 'images': Mapper.i.$enc(b.images, 'images')};

  @override Function get typeFactory => (f) => f<Book>();
}

extension BookMapperExtension  on Book {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class BookTitleMapper extends BaseMapper<BookTitle> {
  BookTitleMapper._();

  @override Function get decoder => decode;
  BookTitle decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  BookTitle fromMap(Map<String, dynamic> map) => BookTitle(english: Mapper.i.$getOpt(map, 'english'), japanese: Mapper.i.$getOpt(map, 'japanese'), pretty: Mapper.i.$get(map, 'pretty'));

  @override Function get encoder => (BookTitle v) => encode(v);
  dynamic encode(BookTitle v) => toMap(v);
  Map<String, dynamic> toMap(BookTitle b) => {'english': Mapper.i.$enc(b.english, 'english'), 'japanese': Mapper.i.$enc(b.japanese, 'japanese'), 'pretty': Mapper.i.$enc(b.pretty, 'pretty')};

  @override Function get typeFactory => (f) => f<BookTitle>();
}

extension BookTitleMapperExtension  on BookTitle {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class CommentMapper extends BaseMapper<Comment> {
  CommentMapper._();

  @override Function get decoder => decode;
  Comment decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Comment fromMap(Map<String, dynamic> map) => Comment(id: Mapper.i.$get(map, 'id'), bookId: Mapper.i.$get(map, 'gallery_id'), author: Mapper.i.$get(map, 'poster'), date: Mapper.i.$get(map, 'post_date', const DateHooks()), body: Mapper.i.$get(map, 'body'));

  @override Function get encoder => (Comment v) => encode(v);
  dynamic encode(Comment v) => toMap(v);
  Map<String, dynamic> toMap(Comment c) => {'id': Mapper.i.$enc(c.id, 'id'), 'gallery_id': Mapper.i.$enc(c.bookId, 'bookId'), 'poster': Mapper.i.$enc(c.author, 'author'), 'post_date': Mapper.i.$enc(c.date, 'date', const DateHooks()), 'body': Mapper.i.$enc(c.body, 'body')};

  @override Function get typeFactory => (f) => f<Comment>();
}

extension CommentMapperExtension  on Comment {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class CoverMapper extends BaseMapper<Cover> {
  CoverMapper._();

  @override Function get decoder => (v) => const ImageHooks().decode(v, decode);
  Cover decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Cover fromMap(Map<String, dynamic> map) => Cover(media: Mapper.i.$get(map, 'media_id'), type: Mapper.i.$get(map, 't'), width: Mapper.i.$getOpt(map, 'w'), height: Mapper.i.$getOpt(map, 'h'));

  @override Function get encoder => (Cover v) => const ImageHooks().encode<Cover>(v, (v) => encode(v));
  dynamic encode(Cover v) => toMap(v);
  Map<String, dynamic> toMap(Cover c) => {'media_id': Mapper.i.$enc(c.media, 'media'), 't': Mapper.i.$enc(c.type, 'type'), 'w': Mapper.i.$enc(c.width, 'width'), 'h': Mapper.i.$enc(c.height, 'height')};

  @override Function get typeFactory => (f) => f<Cover>();
}

extension CoverMapperExtension  on Cover {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class ImageMapper extends BaseMapper<Image> {
  ImageMapper._();

  @override Function get decoder => decode;
  Image decode(dynamic v) => const ImageHooks().decode(v, (v) => checked(v, (Map<String, dynamic> map) => fromMap(map)));
  Image fromMap(Map<String, dynamic> map) => Image(id: Mapper.i.$get(map, 'id'), media: Mapper.i.$get(map, 'media_id'), type: Mapper.i.$get(map, 't'), width: Mapper.i.$getOpt(map, 'w'), height: Mapper.i.$getOpt(map, 'h'));

  @override Function get encoder => (Image v) => encode(v);
  dynamic encode(Image v) => const ImageHooks().encode<Image>(v, (v) {
    if (v is Cover) { return CoverMapper._().encode(v); }
    else if (v is CoverThumbnail) { return CoverThumbnailMapper._().encode(v); }
    else { return toMap(v); }
  });
  Map<String, dynamic> toMap(Image i) => {'id': Mapper.i.$enc(i.id, 'id'), 'media_id': Mapper.i.$enc(i.media, 'media'), 't': Mapper.i.$enc(i.type, 'type'), 'w': Mapper.i.$enc(i.width, 'width'), 'h': Mapper.i.$enc(i.height, 'height')};

  @override Function get typeFactory => (f) => f<Image>();
}

extension ImageMapperExtension  on Image {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class CoverThumbnailMapper extends BaseMapper<CoverThumbnail> {
  CoverThumbnailMapper._();

  @override Function get decoder => (v) => const ImageHooks().decode(v, decode);
  CoverThumbnail decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CoverThumbnail fromMap(Map<String, dynamic> map) => CoverThumbnail(parent: Mapper.i.$get(map, 'parent'), width: Mapper.i.$getOpt(map, 'w'), height: Mapper.i.$getOpt(map, 'h'));

  @override Function get encoder => (CoverThumbnail v) => const ImageHooks().encode<CoverThumbnail>(v, (v) => encode(v));
  dynamic encode(CoverThumbnail v) => toMap(v);
  Map<String, dynamic> toMap(CoverThumbnail c) => {'parent': Mapper.i.$enc(c.parent, 'parent'), 'w': Mapper.i.$enc(c.width, 'width'), 'h': Mapper.i.$enc(c.height, 'height')};

  @override Function get typeFactory => (f) => f<CoverThumbnail>();
}

extension CoverThumbnailMapperExtension  on CoverThumbnail {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class TagMapper extends BaseMapper<Tag> {
  TagMapper._();

  @override Function get decoder => decode;
  Tag decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Tag fromMap(Map<String, dynamic> map) => Tag(id: Mapper.i.$get(map, 'id'), type: Mapper.i.$get(map, 'type'), name: Mapper.i.$get(map, 'name'), count: Mapper.i.$get(map, 'count'), url: Mapper.i.$get(map, 'url'));

  @override Function get encoder => (Tag v) => encode(v);
  dynamic encode(Tag v) => toMap(v);
  Map<String, dynamic> toMap(Tag t) => {'id': Mapper.i.$enc(t.id, 'id'), 'type': Mapper.i.$enc(t.type, 'type'), 'name': Mapper.i.$enc(t.name, 'name'), 'count': Mapper.i.$enc(t.count, 'count'), 'url': Mapper.i.$enc(t.url, 'url')};

  @override Function get typeFactory => (f) => f<Tag>();
}

extension TagMapperExtension  on Tag {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class UserMapper extends BaseMapper<User> {
  UserMapper._();

  @override Function get decoder => decode;
  User decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  User fromMap(Map<String, dynamic> map) => User(id: Mapper.i.$get(map, 'id'), username: Mapper.i.$get(map, 'username'), slug: Mapper.i.$get(map, 'slug'), avatarFilename: Mapper.i.$get(map, 'avatar_url', const AvatarFilenameHooks()), superuser: Mapper.i.$get(map, 'is_superuser'), staff: Mapper.i.$get(map, 'is_staff'));

  @override Function get encoder => (User v) => encode(v);
  dynamic encode(User v) => toMap(v);
  Map<String, dynamic> toMap(User u) => {'id': Mapper.i.$enc(u.id, 'id'), 'username': Mapper.i.$enc(u.username, 'username'), 'slug': Mapper.i.$enc(u.slug, 'slug'), 'avatar_url': Mapper.i.$enc(u.avatarFilename, 'avatarFilename', const AvatarFilenameHooks()), 'is_superuser': Mapper.i.$enc(u.superuser, 'superuser'), 'is_staff': Mapper.i.$enc(u.staff, 'staff')};

  @override Function get typeFactory => (f) => f<User>();
}

extension UserMapperExtension  on User {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class SearchResultMapper extends BaseMapper<SearchResult> {
  SearchResultMapper._();

  @override Function get decoder => decode;
  SearchResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SearchResult fromMap(Map<String, dynamic> map) => SearchResult(pages: Mapper.i.$get(map, 'num_pages'), perPage: Mapper.i.$get(map, 'per_page'), books: Mapper.i.$get(map, 'result'));

  @override Function get encoder => (SearchResult v) => encode(v);
  dynamic encode(SearchResult v) => toMap(v);
  Map<String, dynamic> toMap(SearchResult s) => {'num_pages': Mapper.i.$enc(s.pages, 'pages'), 'per_page': Mapper.i.$enc(s.perPage, 'perPage'), 'result': Mapper.i.$enc(s.books, 'books')};

  @override Function get typeFactory => (f) => f<SearchResult>();
}

extension SearchResultMapperExtension  on SearchResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

class TagTypeMapper extends EnumMapper<TagType> {
  TagTypeMapper._();

  @override  TagType decode(dynamic value) {
    switch (value) {
      case 'unknown': return TagType.unknown;
      case 'tag': return TagType.tag;
      case 'category': return TagType.category;
      case 'artist': return TagType.artist;
      case 'parody': return TagType.parody;
      case 'character': return TagType.character;
      case 'group': return TagType.group;
      case 'language': return TagType.language;
      default: return TagType.values[0];
    }
  }

  @override  dynamic encode(TagType self) {
    switch (self) {
      case TagType.unknown: return 'unknown';
      case TagType.tag: return 'tag';
      case TagType.category: return 'category';
      case TagType.artist: return 'artist';
      case TagType.parody: return 'parody';
      case TagType.character: return 'character';
      case TagType.group: return 'group';
      case TagType.language: return 'language';
    }
  }
}

extension TagTypeMapperExtension on TagType {
  dynamic toValue() => Mapper.toValue(this);
  @Deprecated('Use \'toValue\' instead')
  String toStringValue() => Mapper.toValue(this) as String;
}


// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
