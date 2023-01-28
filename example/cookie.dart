
// ignore_for_file: avoid_print, omit_local_variable_types

import 'dart:io';
import 'package:nhentai/before_request_add_cookies.dart';
import 'package:nhentai/nhentai.dart' as nh;


Future<void> main() async {
  /// Override User Agent
  nh.API.userAgent = 'User Agent Override';

  /// Add static list of Cookies to every request.
  final api = nh.API.proxy(
    'http://0xdeadbeef:0x0badf00d@example.com:1337/',
    beforeRequest: beforeRequestAddCookiesStatic([
      Cookie('some_cookie', 'some_value'),
    ]),
  );

  print('Getting');
  final nh.Book book = await api.getBook(177013);
  
  // Print short book summary.
  print(
    'Book: $book\n'
    'Artists: ${book.tags.artists.join(', ')}\n'
    'Languages: ${book.tags.languages.join(', ')}\n'
    'Cover: ${book.cover.getUrl(api: api)}\n'
    'First page: ${book.pages.first.getUrl(api: api)}\n'
    'First page thumbnail: ${book.pages.first.thumbnail.getUrl(api: api)}',
  );

  return;
}
