import 'package:dart_mappable/dart_mappable.dart';

import 'images.dart';


/// Mapping hook that forces [Image] encoder.
class EncodeImageHook extends MappingHook {
  const EncodeImageHook();

  @override
  dynamic beforeEncode(dynamic value) => switch(value) {
    Image() => {
      if (value.height case final height?)
        'h': height,
      if (value.width case final width?)
        'w': width,
      't': MapperContainer.globals.toValue<String>(value.type),
    },
    _ => throw MapperException.unexpectedType(value.runtimeType, 'Image'),
  };
}
