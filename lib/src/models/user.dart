import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import '../api.dart';
import '../get_avatar_url.dart' as get_avatar_url;
import '../hosts.dart';

class AvatarFilenameHooks extends MappingHooks {
  const AvatarFilenameHooks();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is! String) 
      throw MapperException.unexpectedType(value.runtimeType, String, 'String');
    
    return Uri.parse(value).pathSegments.last;
  }

  @override
  dynamic beforeEncode(dynamic value) {
    if (value is! String) 
      throw MapperException.unexpectedType(value.runtimeType, String, 'String');

    return 'avatars/$value';
  }
}

/// User.
@immutable
@MappableClass()
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
  @MappableField(key: 'id')
  final int id;

  /// User name.
  @MappableField(key: 'username')
  final String username;
  
  /// Human-readable unique user identifier. 
  @MappableField(key: 'slug')
  final String slug;
  
  /// User's avatar file name.
  @MappableField(key: 'avatar_url', hooks: AvatarFilenameHooks())
  final String avatarFilename;
  
  /// Whether user is superuser.
  @MappableField(key: 'is_superuser')
  final bool superuser;
  
  /// Whether user is staff member.
  @MappableField(key: 'is_staff')
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
}
