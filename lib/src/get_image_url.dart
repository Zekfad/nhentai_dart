import 'api.dart';
import 'hosts.dart';
import 'image.dart';


/// Returns [image] url using hosts settings from [api] client or
/// provided [hosts] config.
/// 
/// Throws [ArgumentError] if [hosts] and [api] are both missing.
Uri getImageUrl(Image image, {
  API? api,
  Hosts? hosts,
}) {
  if (hosts == null && api == null)
    throw ArgumentError('Either api or hosts must be provided.');

  hosts ??= api!.hosts;

  final hostType = (image.isThumbnail || image.isCover)
    ? HostType.thumbnail
    : HostType.image;

  return hosts[hostType].getUri(
    '/galleries/${image.media}/${image.filename}',
  );
}
