import 'API.dart';
import 'parseUtils.dart' show parseAsTyped;

/// User.
class User {
  /// Create user.
  const User({
    required this.id,
    required this.username,
    required this.slug,
    required this.avatarFilename,
    required this.superuser,
    required this.staff,
  }) : super();

  /// User ID.
  final int id;
  /// User name.
  final String username;
  /// User slug.
  final String slug;
  /// User relevant avatar path.
  final String avatarFilename;
  /// Is user a superuser.
  final bool superuser;
  /// Is user a stuff.
  final bool staff;

  Uri getAvatarUrl({
    API? api,
    Hosts? hosts,
  }) {
    final url = (api?.hosts ?? hosts)?.getAvatarUrl(this);
    if (url == null)
      throw ArgumentError('Either api or hosts must be provided.');
    return url;
  }

  /// Get [username].
  @override
  String toString() => username;

  /// Parse user from API [json] object.
  static User? parse(dynamic json) {
    if(json == null)
      return null;

    return User(
      id: parseAsTyped(json?['id']),
      username: parseAsTyped(json?['username']),
      slug: parseAsTyped(json?['slug']),
      avatarFilename: Uri.parse(parseAsTyped(json?['avatar_url'])).pathSegments.last,
      superuser: parseAsTyped(json?['is_superuser']),
      staff: parseAsTyped(json?['is_staff']),
    );
  }
}
