import 'package:dart_mappable/dart_mappable.dart' show MapperException;
import 'package:http/http.dart' show Client, Request;
import 'package:http/retry.dart';

import 'api_client_exception.dart';
import 'api_exception.dart';
import 'api_restful_api_implementation.dart';
import 'get_avatar_url.dart' as get_avatar_url;
import 'get_image_url.dart' as get_image_url;
import 'hosts.dart';
import 'models.dart';
import 'platform.dart' as platform;


/// Before request callback.
typedef BeforeRequestCallback = void Function(Request request);

/// API client.
abstract class API {
  /// Creates API client.
  /// 
  /// {@template api_default_constructor_arguments}
  /// * [client] is an optional HTTP [Client] from `package:http`,
  ///   by default [RetryClient] with platform appropriate client is used.
  ///   Note that this option is negates effect of [maxRetries].
  /// {@endtemplate}
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
  factory API({
    Client? client,
    Hosts hosts = const Hosts(),
    BeforeRequestCallback? beforeRequest,
    int maxRetries = 5,
    String? userAgent,
  }) => ApiRestfulApiImplementation(
    client: client,
    hosts: hosts,
    beforeRequest: beforeRequest,
    maxRetries: maxRetries,
    userAgent: userAgent,
  );

  /// Creates API client with provided proxy config.
  /// 
  /// {@template api_proxy_constructor_arguments}
  /// * [proxyUri] is proxy address that must be in format of `http://host:port`
  ///    or `http://username:password@host:port`.
  /// {@endtemplate}
  /// {@macro api_constructor_shared_arguments}
  /// 
  /// {@template api_proxy_constructor_throws}
  /// Throws [UnsupportedError] on web.
  /// 
  /// Throws [ArgumentError] with malformed [proxyUri] or if it isn't an HTTP
  /// proxy. 
  /// {@endtemplate}
  factory API.proxy(String proxyUri, {
    Hosts hosts = const Hosts(),
    BeforeRequestCallback? beforeRequest,
    int maxRetries = 5,
    String? userAgent,
  }) => ApiRestfulApiImplementation.proxy(
    proxyUri,
    hosts: hosts,
    beforeRequest: beforeRequest,
    maxRetries: maxRetries,
    userAgent: userAgent,
  );

  /// Constructor to be used with [API] implementations.
  const API.internal();

  /// Internal client version used for User Agent.
  static const _version = '1.0.0';

  /// Default API client User Agent string.
  /// 
  /// Note: in web this is ignored.
  static String defaultUserAgent = 'nhentai-api-client/$_version ${platform.platformUserAgent}';

  /// [Client] used for requests.
  Client get client;
  /// Hosts settings.
  Hosts get hosts;
  /// Before request callback. Used to pre process requests. 
  BeforeRequestCallback? get beforeRequest;

  /// Returns [Uri] for [image] via [hosts] config.
  Uri getImageUrl(Image image) =>
    get_image_url.getImageUrl(image, api: this);

  /// Returns [Uri] for [user]'s avatar via [hosts] config.
  Uri getAvatarUrl(User user) =>
    get_avatar_url.getAvatarUrl(user, api: this);

  /// Returns random book.
  /// 
  /// {@template api_throws}
  /// Throws [ApiException] if server responded with JSON error.
  /// 
  /// Throws [ApiClientException] if server responded with not a JSON.
  /// 
  /// Throws [MapperException] if it is impossible to parse response into target
  /// model.
  /// {@endtemplate}
  Future<Book?> getRandomBook();

  /// Returns book with given [id].
  /// 
  /// {@macro api_throws}
  Future<Book> getBook(int id);

  /// Returns comments for book with given [bookId].
  /// 
  /// {@macro api_throws}
  Future<List<Comment>> getComments(int bookId);

  /// Returns single [Search] page for text [query].
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro api_throws}
  Future<Search> searchSinglePage(String query, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  });

  /// Returns [Stream] of [Search] pages for text [query].
  /// 
  /// [count] parameter defines a maximum amount of pages to request.
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro api_throws}
  Stream<Search> search(String query, {
    int page = 1,
    int? count,
    SearchSort sort = SearchSort.recent,
  });
  /// Returns single page of [Search] for books tagged with [tag].
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro api_throws}
  Future<Search> searchTaggedSinglePage(Tag tag, {
    int page = 1,
    SearchSort sort = SearchSort.recent,
  });

  /// Returns [Stream] of pages of [Search] for books tagged with [tag].
  /// 
  /// [count] parameter defines a maximum amount of pages to request.
  /// 
  /// Optionally you can provide _positive_ [page] number and [sort] parameter.
  /// 
  /// Throws [ArgumentError] if [page] is less than 1.
  /// 
  /// {@macro api_throws}
  Stream<Search> searchTagged(Tag tag, {
    int page = 1,
    int? count,
    SearchSort sort = SearchSort.recent,
  });
}
