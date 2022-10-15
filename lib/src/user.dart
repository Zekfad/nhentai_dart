import 'package:meta/meta.dart';

import 'api.dart';
import 'get_avatar_url.dart' as get_avatar_url;
import 'hosts.dart';
import 'parsers.dart' as parsers;


/// User.
@immutable
class User {
  /// Creates user.
  const User({
    required this.id,
    required this.username,
    required this.slug,
    required this.avatarFilename,
    required this.superuser,
    required this.staff,
  });

  /// User ID.
  final int id;
  /// User name.
  final String username;
  /// Human-readable unique user identifier. 
  final String slug;
  /// User's avatar file name.
  final String avatarFilename;
  /// Whether user is superuser.
  final bool superuser;
  /// Whether user is staff member.
  final bool staff;

  /// Returns avatar url using hosts settings from [api] client or
  /// provided [hosts] config.
  /// 
  /// Throws [ArgumentError] if [hosts] and [api] are both missing.
  Uri getAvatarUrl({
    API? api,
    Hosts? hosts,
  }) => get_avatar_url.getAvatarUrl(this, api: api, hosts: hosts);

  /// Returns [username].
  @override
  String toString() => username;

  /// Parses user from API [json] object.
  ///
  /// Returns `null` if [json] can't be parsed to [User].
  static User? tryParse(dynamic json) {
    if (json == null)
      return null;
    try {
      return User.parse(json);
    } on FormatException { // Ignore bad JSON.
      return null;
    }
  }

  /// Parses book from API [json] object.
  /// 
  /// Throws a [FormatException] if [json] can't be parsed to [User].
  // ignore: sort_constructors_first
  factory User.parse(dynamic json) =>
    User(
      id: parsers.parse(json?['id']),
      username: parsers.parse(json?['username']),
      slug: parsers.parse(json?['slug']),
      avatarFilename: Uri.parse(parsers.parse(json?['avatar_url'])).pathSegments.last,
      superuser: parsers.parse(json?['is_superuser']),
      staff: parsers.parse(json?['is_staff']),
    );
}
