import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart' show MapperContainer;
import 'package:http/http.dart' show Client, Request, Response;
import 'package:http/retry.dart';
import 'package:meta/meta.dart';

import 'api.dart';

import 'api_client_exception.dart';
import 'api_exception.dart';
import 'hosts.dart';
import 'models.dart';
import 'models.init.dart';
import 'platform.dart' as platform;


/// API client implementation that uses restful API.
@immutable
class ApiRestfulImplementation extends API {
  /// Creates API client.
  /// 
  /// {@macro api_default_constructor_arguments}
  /// {@macro api_constructor_shared_arguments}
  ApiRestfulImplementation({
    Client? client,
    this.hosts = const Hosts(),
    this.beforeRequest,
    int maxRetries = 5,
    String? userAgent,
  }) :
    client = client ?? RetryClient(
      platform.getClient(userAgent ?? API.defaultUserAgent),
      retries: maxRetries,
    ),
    super.internal() {
    initializeMappers();
  }

  /// Creates API client with provided proxy config.
  /// 
  /// {@macro api_constructor_shared_arguments}
  /// {@macro api_proxy_constructor_arguments}
  /// 
  /// {@macro api_proxy_constructor_throws}
  ApiRestfulImplementation.proxy(String proxyUri, {
    this.hosts = const Hosts(),
    this.beforeRequest,
    int maxRetries = 5,
    String? userAgent,
  }) :
    client = RetryClient(
      platform.getProxyClient(proxyUri, userAgent ?? API.defaultUserAgent),
      retries: maxRetries,
    ),
    super.internal() {
    initializeMappers();
  }

  /// [Client] used for requests.
  @override
  final Client client;

  /// Hosts settings.
  @override
  final Hosts hosts;

  /// Before request callback. Used to pre process requests. 
  @override
  final BeforeRequestCallback? beforeRequest;

  /// Makes HTTP GET request to [uri] and parses response to JSON.
  /// 
  /// Throws [ApiException] if parsed json is an API error.
  /// 
  /// Throws [ApiClientException] if server responded with not a JSON.
  Future<dynamic> _getJson(Uri uri) async {
    final request = Request('GET', uri);
    beforeRequest?.call(request);
    final response = await Response.fromStream(await client.send(request));
    final dynamic json;
    try {
      json = jsonDecode(response.body);
    } on FormatException catch (exception) {
      throw ApiClientException(
        'Bad response type.',
        response: response,
        originalException: exception,
      );
    }

    final jsonError = json is! Map<String, dynamic> ? null
      : json['error'];

    if (jsonError != null) {
      if (jsonError is String) {
        throw ApiException(jsonError);
      }
      if (jsonError is bool) {
        // API can return `{"error":true}` with no info.
        throw const ApiException('Generic API exception.');
      }
    }

    return json;
  }
  
  /// Makes HTTP GET request to [url] and returns redirect location.
  /// 
  /// Returns `null` if there was no redirect.
  /// 
  /// Note: doesn't work on web.
  Future<String?> _getRedirectUrl(Uri url) async {
    final request = Request('GET', url)
      ..followRedirects = false;
    final response = await client.send(request);
    return response.headers['location'];
  }

  /// Makes HTTP GET request to [host]/[unencodedPath] and parses JSON response
  /// into requested model.
  /// 
  /// {@macro api_throws}
  Future<T> _getModel<T>(String unencodedPath, {
    Map<String, dynamic>? queryParameters,
    Host? host,
  }) async {
    final json = await _getJson(
      (host ?? hosts.api).getUri(
        unencodedPath,
        queryParameters,
      ),
    );
    return MapperContainer.globals.fromValue<T>(json);
  }

  @override
  Future<Book?> getRandomBook() async {
    final url = await _getRedirectUrl(
      hosts.api.getUri('/random/'),
    );

    if (url == null) {
      return null;
    }

    final id = RegExp(r'\d+').firstMatch(url)?.group(0);
    if (id == null) {
      return null;
    }

    return getBook(int.parse(id));
  }

  @override
  Future<Book> getBook(int id) {
    assert(id > 0, 'ID must be positive integer.');

    return _getModel('/api/gallery/$id');
  }

  @override
  Future<List<Comment>> getComments(int bookId) {
    assert(bookId > 0, 'Book ID must be positive integer.');

    return _getModel('/api/gallery/$bookId/comments');
  }

  /// Returns single [Search] page for [query].
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro api_throws}
  Future<Search> _searchSinglePage(SearchQuery query, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) async {
    if (page < 1) {
      throw ArgumentError.value(page, 'page', 'Must be grater than 0');
    }

    final isTagSearch = query is SearchQueryTag;

    return Search(
      await _getModel(
        '/api/galleries/${isTagSearch ? 'tagged' : 'search'}',
        queryParameters: {
          if (isTagSearch)
            'tag_id': query.tag.id.toString()
          else
            'query': query.toString(),
          'page' : page.toString(),
          if (sort != SearchSort.recent)
            'sort': sort.toString(),
        },
      ),
      query: query,
      page: page,
      sort: sort,
    );
  }

  /// Returns [Stream] of [Search] pages for [query].
  /// 
  /// [count] parameter defines a maximum amount of pages to request.
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro api_throws}
  Stream<Search> _search(SearchQuery query, {
    int page = 1,
    int? count,
    SearchSort sort = SearchSort.recent,
  }) async* {
    if (page < 1) {
      throw ArgumentError.value(page, 'page', 'Must be grater than 0');
    }

    late int pages;

    if (count != null) {
      pages = page + count - 1;
    }

    var currentPage = page;

    Search? search;
    do {
      search = await _searchSinglePage(query, page: currentPage++, sort: sort);
      // if (search == null)
      //   throw const FormatException('Cannot parse search result.');
      if (count == null) {
        pages = search.pages;
      }
      yield search;
    } while (currentPage <= pages);
  }

  @override
  Future<Search> searchSinglePage(String query, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) => _searchSinglePage(SearchQueryText(query), page: page, sort: sort);

  @override
  Stream<Search> search(String query, {
    int page = 1,
    int? count,
    SearchSort sort = SearchSort.recent,
  }) => _search(SearchQueryText(query), page: page, count: count, sort: sort);

  @override
  Future<Search> searchTaggedSinglePage(Tag tag, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) => _searchSinglePage(SearchQueryTag(tag), page: page, sort: sort);

  @override
  Stream<Search> searchTagged(Tag tag, {
    int page = 1,
    int? count,
    SearchSort sort = SearchSort.recent,
  }) => _search(SearchQueryTag(tag), page: page, count: count, sort: sort);
}
