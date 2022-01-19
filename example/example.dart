import 'dart:io';
// Import and shot prefixed typedefs
import 'package:nhentai/nhentai.dart' show NHentai, NHentaiHosts, NHentaiBook, NHentaiSearch;
// Import with library prefix
import 'package:nhentai/nhentai.dart' as nh;

Future<void> main() async {
  final apiProxy = nh.API(
    client: HttpClient() // Using HTTP proxy
      ..addProxyCredentials('example.com', 1337, 'Basic', HttpClientBasicCredentials('0xdeadbeef', '0x0badf00d'))
      ..findProxy = (uri) => 'PROXY example.com:1337',
    hosts: const NHentaiHosts(
      images    : ['i2.nhentai.net'],
      thumbnails: ['t7.nhentai.net'],
    ),
  );
  // Or just use default settings:
  final api = NHentai();

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
  await for (final search in api.searchTagged(book.tags.languages.first)) {
    print(search);
    print(search.books.take(2).join(', '));
    if (search.page >= 2)
      break;
  }

  // Make single query and print name of first book
  final NHentaiSearch search1 = await api.search('test').first;
  print(search1.books.first);
  // or
  final nh.Search? search2 = await api.doSearch('test');
  print(search2!.books.first);

  exit(0);
}
