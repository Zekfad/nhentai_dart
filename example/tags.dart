// ignore_for_file: avoid_print, unused_local_variable, omit_local_variable_types

// Working with tags
import 'package:nhentai/nhentai.dart' as nh;


final api = nh.API();

Future<void> main() async {
  final nh.Book book = await api.getBook(421025);
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

  // Search by multiple tags

  // Via query constructor (allows const)
  const query = nh.SearchQueryTag(
    nh.Tag.named(
      type: nh.TagType.language,
      name: 'english',
    ),
  );

  // Via query extension (using SearchQueryTagExtension)
  final queryDynamic =  const nh.Tag.named(
    type: nh.TagType.language,
    name: 'translated',
  ).query;

  final res = await api.search('$query -$queryDynamic').first;

  return;
}
