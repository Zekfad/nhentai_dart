import 'package:dart_mappable/dart_mappable.dart';

import '../models.init.dart';


var _initialized = false;

/// Extension with mappers initialization safeguard. 
extension MapperContainerExtension on MapperContainer {
  /// Returns this mapper, calling [initializeMappers] if needed.
  MapperContainer get initialized {
    if (!_initialized) {
      initializeMappers();
      _initialized = true;
    }
    return this;
  }
}
