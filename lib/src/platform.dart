export 'platform/stub.dart'
  if (dart.library.io) 'platform/io.dart'
  if (dart.library.js) 'platform/js.dart'
  if (dart.library.html) 'platform/js.dart';
