// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'book_title.dart';

class BookTitleMapper extends ClassMapperBase<BookTitle> {
  BookTitleMapper._();

  static BookTitleMapper? _instance;
  static BookTitleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BookTitleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BookTitle';

  static String? _$english(BookTitle v) => v.english;
  static const Field<BookTitle, String> _f$english =
      Field('english', _$english);
  static String? _$japanese(BookTitle v) => v.japanese;
  static const Field<BookTitle, String> _f$japanese =
      Field('japanese', _$japanese);
  static String _$pretty(BookTitle v) => v.pretty;
  static const Field<BookTitle, String> _f$pretty = Field('pretty', _$pretty);

  @override
  final MappableFields<BookTitle> fields = const {
    #english: _f$english,
    #japanese: _f$japanese,
    #pretty: _f$pretty,
  };

  static BookTitle _instantiate(DecodingData data) {
    return BookTitle(
        english: data.dec(_f$english),
        japanese: data.dec(_f$japanese),
        pretty: data.dec(_f$pretty));
  }

  @override
  final Function instantiate = _instantiate;

  static BookTitle fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BookTitle>(map);
  }

  static BookTitle fromJson(String json) {
    return ensureInitialized().decodeJson<BookTitle>(json);
  }
}

mixin BookTitleMappable {
  String toJson() {
    return BookTitleMapper.ensureInitialized()
        .encodeJson<BookTitle>(this as BookTitle);
  }

  Map<String, dynamic> toMap() {
    return BookTitleMapper.ensureInitialized()
        .encodeMap<BookTitle>(this as BookTitle);
  }

  BookTitleCopyWith<BookTitle, BookTitle, BookTitle> get copyWith =>
      _BookTitleCopyWithImpl(this as BookTitle, $identity, $identity);
  @override
  String toString() {
    return BookTitleMapper.ensureInitialized()
        .stringifyValue(this as BookTitle);
  }
}

extension BookTitleValueCopy<$R, $Out> on ObjectCopyWith<$R, BookTitle, $Out> {
  BookTitleCopyWith<$R, BookTitle, $Out> get $asBookTitle =>
      $base.as((v, t, t2) => _BookTitleCopyWithImpl(v, t, t2));
}

abstract class BookTitleCopyWith<$R, $In extends BookTitle, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? english, String? japanese, String? pretty});
  BookTitleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BookTitleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BookTitle, $Out>
    implements BookTitleCopyWith<$R, BookTitle, $Out> {
  _BookTitleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BookTitle> $mapper =
      BookTitleMapper.ensureInitialized();
  @override
  $R call(
          {Object? english = $none,
          Object? japanese = $none,
          String? pretty}) =>
      $apply(FieldCopyWithData({
        if (english != $none) #english: english,
        if (japanese != $none) #japanese: japanese,
        if (pretty != null) #pretty: pretty
      }));
  @override
  BookTitle $make(CopyWithData data) => BookTitle(
      english: data.get(#english, or: $value.english),
      japanese: data.get(#japanese, or: $value.japanese),
      pretty: data.get(#pretty, or: $value.pretty));

  @override
  BookTitleCopyWith<$R2, BookTitle, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BookTitleCopyWithImpl($value, $cast, t);
}
