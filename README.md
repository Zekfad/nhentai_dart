# Dart client for nhentai.net undocumented APIs.

## Features

* Full model (books, images, tags).
* Search for text query or tags.
* Getting random books.
* Configurable hosts.
* Proxy support via custom `HttpClient`.

## Usage

Import the package:
```dart
import 'package:nhentai/nhentai.dart';
```
Create client instance:
```dart
final api = NHentai();
```

Get the data:
```dart
final Book? book = await api.getBook(177013);
if (book == null)
  throw Exception('Something went wrong.');

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

## License

* ISC License
