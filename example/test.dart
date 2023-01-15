import 'package:nhentai/data_model.dart';

void main(List<String> args) {
  final cover = Cover.fromMap({
    'w': '12',
    'h': '123',
    't': 'j',
    'media_id': '21312',
  });  

  print(cover.thumbnail);
}
