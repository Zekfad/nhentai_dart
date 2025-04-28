// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'search_result.dart';

class SearchResultMapper extends ClassMapperBase<SearchResult> {
  SearchResultMapper._();

  static SearchResultMapper? _instance;
  static SearchResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SearchResultMapper._());
      BookMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SearchResult';

  static int _$pages(SearchResult v) => v.pages;
  static const Field<SearchResult, int> _f$pages =
      Field('pages', _$pages, key: r'num_pages');
  static int _$perPage(SearchResult v) => v.perPage;
  static const Field<SearchResult, int> _f$perPage =
      Field('perPage', _$perPage, key: r'per_page');
  static List<Book> _$books(SearchResult v) => v.books;
  static const Field<SearchResult, List<Book>> _f$books =
      Field('books', _$books, key: r'result');

  @override
  final MappableFields<SearchResult> fields = const {
    #pages: _f$pages,
    #perPage: _f$perPage,
    #books: _f$books,
  };

  static SearchResult _instantiate(DecodingData data) {
    return SearchResult(
        pages: data.dec(_f$pages),
        perPage: data.dec(_f$perPage),
        books: data.dec(_f$books));
  }

  @override
  final Function instantiate = _instantiate;

  static SearchResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SearchResult>(map);
  }

  static SearchResult fromJson(String json) {
    return ensureInitialized().decodeJson<SearchResult>(json);
  }
}

mixin SearchResultMappable {
  String toJson() {
    return SearchResultMapper.ensureInitialized()
        .encodeJson<SearchResult>(this as SearchResult);
  }

  Map<String, dynamic> toMap() {
    return SearchResultMapper.ensureInitialized()
        .encodeMap<SearchResult>(this as SearchResult);
  }

  SearchResultCopyWith<SearchResult, SearchResult, SearchResult> get copyWith =>
      _SearchResultCopyWithImpl<SearchResult, SearchResult>(
          this as SearchResult, $identity, $identity);
  @override
  String toString() {
    return SearchResultMapper.ensureInitialized()
        .stringifyValue(this as SearchResult);
  }
}

extension SearchResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SearchResult, $Out> {
  SearchResultCopyWith<$R, SearchResult, $Out> get $asSearchResult =>
      $base.as((v, t, t2) => _SearchResultCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SearchResultCopyWith<$R, $In extends SearchResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Book, BookCopyWith<$R, Book, Book>> get books;
  $R call({int? pages, int? perPage, List<Book>? books});
  SearchResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SearchResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SearchResult, $Out>
    implements SearchResultCopyWith<$R, SearchResult, $Out> {
  _SearchResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SearchResult> $mapper =
      SearchResultMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Book, BookCopyWith<$R, Book, Book>> get books =>
      ListCopyWith(
          $value.books, (v, t) => v.copyWith.$chain(t), (v) => call(books: v));
  @override
  $R call({int? pages, int? perPage, List<Book>? books}) =>
      $apply(FieldCopyWithData({
        if (pages != null) #pages: pages,
        if (perPage != null) #perPage: perPage,
        if (books != null) #books: books
      }));
  @override
  SearchResult $make(CopyWithData data) => SearchResult(
      pages: data.get(#pages, or: $value.pages),
      perPage: data.get(#perPage, or: $value.perPage),
      books: data.get(#books, or: $value.books));

  @override
  SearchResultCopyWith<$R2, SearchResult, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SearchResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
