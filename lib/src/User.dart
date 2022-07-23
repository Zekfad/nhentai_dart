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
}
