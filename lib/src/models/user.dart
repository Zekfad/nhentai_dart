import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';

import 'mapper_container_extension.dart';
import 'user_avatar_filename_hook.dart';

part 'user.mapper.dart';


/// User.
@MappableClass()
@immutable
class User with UserMappable {
  /// Creates user.
  const User({
    required this.id,
    required this.username,
    required this.slug,
    required this.avatarFilename,
    required this.superuser,
    required this.staff,
  });
  
  /// Parses [User] instance from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Map] - then object will be parsed into [User] object.
  /// * [User] - then value will be returned as-is.
  static User Function(dynamic value) get parse =>
    MapperContainer.globals.initialized.fromValue<User>;

  /// Parses [List] of [User] instances from a given value.
  /// 
  /// Value can be one of the following:
  /// * [Iterable] of [dynamic] - then each object will be decoded same way as
  ///   [parse] and resulting [Iterable] will be returned.
  /// * [Iterable] of [User] - then value will be returned as-is.
  static List<User> Function(dynamic value) get parseList =>
    MapperContainer.globals.initialized.fromValue<List<User>>;

  /// Parses JSON string into [User] similarly to [parse]. 
  static User Function(String json) get parseJson =>
    MapperContainer.globals.initialized.fromJson<User>;

  /// Parses JSON string into [List] of [User] instances similarly to 
  /// [parseList].
  static List<User> Function(String json) get parseJsonList =>
    MapperContainer.globals.initialized.fromJson<List<User>>;

  /// User ID.
  @MappableField(key: 'id')
  final int id;

  /// User name.
  @MappableField(key: 'username')
  final String username;
  
  /// Human-readable unique user identifier. 
  @MappableField(key: 'slug')
  final String slug;
  
  /// User's avatar file name.
  @MappableField(key: 'avatar_url', hook: AvatarFilenameHook())
  final String avatarFilename;
  
  /// Whether user is superuser.
  @MappableField(key: 'is_superuser')
  final bool superuser;
  
  /// Whether user is staff member.
  @MappableField(key: 'is_staff')
  final bool staff;

  /// Returns [username].
  @override
  String toString() => username;
}
