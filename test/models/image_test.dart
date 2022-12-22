import 'package:nhentai/data_model.dart';
import 'package:nhentai/nhentai.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void run(Image? image, {
  required String json,
  required ImageType type,
  required String filename,
  required String url,
  int? width,
  int? height,
}) {
  final _image = image ?? Mapper.fromJson<Image>(json);
  group('image test', () {
    test('type', () {
      expect(_image.type, equals(type));
    });
    test('width', () {
      expect(_image.width, equals(width));
    });
    test('height', () {
      expect(_image.height, equals(height));
    });
    test('filename', () {
      expect(_image.filename, equals(filename));
    });
    test('url', () {
      expect(_image.getUrl(hosts: const Hosts()).toString(), equals(url));
    });
  });
}
void main() {}
