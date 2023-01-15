/// Data model library.
/// It contains data models for API objects, such as [Book]s, [Tag]s, [Image]s,
/// [Search] response bodies and so on.
@MappableLib(
  createCombinedContainer: true,
  discoveryMode: DiscoveryMode.package,
)
library nhentai_models;

import 'package:dart_mappable/dart_mappable.dart';

import 'src/models.dart';


export 'src/models.dart';
