// ignore_for_file: avoid_print, unused_local_variable

// Working with tags
import 'package:nhentai/nhentai.dart' as nh;

final api = nh.API();

Future<void> main() async {
  final nh.Book? book = await api.getBook(177013);
  if (book == null)
    throw Exception('Something went wrong.');
  final tags = book.tags;

  // using predefined filters
  print(tags.artists);

  // getting certain types
  print(tags.get([nh.TagType.artist, nh.TagType.language]));

  // excluding certain types
  print(tags.exclude([nh.TagType.group, nh.TagType.language]));

  // creating modifiable list of tags
  print(tags.toList());

  // combine tags using modifiable list of tags
  print(tags.artists.toList()..addAll(tags.categories));
  // equivalent to (almost, because this one returns unmodifiable list)
  print(tags.get([nh.TagType.artist, nh.TagType.category]));

  return;
}
