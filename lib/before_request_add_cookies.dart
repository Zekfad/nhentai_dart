/// [BeforeRequestCallback] generator functions. that helps you to add [Cookie]s
/// to requests.
// ignore: unnecessary_library_name
library nhentai_before_add_cookies;

import 'dart:io';
import 'src/api.dart' show BeforeRequestCallback;


/// Creates [BeforeRequestCallback] that dynamically adds [Cookie]s to requests. 
BeforeRequestCallback beforeRequestAddCookies(List<Cookie> Function() getCookies) =>
  (request) => request
    ..headers['cookie'] = getCookies().map((e) => e.toString()).join('; ');

/// Creates [BeforeRequestCallback] that adds static list of [Cookie]s to requests. 
BeforeRequestCallback beforeRequestAddCookiesStatic(List<Cookie> cookies) {
  final cookieString = cookies.map((e) => e.toString()).join('; ');
  return (request) => request
    ..headers['cookie'] = cookieString;
}
