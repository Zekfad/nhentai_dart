import 'package:dart_mappable/dart_mappable.dart';

import 'image_type.dart';
import 'images.dart';


/// Mapping hook that forces [Image] encoder.
class EncodeImageHook extends MappingHook {
  /// Mapping hook that forces [Image] encoder.
  const EncodeImageHook();

  @override
  dynamic beforeEncode(dynamic value) => switch(value) {
    Image() => {
      if (value.height case final height?)
        'h': height,
      if (value.width case final width?)
        'w': width,
      't': MapperContainer.globals.toValue<ImageType>(value.type),
    },
    _ => throw MapperException.unexpectedType(value.runtimeType, 'Image'),
  };
}
