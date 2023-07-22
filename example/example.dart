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
  final NHentaiBook book = await api.getBook(421025);
  
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

    // You can use break as well.
    // In Dart prior 2.18 there was a bug in generators behavior
    // Ref: https://github.com/dart-lang/sdk/issues/34775
    if (search.page >= 2)
      break;
  }

  // Make a single query and print name of the first book.

  // Request via generator.
  final nh.Search search1 = await api.search('test', count: 1).first;
  print(search1.books.first);

  // Pure single search request.
  final NHentaiSearch search2 = await api.searchSinglePage('test');
  print(search2.books.first);

  return;
}
