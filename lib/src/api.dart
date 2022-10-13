import 'dart:convert';
import 'dart:io'
  if (dart.library.js) 'package:universal_io/io.dart'
  if (dart.library.html) 'package:universal_io/io.dart';

import 'package:meta/meta.dart';

import 'models.dart';
import 'platform.dart' as platform;
import 'search.dart';

/// Simple one-to-one query parameters map
typedef SimpleQuery = Map<String, String>;

/// Host type
enum HostType {
  /// API host for getting data objects.
  api,
  /// Images host for getting full size pages.
  images,
  /// Thumbnails host for getting pages thumbnails and covers.
  thumbnails,
}

/// Hosts settings.
class Hosts {
  const Hosts({
    this.api            = 'nhentai.net',
    this.images         = const [
      'i.nhentai.net', 'i2.nhentai.net', 'i5.nhentai.net', 'i7.nhentai.net',
    ],
    this.thumbnails     = const [
      't.nhentai.net', 't2.nhentai.net', 't5.nhentai.net', 't7.nhentai.net',
    ],
    this.hostPreference = const {
      HostType.images    : 0,
      HostType.thumbnails: 0,
    },
    this.hostSsl        = const {
      HostType.api       : true,
      HostType.images    : true,
      HostType.thumbnails: true,
    },
  });

  /// Default host preference a.k.a. which host to choice from hosts lists.
  final Map<HostType, int> hostPreference;

  /// Hosts SSL settings: whether to use HTTPS or HTTP.
  final Map<HostType, bool> hostSsl;

  /// Main api site.
  final String api;
  /// Images hosts.
  final List<String> images;
  /// Thumbnails hosts.
  final List<String> thumbnails;

  /// Get host corresponding to [hostType] with respect to [hostPreference].
  String operator[](HostType hostType) => getHost(hostType);

  /// Get host corresponding to [hostType] with respect to [hostPreference] or
  /// optionally provided [preference].
  String getHost(HostType hostType, [int? preference]) {
    preference ??= hostPreference[hostType] ?? 0;
    switch (hostType) {
      case HostType.api:
        return api;
      case HostType.images:
        return images[preference];
      case HostType.thumbnails:
        return thumbnails[preference];
    }
  }

  /// Get [image] url with respect to hosts settings.
  Uri getImageUrl(Image image) => Uri.https(
    getHost((image.isThumbnail || image.isCover)
      ? HostType.thumbnails
      : HostType.images,
    ),
    '/galleries/${image.book.media}/${image.filename}',
  );
}

/// API client.
@immutable
class API {
  /// Creates API client with provided HTTP [client] (if any) and [hosts].
  API({
    HttpClient? client,
    this.hosts = const Hosts(),
  }) :
    client = client ?? HttpClient();

  /// Creates API client with provided proxy config and [hosts].
  /// 
  /// * [proxyUri] must be in format of `http://host:port` or 
  ///   `http://username:password@host:port`.
  /// 
  /// Throws [UnsupportedError] on web.
  /// 
  /// Throws [ArgumentError] on malformed [proxyUri] or it is not HTTP proxy. 
  factory API.proxy(String proxyUri, {
    Hosts hosts = const Hosts(),
  }) {
    if (platform.isJS())
      throw UnsupportedError('Proxy is not supported on web');

    final _proxyUri = Uri.tryParse(proxyUri);

    if (_proxyUri == null || _proxyUri.scheme != 'http')
      throw ArgumentError.value(proxyUri, 'uri', 'Proxy URI must be valid');

    final match = RegExp(r'^(?<username>.+?):(?<password>.+?)$')
      .firstMatch(_proxyUri.userInfo);

    final username = match?.namedGroup('username');
    final password = match?.namedGroup('password');

    final proxyClient = HttpClient()
      ..findProxy = (uri) => 'PROXY ${_proxyUri.host}:${_proxyUri.port}';

    // Proxy authentication
    if (username != null && password != null)
      proxyClient.addProxyCredentials(
        _proxyUri.host,
        _proxyUri.port,
        'Basic',
        HttpClientBasicCredentials(username, password),
      );

    return API(
      client: proxyClient,
      hosts: hosts,
    );
  }

  /// [HttpClient] used for requests.
  final HttpClient client;
  /// Hosts settings.
  final Hosts hosts;

  /// Returns [Uri] with given [host], [path] and optional [query].
  Uri _getPath(HostType host, String path, [SimpleQuery? query]) =>
    (hosts.hostSsl[host] ?? true)
      ? Uri.https(
          hosts[host],
          path,
          query,
        )
      : Uri.http(
        hosts[host],
        path,
        query,
      );

  /// Makes HTTP GET request to [url] and returns closed [HttpClientResponse].
  Future<HttpClientResponse> _get(Uri url) async {
    final request = await client.getUrl(url)
      ..followRedirects = false;
    return request.close();
  }

  /// Makes HTTP GET request to [url] and parses response to JSON.
  /// 
  /// Throws [APIException] if parsed json is an API error.
  Future<dynamic> _getJson(Uri url) async {
    final response = await _get(url);
    final data = await utf8.decodeStream(response);
    final json = jsonDecode(data);
    
    final jsonError = json?['error'];
    if (jsonError != null) {
      if (jsonError is String)
        throw APIException(jsonError);
      if (jsonError is bool)
        throw const APIException('Generic exception.');
    }

    return json;
  }

  /// Makes HTTP GET request to [url] and returns redirect location.
  /// 
  /// Returns `null` if there was no redirect.
  /// 
  /// Note: doesn't work on web.
  Future<String?> _getRedirectUrl(Uri url) async {
    final response = await _get(url);
    final location = response.headers[HttpHeaders.locationHeader];

    // location == null || location.isEmpty
    if (location?.isNotEmpty != true)
      return null;
    return response.headers[HttpHeaders.locationHeader]!.first;
  }

  /// Returns random book.
  /// 
  /// Note: doesn't work on web.
  Future<Book?> getRandomBook() async {
    final url = await _getRedirectUrl(_getPath(HostType.api, '/random/'));
    if (url == null)
      return null;
    final id = RegExp(r'\d+').firstMatch(url)?.group(0);
    if (id == null)
      return null;
    return getBook(int.parse(id));
  }

  /// Returns book with given [id].
  /// 
  /// Returns `null` if book with such [id] doesn't exist.
  Future<Book?> getBook(int id) async {
    assert(id > 0, 'Id must be positive integer.');
    return Book.tryParse(
      await _getJson(_getPath(HostType.api, '/api/gallery/$id')),
    );
  }

  /// Returns [Uri] for [image] via [hosts] config.
  Uri getImageUrl(Image image) => hosts.getImageUrl(image);

  /// Returns single [Search] page for [query].
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// Returns `null` if result can't be parsed to [Search].
  Future<Search?> _searchSinglePage(SearchQuery query, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) async {
    if (page < 1)
      throw ArgumentError.value(page, 'page', 'Must be grater than 0');

    final isTagSearch = query is SearchQueryTag;
    return Search.tryParse(
      await _getJson(
        _getPath(
          HostType.api,
          '/api/galleries/${isTagSearch ? 'tagged' : 'search'}',
          {
            if (isTagSearch)
              'tag_id': query.tag.id.toString()
            else
              'query': query.toString(),
            'page' : page.toString(),
            if (sort != SearchSort.recent)
              'sort': sort.toString(),
          }
        ),
      ),
      query: query,
      page : page,
      sort : sort,
    );
  }

  /// Returns [Stream] of [Search] pages for [query].
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// Throws [FormatException] if result can't be parsed to [Search].
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
      if (search == null)
        throw const FormatException('Cannot parse search result.');
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
  /// Returns `null` if result can't be parsed to [Search].
  Future<Search?> searchSinglePage(String query, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) => _searchSinglePage(SearchQueryText(query), page: page, sort: sort);


  /// Returns [Stream] of [Search] pages for text [query].
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Note: __Always specify [count] if you need only
  /// a certain number of pages__, otherwise stream will keep making additional
  /// requests for subsequent pages even if you `break` out of `await for` loop.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// Throws [FormatException] if result can't be parsed to [Search].
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
  /// Returns `null` if result can't be parsed to [Search].
  Future<Search?> searchTaggedSinglePage(Tag tag, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) => _searchSinglePage(SearchQueryTag(tag), page: page, sort: sort);

  /// Returns [Stream] of pages of [Search] for books tagged with [tag].
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Note: __Always specify [count] if you need only
  /// a certain number of pages__, otherwise stream will keep making additional
  /// requests for subsequent pages even if you `break` out of `await for` loop.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// Throws [FormatException] if result can't be parsed to [Search].
  Stream<Search> searchTagged(Tag tag, {
    int page = 1,
    int? count,
    SearchSort sort = SearchSort.recent,
  }) => _search(SearchQueryTag(tag), page: page, count: count, sort: sort);
}
