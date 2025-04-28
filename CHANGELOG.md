## 1.0.0-wip
- BREAKING: Requires Dart 3.0.0
- **BREAKING**: Removed `_prefixed` libraries use Dart prefixes instead
  if needed.
- BREAKING: Removed library `nhentai_functions`.
  - Use `API` methods directly instead.
- BREAKING: Hosts system updates:
  - `selectHost` is removed, override `getHost` instead if needed.
- BREAKING: Removed `Image.getUrl` use `API` method instead.
- BREAKING: Removed `User.getAvatarUrl` use `API` method instead.
- BREAKING: Made `SearchQuery` `sealed`.
- Changed `http` constraint to `>=0.13.5 <2.0.0` to allow ^1.0.0 versions.
- BREAKING: Removed `Tag.dummy` constructor.
- BREAKING: Migrate to `dart_mappable: ^3.1.0`.
  You may need to call `initializeMappers` if you use data models other than via
  `parse` methods.
- BREAKING: `Image`, `ImageThumbnail`, `Cover` and `CoverThumbnail` are now 
  `final`.
- BREAKING: `SearchQuery` is now an `interface` class.
- BREAKING: `ImageType` is now a `sealed` class, change existing declarations to
  `KnownImageType` `enum`.
  Now you can use `ImageType('type')` to get known (enum) value or new instance
  of `UnknownImageType`.
- BREAKING: Removed unused `SimpleQuery` typedef.
- Remove note about streams, as async generators were fixed in Dart 2.18.
- Add `SearchQueryTagExtension` on `Tag` that will help creating combined tag
  search queries easier.
- JSON encoding of Objects are now aligns to original API schemas,
  allowing to use data classes for custom server implementation.
- Split API into implementation and abstract class.
  This will allow to make external API implementation.


## 1.0.0-dev.11
- BREAKING: Migrated from
  [`universal_io`](https://pub.dev/packages/universal_io) to
  [`http`](https://pub.dev/packages/http).
- BREAKING: `API` now accepts `Client` from
  [`package:http`](https://pub.dev/packages/http).
- BREAKING: `APIException` renamed to `ApiException`.
- BREAKING: `TagsList` is now `TagsListExtension`.
  This opens path for a more flexible API for tags.
- Now if server responded with not a JSON `ApiClientException` is thrown.
- `API` now has `userAgent` argument for `User Agent` on Dart VM targets.
- Completely new parsing system.
- Added simple cookies support for Dart VM targets
  `package:nhentai/before_request_add_cookies.dart` exports 2 functions:
  - `beforeRequestAddCookies` - accepts callback to generate list of `Cookie`s.
  - `beforeRequestAddCookiesStatic` - accepts list of `Cookie`s.

## 1.0.0-dev.10
- BREAKING: completely new hosts system
  - `Hosts` class.
  - `Host` class.
  - `ApiHost` class.
  - `ImageHost` class.
  - `ThumbnailHost` class.
- BREAKING: static method `APIException.throwIfError` removed.
- Add `meta` dependency:
  - Most of classes marked as `@immutable`.
- New library `nhentai_functions`:
  - Exported `getImageUrl` and `getAvatarUrl` functions.
- Added comments support:
  - `Comment` class.
  - `User` class.
  - `API#getComments` method.
- Internal project restructure.
- Migrate to `zekfad_lints`.
- Fix `JSON` error handler.

## 1.0.0-dev.9
- BREAKING: rename `NHentaiException` to `NHentaiAPIException`.
- Exposed `TagsList` and it's prefixed version `NHentaiTagsList`.

## 1.0.0-dev.8
- Add SSL options to Hosts.

## 1.0.0-dev.7
- Use `dart:io` on native platforms.

## 1.0.0-dev.6
- Experimental web support.
- Update readme with web usage notes.

## 1.0.0-dev.5
- Update readme to match new API.
- Update package description.
- Fix Hosts#getHost preference argument was unused.

## 1.0.0-dev.4

- BREAKING: rename `doSearch` to `searchSinglePage` and
  `doSearchTagged` to `searchTaggedSinglePage`
- Update main usage example.
- Add tags example.
- Update docs.

## 1.0.0-dev.3

- Update docs.

## 1.0.0-dev.2

- Fix docs.
- Add additional exports.

## 1.0.0-dev.1

- Initial version.
