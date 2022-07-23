import 'parseUtils.dart' show parseAsTyped;

/// User.
class User {
  /// Create user.
  User({
    required this.id,
    required this.username,
    required this.slug,
    required this.avatarUrl,
    required this.isSuperuser,
    required this.isStaff,
  }) : super();

  /// User ID.
  final int id;
  /// User name.
  final String username;
  /// User slug.
  final String slug;
  /// User relevant avatar path.
  final String avatarUrl;
  /// Is user a superuser.
  final bool isSuperuser;
  /// Is user a stuff.
  final bool isStaff;

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
      avatarUrl: parseAsTyped(json?['avatar_url']), 
      isSuperuser: parseAsTyped(json?['is_superuser']), 
      isStaff: parseAsTyped(json?['is_staff']),
    );
  }
}
