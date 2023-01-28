// ignore_for_file: avoid_print, unused_local_variable, omit_local_variable_types

import 'dart:io';
import 'package:http/io_client.dart';
// Import with library prefix
import 'package:nhentai/nhentai.dart' as nh;
// Import prefixed version
import 'package:nhentai/nhentai_prefixed.dart';


Future<void> main() async {
  // API client with default parameters.
  final pureApi = nh.API();

  // API client with HTTP proxy.
  final proxyApi = NHentai.proxy(
    // Proxy URI.
    'http://0xdeadbeef:0x0badf00d@example.com:1337/',
    // Custom hosts config with changed image and thumbnail hosts.
    hosts: NHentaiHosts.only(
      image    : const NHentaiImageHost('i2.nhentai.net'),
      thumbnail: const NHentaiThumbnailHost('t7.nhentai.net'),
    ),
  );

  // Client with custom HTTP Client.
  final customClientApi = nh.API(
    // HTTP client with proxy.
    client: IOClient(
        HttpClient()
        ..addProxyCredentials(
          'example.com',
          1337,
          'Basic',
          HttpClientBasicCredentials('0xdeadbeef', '0x0badf00d'),
        )
        ..findProxy = (uri) => 'PROXY example.com:1337',
      ),
    // Multiple hosts config with 2 image hosts.
    hosts: NHentaiHosts.multiple(
      image: [
        // Create image host via dedicated class constructor.
        const NHentaiImageHost('i7.nhentai.net'),
        // Create image host config via generic host factory.
        NHentaiHost(NHentaiHostType.image, 'i5.nhentai.net') as NHentaiImageHost,
      ],
    ),
  );

  final api = pureApi;

  // This will throw ApiException if book isn't found.
  final NHentaiBook book = await api.getBook(177013);
  
  // Print short book summary.
  print(
    'Book: $book\n'
    'Artists: ${book.tags.artists.join(', ')}\n'
    'Languages: ${book.tags.languages.join(', ')}\n'
    'Cover: ${book.cover.getUrl(api: api)}\n'
    'First page: ${book.pages.first.getUrl(api: api)}\n'
    'First page thumbnail: ${book.pages.first.thumbnail.getUrl(api: api)}',
  );

  print('\n');

  // Search for books with the same language.
  // Print names of first 2 books of first 2 pages of search.
  await for (final search in api.searchTagged(book.tags.languages.first, count: 2)) {
    print(search);
    print(search.books.take(2).join(', '));

    // This is a bad approach because the stream is already in process of
    // requesting new page at this point.
    // Use `count` option instead of breaking by condition like this.
    // if (search.page >= 2)
    //   break;
  }

  // Make a single query and print name of the first book.

  // Request via generator, here you must specify `count` to 1, otherwise stream
  // will make 2 request and you'll wait for 2 requests instead of single one.
  final nh.Search search1 = await api.search('test', count: 1).first;
  print(search1.books.first);

  // Pure single search request.
  final NHentaiSearch search2 = await api.searchSinglePage('test');
  print(search2.books.first);

  return;
}
