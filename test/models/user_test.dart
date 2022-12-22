import 'package:nhentai/nhentai.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'comment_test.dart' as comment_test;

void run(User? user, {
  required String json,
  required int userId,
  required String username,
  required String slug,
  required String avatarFilename,
  required String avatarUrl,
  required bool isSuperuser,
  required bool isStuff,
}) {
  group('user parsing test', () {
    final _user = user ?? Mapper.fromJson<User>(json);

    test('id', () {
      expect(_user.id, equals(userId));
    });
    test('username', () {
      expect(_user.username, equals(username));
    });
    test('slug', () {
      expect(_user.slug, equals(slug));
    });
    test('avatarFilename', () {
      expect(_user.avatarFilename, equals(avatarFilename));
    });
    test('getAvatarUrl', () {
      expect(_user.getAvatarUrl(hosts: const Hosts()).toString(), equals(avatarUrl));
    });
    test('superuser', () {
      expect(_user.superuser, equals(isSuperuser));
    });
    test('stuff', () {
      expect(_user.staff, equals(isStuff));
    });
  });
}

void main() => run(null,
  json: comment_test.userJson,
  userId: comment_test.userId,
  username: comment_test.username,
  slug: comment_test.slug,
  avatarFilename: comment_test.avatarFilename,
  avatarUrl: comment_test.avatarUrl,
  isSuperuser: comment_test.isSuperuser,
  isStuff: comment_test.isStuff,
);
