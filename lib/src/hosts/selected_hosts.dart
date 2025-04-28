import 'host.dart';
import 'host_type.dart';
import 'hosts.dart';


/// Hosts config that allows dynamically change preferred host,
class SelectedHosts extends Hosts {
  /// Creates a hosts config with multiple host of each type.
  SelectedHosts({
    super.api,
    super.image,
    super.thumbnail,
  }) : super.multiple();

  /// Map of selected hosts,
  final Map<HostType, int> selectedHosts = {
    HostType.api: 0,
    HostType.image: 0,
    HostType.thumbnail: 0,
  };

  @override
  Host getHost(HostType type) => hosts[type]![selectedHosts[type]!];

  /// Selects host of given type in a list.
  /// 
  /// Selected index is checked for validity and wraps-around if it's exceeds
  /// count of available hosts.
  /// 
  /// Returns index of newly selected host.
  int selectHost(HostType type, int index) =>
    selectedHosts[type] = index % hosts[type]!.length;

  /// Selects next in a list host of given type.
  /// 
  /// If already selected host is last one, reverts to the first in a list.
  /// 
  /// Returns index of newly selected host.
  int selectNextHost(HostType type) =>
    selectHost(type, selectedHosts[type]! + 1);
}
