// ignore_for_file: avoid_print, unused_local_variable, omit_local_variable_types

// Working with tags
import 'package:nhentai/nhentai_prefixed.dart';


final api = NHentaiAPI();

Future<void> main() async {
  // This will throw APIException if book was not found.
  final NHentaiBook book = await api.getBook(177013);
  final tags = book.tags;

  // Use predefined filters
  print(tags.artists);

  // Get certain types of tags
  print(tags.get([NHentaiTagType.artist, NHentaiTagType.language]));

  // Exclude certain tag types
  print(tags.exclude([NHentaiTagType.group, NHentaiTagType.language]));

  // Obtain modifiable list of tags
  print(tags.toList());

  // Combine tags using modifiable list of tags
  print(tags.artists.toList()..addAll(tags.categories));
  // or
  print([
    ...tags.artists,
    ...tags.categories,
  ]);

  // Almost the same as this (this one returns unmodifiable list)
  print(tags.get([NHentaiTagType.artist, NHentaiTagType.category]));

  return;
}
