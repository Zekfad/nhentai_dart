// ignore_for_file: avoid_print, unused_local_variable

import 'dart:io';
// Import with library prefix
import 'package:nhentai/nhentai.dart' as nh;
// Import prefixed version
import 'package:nhentai/nhentai_prefixed.dart';

Future<void> main() async {
  // API client
  final pureApi = nh.API();

  // Client with HTTP proxy
  final proxyApi = NHentai.proxy(
    'http://0xdeadbeef:0x0badf00d@example.com:1337/',
    hosts: const NHentaiHosts(
      images    : ['i2.nhentai.net'],
      thumbnails: ['t7.nhentai.net'],
    ),
  );

  // Client with custom HTTP Client
  final customClientApi = nh.API(
    // HTTP proxy example
    client: HttpClient()
      ..addProxyCredentials(
        'example.com',
        1337,
        'Basic',
        HttpClientBasicCredentials('0xdeadbeef', '0x0badf00d'),
      )
      ..findProxy = (uri) => 'PROXY example.com:1337',
    hosts: const NHentaiHosts(
      images    : ['i5.nhentai.net'],
      thumbnails: ['t2.nhentai.net'],
    ),
  );

  final api = pureApi;

  final NHentaiBook? book = await api.getBook(177013);
  if (book == null)
    throw Exception('Something went wrong.');
  
  // Short book summary
  print(
    'Book: $book\n'
    'Artists: ${book.tags.artists.join(', ')}\n'
    'Languages: ${book.tags.languages.join(', ')}\n'
    'Cover: ${book.cover.getUrl(api: api)}\n'
    'First page: ${book.pages.first.getUrl(api: api)}\n'
    'First page thumbnail: ${book.pages.first.thumbnail.getUrl(api: api)}',
  );

  print('\n');

  // Search for books with the same language
  // Print names of first 2 books of first 2 pages of search
  await for (final search in api.searchTagged(book.tags.languages.first, count: 2)) {
    print(search);
    print(search.books.take(2).join(', '));

    // This is bad, because the stream are already requesting new page at this
    // time. Use `count` option instead of breaking by condition like this.
    // if (search.page >= 2)
    //   break;
  }

  // Make single query and print name of first book

  // Request via generator, here you must specify count to 1,
  // otherwise you'll make and will wait for 2 requests instead of single one.
  final nh.Search search1 = await api.search('test', count: 1).first;
  print(search1.books.first);

  // Pure single search request
  final NHentaiSearch? search2 = await api.searchSinglePage('test');
  print(search2!.books.first);

  return;
}
