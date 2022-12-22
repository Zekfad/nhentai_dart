library comment_test;

import 'package:nhentai/data_model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'user_test.dart' as user_test;

const commentJson = '{"id":2360921,"gallery_id":351814,"poster":{"id":4529772,"username":"fuckntr1254","slug":"fuckntr1254","avatar_url":"avatars/4529772.png?_=796e43161ce1b92d","is_superuser":false,"is_staff":false},"post_date":1645834901,"body":"THE WHOLESOMENESS "}';

const commentId = 2360921;
const galleryId = 351814;
const postDate = 1645834901 * Duration.millisecondsPerSecond;
const body = 'THE WHOLESOMENESS ';

const userJson = '{"id":4529772,"username":"fuckntr1254","slug":"fuckntr1254","avatar_url":"avatars/4529772.png?_=796e43161ce1b92d","is_superuser":false,"is_staff":false}';

const userId = 4529772;
const username = 'fuckntr1254';
const slug = 'fuckntr1254';
const avatarFilename = '4529772.png';
const avatarUrl = 'https://i.nhentai.net/avatars/4529772.png';
const isSuperuser = false;
const isStuff = false;

void main() {
  group('comment parsing test', () {
    final comment = Mapper.fromJson<Comment>(commentJson);
  
    test('id', () {
      expect(comment.id, equals(commentId));
    });
    test('bookId', () {
      expect(comment.bookId, equals(galleryId));
    });
    test('postDate', () {
      expect(comment.date.millisecondsSinceEpoch, equals(postDate));
    });

    test('body', () {
      expect(comment.body, body);
    });

    user_test.run(comment.author, 
      json: userJson,
      userId: userId,
      username: username,
      slug: slug,
      avatarFilename: avatarFilename,
      avatarUrl: avatarUrl,
      isSuperuser: isSuperuser,
      isStuff: isStuff,
    );
  });
}
