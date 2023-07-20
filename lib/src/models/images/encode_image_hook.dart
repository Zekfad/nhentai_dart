import 'package:dart_mappable/dart_mappable.dart';

import 'image_type_mapper.dart';
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
      't': const ImageTypeMapper().encode(value.type),
    },
    // Image() => value,
    _ => throw MapperException.unexpectedType(value.runtimeType, 'Image'),
  };
  // @override
  // dynamic afterEncode(dynamic value) => switch(value) {
  //   Image() => {
  //     if (value.height case final height?)
  //       'h': height,
  //     if (value.width case final width?)
  //       'w': width,
  //     't': value.type,
  //     'dsadsadsa': 'dsdsad',
  //   },
  //   _ => throw MapperException.unexpectedType(value.runtimeType, 'Image'),
  // };
}
