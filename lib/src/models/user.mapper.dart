// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user.dart';

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'User';

  static int _$id(User v) => v.id;
  static const Field<User, int> _f$id = Field('id', _$id);
  static String _$username(User v) => v.username;
  static const Field<User, String> _f$username = Field('username', _$username);
  static String _$slug(User v) => v.slug;
  static const Field<User, String> _f$slug = Field('slug', _$slug);
  static String _$avatarFilename(User v) => v.avatarFilename;
  static const Field<User, String> _f$avatarFilename = Field(
      'avatarFilename', _$avatarFilename,
      key: 'avatar_url', hook: AvatarFilenameHook());
  static bool _$superuser(User v) => v.superuser;
  static const Field<User, bool> _f$superuser =
      Field('superuser', _$superuser, key: 'is_superuser');
  static bool _$staff(User v) => v.staff;
  static const Field<User, bool> _f$staff =
      Field('staff', _$staff, key: 'is_staff');

  @override
  final Map<Symbol, Field<User, dynamic>> fields = const {
    #id: _f$id,
    #username: _f$username,
    #slug: _f$slug,
    #avatarFilename: _f$avatarFilename,
    #superuser: _f$superuser,
    #staff: _f$staff,
  };

  static User _instantiate(DecodingData data) {
    return User(
        id: data.dec(_f$id),
        username: data.dec(_f$username),
        slug: data.dec(_f$slug),
        avatarFilename: data.dec(_f$avatarFilename),
        superuser: data.dec(_f$superuser),
        staff: data.dec(_f$staff));
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<User>(map));
  }

  static User fromJson(String json) {
    return _guard((c) => c.fromJson<User>(json));
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper._guard((c) => c.toJson(this as User));
  }

  Map<String, dynamic> toMap() {
    return UserMapper._guard((c) => c.toMap(this as User));
  }

  @override
  String toString() {
    return UserMapper._guard((c) => c.asString(this));
  }
}
