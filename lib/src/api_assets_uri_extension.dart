import 'dart:async';

import 'api.dart';
import 'api_client_exception.dart';
import 'hosts.dart';
import 'models.dart';


/// Convenience methods for retrieving assets URIs.
extension ApiAssetsUriExtension on API {
  /// Returns [Uri] for [image].
  /// 
  /// If [hosts] is [SelectedHosts] this method will try to search for
  /// a responding host that accepts HTTP HEAD request for this [image].
  /// 
  /// Throws [ApiClientException] if all hosts are unreachable.
  Future<Uri> getImageUrl(Image image) async {
    final hosts = this.hosts;
    if (hosts is! SelectedHosts) {
      return hosts.getImageUrl(image);
    }
    final type = (image.isThumbnail || image.isCover)
      ? HostType.thumbnail
      : HostType.image;
    final initialHostIdx = hosts.selectedHosts[type]!;
    while (true) {
      final url = hosts.getImageUrl(image);
      try {
        await client.head(url).timeout(const Duration(seconds: 1));
        return url;
      } on Exception catch(exception) {
        if (hosts.selectNextHost(type) == initialHostIdx) {
          throw ApiClientException(
            'Cannot find reachable host',
            originalException: exception,
          );
        }
        continue;
      }
    }
  }

  /// Returns [Uri] for [user]'s avatar.
  /// 
  /// If [hosts] is [SelectedHosts] this method will try to search for
  /// a responding host that accepts HTTP HEAD request for this avatar.
  /// 
  /// Throws [ApiClientException] if all hosts are unreachable.
  Future<Uri> getAvatarUrl(User user) async {
    final hosts = this.hosts;
    if (hosts is! SelectedHosts) {
      return hosts.getAvatarUrl(user);
    }
    const type = HostType.image;
    final initialHostIdx = hosts.selectedHosts[type]!;
    while (true) {
      final url = hosts.getAvatarUrl(user);
      try {
        await client.head(url).timeout(const Duration(seconds: 1));
        return url;
      } on Exception catch(exception) {
        if (hosts.selectNextHost(type) == initialHostIdx) {
          throw ApiClientException(
            'Cannot find reachable host',
            originalException: exception,
          );
        }
        continue;
      }
    }
  }
}
