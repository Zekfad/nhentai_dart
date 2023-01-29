import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart' show MapperException;
import 'package:http/http.dart' show Client, Request, Response;
import 'package:http/retry.dart';
import 'package:meta/meta.dart';

import 'api_client_exception.dart';
import 'api_exception.dart';
import 'get_avatar_url.dart' as get_avatar_url;
import 'get_image_url.dart' as get_image_url;
import 'hosts.dart';
import 'models.container.dart';
import 'models.dart';
import 'platform.dart' as platform;

/// Simple one-to-one query parameters map.
typedef SimpleQuery = Map<String, String>;

/// Before request callback.
typedef BeforeRequestCallback = void Function(Request request);

/// API client.
@immutable
class API {
  /// Creates API client.
  /// 
  /// * [client] is an optional HTTP [Client] from `package:http`,
  ///   by default [RetryClient] with platform appropriate client is used.
  ///   Note that this option is negates effect of [maxRetries].
  /// {@template api_constructor_shared_arguments}
  /// * [hosts] is an optional hosts config. It's used to configure client to
  ///   different than default servers, e.g. transparent or reverse proxy.
  /// * [beforeRequest] is an optional callback that is called right before
  ///   the execution of request, so you could modify headers, add cookies
  ///   and so on.
  /// * [maxRetries] is an optional argument to default [RetryClient], that
  ///   configures how many times request should retry before giving up.
  /// * [userAgent] is an optional User Agent string to use with this client.
  ///   Be default it is [defaultUserAgent].
  /// {@endtemplate}
  API({
    Client? client,
    this.hosts = const Hosts(),
    this.beforeRequest,
    int maxRetries = 5,
    String? userAgent,
  }) :
    client = client ?? RetryClient(
      platform.getClient(userAgent ?? defaultUserAgent),
      retries: maxRetries,
    );

  /// Creates API client with provided proxy config.
  /// 
  /// * [proxyUri] is proxy address that must be in format of `http://host:port`
  ///    or `http://username:password@host:port`.
  /// {@macro api_constructor_shared_arguments}
  /// 
  /// Throws [UnsupportedError] on web.
  /// 
  /// Throws [ArgumentError] with malformed [proxyUri] or if it isn't an HTTP
  /// proxy. 
  API.proxy(String proxyUri, {
    this.hosts = const Hosts(),
    this.beforeRequest,
    int maxRetries = 5,
    String? userAgent,
  }) :
    client = RetryClient(
      platform.getProxyClient(proxyUri, userAgent ?? defaultUserAgent),
      retries: maxRetries,
    );


  /// Internal client version used for User Agent.
  static const _version = '1.0.0';

  /// Default API client User Agent string.
  /// 
  /// Note: in web this is ignored.
  static String defaultUserAgent = 'nhentai-api-client/$_version ${platform.platformUserAgent}';

  /// [Client] used for requests.
  final Client client;
  /// Hosts settings.
  final Hosts hosts;
  /// Before request callback. Used to pre process requests. 
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
      if (jsonError is String)
        throw ApiException(jsonError);
      if (jsonError is bool) // API can return `{"error":true}` with no info.
        throw const ApiException('Generic API exception.');
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
  /// {@template parser_throws}
  /// Throws [ApiException] if server responded with JSON error.
  /// 
  /// Throws [ApiClientException] if server responded with not a JSON.
  /// 
  /// Throws [MapperException] if it is impossible to parse response into target
  /// model.
  /// {@endtemplate}
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
    return InternalModelsContainer.fromValue<T>(json);
  }

  /// Returns [Uri] for [image] via [hosts] config.
  Uri getImageUrl(Image image) =>
    get_image_url.getImageUrl(image, api: this);

  /// Returns [Uri] for [user]'s avatar via [hosts] config.
  Uri getAvatarUrl(User user) =>
    get_avatar_url.getAvatarUrl(user, api: this);

  /// Returns random book.
  /// 
  /// {@macro parser_throws}
  /// 
  /// Note: doesn't work on web.
  Future<Book?> getRandomBook() async {
    final url = await _getRedirectUrl(
      hosts.api.getUri('/random/'),
    );

    if (url == null)
      return null;

    final id = RegExp(r'\d+').firstMatch(url)?.group(0);
    if (id == null)
      return null;

    return getBook(int.parse(id));
  }

  /// Returns book with given [id].
  /// 
  /// {@macro parser_throws}
  Future<Book> getBook(int id) {
    assert(id > 0, 'ID must be positive integer.');

    return _getModel('/api/gallery/$id');
  }

  /// Returns comments for book with given [bookId].
  /// 
  /// {@macro parser_throws}
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
  /// {@macro parser_throws}
  Future<Search> _searchSinglePage(SearchQuery query, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) async {
    if (page < 1)
      throw ArgumentError.value(page, 'page', 'Must be grater than 0');

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
  /// {@macro parser_throws}
  Stream<Search> _search(SearchQuery query, {
    int page = 1,
    int? count,
    SearchSort sort = SearchSort.recent,
  }) async* {
    if (page < 1)
      throw ArgumentError.value(page, 'page', 'Must be grater than 0');

    late int _pages;

    if (count != null)
      _pages = page + count - 1;

    var _page = page;

    Search? search;
    do {
      search = await _searchSinglePage(query, page: _page++, sort: sort);
      // if (search == null)
      //   throw const FormatException('Cannot parse search result.');
      if (count == null)
        _pages = search.pages;
      yield search;
    } while (_page <= _pages);
  }

  /// Returns single [Search] page for text [query].
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro parser_throws}
  Future<Search> searchSinglePage(String query, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) => _searchSinglePage(SearchQueryText(query), page: page, sort: sort);


  /// Returns [Stream] of [Search] pages for text [query].
  /// 
  /// [count] parameter defines a maximum amount of pages to request.
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Note: __Always specify [count] if you need only
  /// a certain number of pages__, otherwise stream will keep making additional
  /// requests for subsequent pages even if you `break` out of `await for` loop.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro parser_throws}
  Stream<Search> search(String query, {
    int page = 1,
    int? count,
    SearchSort sort = SearchSort.recent,
  }) => _search(SearchQueryText(query), page: page, count: count, sort: sort);

  /// Returns single page of [Search] for books tagged with [tag].
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro parser_throws}
  Future<Search> searchTaggedSinglePage(Tag tag, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) => _searchSinglePage(SearchQueryTag(tag), page: page, sort: sort);

  /// Returns [Stream] of pages of [Search] for books tagged with [tag].
  /// 
  /// [count] parameter defines a maximum amount of pages to request.
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Note: __Always specify [count] if you need only
  /// a certain number of pages__, otherwise stream will keep making additional
  /// requests for subsequent pages even if you `break` out of `await for` loop.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro parser_throws}
  Stream<Search> searchTagged(Tag tag, {
    int page = 1,
    int? count,
    SearchSort sort = SearchSort.recent,
  }) => _search(SearchQueryTag(tag), page: page, count: count, sort: sort);
}
