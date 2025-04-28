// Example
// ignore_for_file: avoid_print, unused_local_variable, omit_local_variable_types

// Import with library prefix
import 'package:nhentai/nhentai.dart' as nh;

Future<void> main() async {
  // API client with HTTP proxy.
  final api = nh.API.proxy(
    // Proxy URI.
    'http://0xdeadbeef:0x0badf00d@example.com:1337/',
    hosts: nh.SelectedHosts(),
    maxRetries: 1,
  );

  // This will throw ApiException if book isn't found.
  final nh.Book book = await api.getBook(421025);
  
  // Print short book summary.
  print(
    'Book: $book\n'
    'Artists: ${book.tags.artists.join(', ')}\n'
    'Languages: ${book.tags.languages.join(', ')}\n'
    'Cover: ${api.hosts.getImageUrl(book.cover)}\n'
    'First page: ${api.hosts.getImageUrl(book.pages.first)}\n'
    'First page thumbnail: ${api.hosts.getImageUrl(book.pages.first.thumbnail)}',
  );

  print('Initial cover link: ${api.hosts.getImageUrl(book.cover)}');
  print('Final cover link: ${await api.getImageUrl(book.cover)}');
}
