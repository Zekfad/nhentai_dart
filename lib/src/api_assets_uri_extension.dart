import 'dart:async';

import 'api.dart';
import 'api_client_exception.dart';
import 'hosts.dart';
import 'models.dart';


extension ApiAssetsUriExtension on API {
  Future<Uri> getImageUrl(Image image) async {
    final hosts = this.hosts;
    if (hosts is! SelectedHosts)
      return hosts.getImageUrl(image);
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
        if (hosts.selectNextHost(type) == initialHostIdx)
          throw ApiClientException(
            'Cannot find reachable host',
            originalException: exception,
          );
        continue;
      }
    }
  }

  Future<Uri> getAvatarUrl(User user) async {
    final hosts = this.hosts;
    if (hosts is! SelectedHosts)
      return hosts.getAvatarUrl(user);
    const type = HostType.image;
    final initialHostIdx = hosts.selectedHosts[type]!;
    while (true) {
      final url = hosts.getAvatarUrl(user);
      try {
        await client.head(url).timeout(const Duration(seconds: 1));
        return url;
      } on Exception catch(exception) {
        if (hosts.selectNextHost(type) == initialHostIdx)
          throw ApiClientException(
            'Cannot find reachable host',
            originalException: exception,
          );
        continue;
      }
    }
  }
}
