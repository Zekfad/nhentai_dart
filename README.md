# Client for nhentai.net undocumented APIs

## Features

* Full model (books, images, tags, comments, users).
* Search for text query.
* Search by tag(s).
* Get random book.
* Configurable hosts.
* Support for custom `Client` (via
  [`package:http`](https://pub.dev/packages/http)).
* Out-of-box HTTP proxy support (configurable via URI).
* Out-of-box User Agent override and Cookies support.

### Notes about web usage

Using this module on web platform is experimental and has some drawbacks:

* You can't access nhentai directly due to CORS.
  * Workaround: use CORS enabled mirror (for example you can use
    [dev-mirror](https://github.com/Zekfad/dev-mirror)).
* `API#getRandomBook` doesn't work due to limitations of `XHR`.
  * Workaround: use
  [`package:fetch_client`](https://pub.dev/packages/fetch_client).
* Proxy isn't supported on web.
* User Agent override isn't supported on web.
* Cookies helper functions aren't supported on web.

## Usage

Import the package:
```dart
import 'package:nhentai/nhentai.dart';
```
Create client instance:
```dart
final api = API();
```

Get the data:
```dart
/// Throws if book is not found, or parse failed, see docs.
final Book book = await api.getBook(421025);

// Short book summary
print(
  'Book: $book\n'
  'Artists: ${book.tags.artists.join(', ')}\n'
  'Languages: ${book.tags.languages.join(', ')}\n'
  'Cover: ${book.cover.getUrl(api: api)}\n'
  'First page: ${book.pages.first.getUrl(api: api)}\n'
  'First page thumbnail: ${book.pages.first.thumbnail.getUrl(api: api)}\n',
);
```

See more usage at [example](example/) folder.

## License

* ISC License
