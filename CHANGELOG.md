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

- BREAKING: rename `doSearch` to `searchSinglePage` and `doSearchTagged` to `searchTaggedSinglePage`
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
