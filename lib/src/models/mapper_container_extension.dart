import 'package:dart_mappable/dart_mappable.dart';

import '../models.init.dart';


var _initialized = false;

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
