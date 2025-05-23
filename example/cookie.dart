// Example
// ignore_for_file: avoid_print, omit_local_variable_types

import 'dart:io';
import 'package:nhentai/before_request_add_cookies.dart';
import 'package:nhentai/nhentai.dart' as nh;


Future<void> main() async {

  // Add static list of Cookies to every request.
  final api = nh.API.proxy(
    'http://0xdeadbeef:0x0badf00d@example.com:1337/',
    // Override User Agent
    userAgent: 'User Agent Override',
    // Add before request handler
    beforeRequest: beforeRequestAddCookiesStatic([
      Cookie('some_cookie', 'some_value'),
    ]),
  );

  print('Requesting book...');
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

  return;
}
