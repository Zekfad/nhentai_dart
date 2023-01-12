// ignore_for_file: avoid_print, unused_local_variable, omit_local_variable_types

// Working with tags
import 'package:nhentai/nhentai.dart' as nh;


final api = nh.API();

Future<void> main() async {
  final nh.Book? book = await api.getBook(177013);
  if (book == null)
    throw Exception('No book with given id exists.');
  final tags = book.tags;

  // Use predefined filters
  print(tags.artists);

  // Get certain types of tags
  print(tags.get([nh.TagType.artist, nh.TagType.language]));

  // Exclude certain tag types
  print(tags.exclude([nh.TagType.group, nh.TagType.language]));

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
  print(tags.get([nh.TagType.artist, nh.TagType.category]));

  return;
}
