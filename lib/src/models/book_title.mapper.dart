// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'book_title.dart';

class BookTitleMapper extends MapperBase<BookTitle> {
  static MapperContainer container = MapperContainer(
    mappers: {BookTitleMapper()},
  );

  @override
  BookTitleMapperElement createElement(MapperContainer container) {
    return BookTitleMapperElement._(this, container);
  }

  @override
  String get id => 'BookTitle';

  static final fromMap = container.fromMap<BookTitle>;
  static final fromJson = container.fromJson<BookTitle>;
}

class BookTitleMapperElement extends MapperElementBase<BookTitle> {
  BookTitleMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  BookTitle decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  BookTitle fromMap(Map<String, dynamic> map) => BookTitle(
      english: container.$getOpt(map, 'english'),
      japanese: container.$getOpt(map, 'japanese'),
      pretty: container.$get(map, 'pretty'));

  @override
  Function get encoder => encode;
  dynamic encode(BookTitle v) => toMap(v);
  Map<String, dynamic> toMap(BookTitle b) => {
        'english': container.$enc(b.english, 'english'),
        'japanese': container.$enc(b.japanese, 'japanese'),
        'pretty': container.$enc(b.pretty, 'pretty')
      };

  @override
  String stringify(BookTitle self) =>
      'BookTitle(english: ${container.asString(self.english)}, japanese: ${container.asString(self.japanese)}, pretty: ${container.asString(self.pretty)})';
}

mixin BookTitleMappable {
  String toJson() => BookTitleMapper.container.toJson(this as BookTitle);
  Map<String, dynamic> toMap() =>
      BookTitleMapper.container.toMap(this as BookTitle);
  @override
  String toString() => BookTitleMapper.container.asString(this);
}
