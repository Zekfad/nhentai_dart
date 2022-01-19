import 'dart:convert';
import 'dart:io';

import 'DataModel.dart';
import 'search/Query.dart';
import 'utils.dart' show tryParseAsTyped;

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
    this.images         = const [ 'i.nhentai.net', 'i2.nhentai.net', 'i5.nhentai.net', 'i7.nhentai.net', ],
    this.thumbnails     = const [ 't.nhentai.net', 't2.nhentai.net', 't5.nhentai.net', 't7.nhentai.net', ],
    this.hostPreference = const {
      HostType.images    : 0,
      HostType.thumbnails: 0,
    },
  });

  /// Default host preference a.k.a. which host to choice from hosts lists.
  final Map<HostType, int> hostPreference;

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
    final _preference = hostPreference[hostType] ?? 0;
    switch (hostType) {
      case HostType.api:
        return api;
      case HostType.images:
        return images[_preference];
      case HostType.thumbnails:
        return thumbnails[_preference];
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
class API {
  API({
    HttpClient? client,
    this.hosts = const Hosts(),
  }) :
    client = client ?? HttpClient(),
    super();

  /// HttpClient to be used for requests.
  final HttpClient client;
  /// Hosts settings.
  final Hosts hosts;

  /// Get uri with given [host], [path] and optional [query].
  Uri _getPath(HostType host, String path, [SimpleQuery? query]) =>
    Uri.https(
      hosts[host],
      path,
      query,
    );

  /// Make HTTP get request to [url].
  Future<HttpClientResponse> _get(Uri url) async {
    final request = await client.getUrl(url)
      ..followRedirects = false;
    return request.close();
  }

  /// Make HTTP get request to [url] and parse result as JSON.
  Future<dynamic> _getJson(Uri url) async {
    final response = await _get(url);
    final data = await utf8.decodeStream(response);
    return jsonDecode(data);
  }

  /// Make HTTP get request to [url] and read redirect location header.
  Future<String?> _getRedirectUrl(Uri url) async {
    final response = await _get(url);
    final location = response.headers[HttpHeaders.locationHeader];
    if (location?.isNotEmpty != true)
      return null;
    return response.headers[HttpHeaders.locationHeader]!.first;
  }

  /// Get random book.
  Future<Book?> getRandomBook() async {
    final url = await _getRedirectUrl(_getPath(HostType.api, '/random/'));
    if (url == null)
      return null;
    final id = RegExp(r'\d+').firstMatch(url)?.group(0);
    if (id == null)
      return null;
    return getBook(int.parse(id));
  }

  /// Get book with given [id].
  Future<Book?> getBook(int id) async => tryParseAsTyped<Book>(
    await _getJson(_getPath(HostType.api, '/api/gallery/$id')),
  );

  /// Get [image] url with respect to this client instance [hosts] settings.
  Uri getImageUrl(Image image) => hosts.getImageUrl(image);

  /// Search for text [query].
  /// Optionally you can pass [page] witch is 1 by default and must be positive
  /// and [sort] which is [SearchSort.recent] be default.
  Future<Search?> doSearch(String query, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) async {
    if (page < 0)
      throw Exception('Page must be positive integer');
    return Search.parse(
      await _getJson(
        _getPath(HostType.api, '/api/galleries/search', {
          'query': query,
          'page' : page.toString(),
          if (sort != SearchSort.recent)
            'sort': sort.toString(),
        }),
      ),
      query: SearchText(query),
      page : page,
    );
  }

  /// Search for books tagged with [tag].
  /// Optionally you can pass [page] witch is 1 by default and must be positive
  /// and [sort] which is [SearchSort.recent] be default.
  Future<Search?> doSearchTagged(Tag tag, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) async {
    if (page < 0)
      throw Exception('Page must be positive integer');
    return Search.parse(
      await _getJson(
        _getPath(HostType.api, '/api/galleries/tagged', {
          'tag_id': tag.id.toString(),
          'page'  : page.toString(),
          if (sort != SearchSort.recent)
            'sort': sort.toString(),
        }),
      ),
      query: SearchTag(tag),
      page : page,
    );
  }

  /// Search for text [query].
  /// Optionally you can pass [page] witch is 1 by default and must be positive
  /// and [sort] which is [SearchSort.recent] be default.
  Stream<Search> search(String query, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) async* {
    if (page < 0)
      throw Exception('Page must be positive integer');
    int _pages;
    int _page = page;
    Search? search;
    do {
      search = await doSearch(query, page: _page++, sort: sort);
      if (search == null)
        throw Exception('Cannot parse search result.');
      _pages = search.pages;
      yield search;
    } while (_page <= _pages);
  }

  /// Search for books tagged with [tag].
  /// Optionally you can pass [page] witch is 1 by default and must be positive
  /// and [sort] which is [SearchSort.recent] be default.
  Stream<Search> searchTagged(Tag tag, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  }) async* {
    if (page < 0)
      throw Exception('Page must be positive integer');
    int _pages;
    int _page = page;
    Search? search;
    do {
      search = await doSearchTagged(tag, page: _page++, sort: sort);
      if (search == null)
        throw Exception('Cannot parse search result.');
      _pages = search.pages;
      yield search;
    } while (_page <= _pages);
  }
}
