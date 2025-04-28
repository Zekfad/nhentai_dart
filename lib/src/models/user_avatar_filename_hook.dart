import 'package:dart_mappable/dart_mappable.dart';

import 'user.dart';


/// Decodes and encodes [User.avatarFilename].
class AvatarFilenameHook extends MappingHook {
  /// Decodes and encodes [User.avatarFilename].
  const AvatarFilenameHook();

  @override
  String beforeDecode(dynamic value) => switch(value) {
    String() => Uri.parse(value).pathSegments.last,
    _ => throw MapperException.unexpectedType(value.runtimeType, 'String'),
  };

  @override
  String beforeEncode(dynamic value) => switch(value) {
    String() => 'avatars/$value',
    _ => throw MapperException.unexpectedType(value.runtimeType, 'String'),
  };
}
