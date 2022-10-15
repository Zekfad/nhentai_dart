import 'api.dart';
import 'hosts.dart';
import 'user.dart';


/// Returns [user]'s avatar url using hosts settings from [api] client or
/// provided [hosts] config.
/// 
/// Throws [ArgumentError] if [hosts] and [api] are both missing.
Uri getAvatarUrl(User user, {
  API? api,
  Hosts? hosts,
}) {
  if (hosts == null && api == null)
    throw ArgumentError('Either api or hosts must be provided.');

  hosts ??= api!.hosts;

  return hosts.image.getUri(
    '/avatars/${user.avatarFilename}',
  );
}
