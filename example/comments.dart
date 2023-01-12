// ignore_for_file: avoid_print, unused_local_variable, omit_local_variable_types

// Working with tags
import 'package:nhentai/nhentai.dart' as nh;


final api = nh.API();

Future<void> main() async {
  final List<nh.Comment>? comments = await api.getComments(177013);
  if (comments == null)
    throw Exception('No book with given id exists.');

  final nh.Comment comment = comments.first;
  // Print first comment summary
  print(
    '${comment.author.username} (${comment.date}): '
    '${comment.body}'
  );
}
