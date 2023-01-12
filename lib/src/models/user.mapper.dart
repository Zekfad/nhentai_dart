// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user.dart';

class UserMapper extends MapperBase<User> {
  static MapperContainer container = MapperContainer(
    mappers: {UserMapper()},
  );

  @override
  UserMapperElement createElement(MapperContainer container) {
    return UserMapperElement._(this, container);
  }

  @override
  String get id => 'User';

  static final fromMap = container.fromMap<User>;
  static final fromJson = container.fromJson<User>;
}

class UserMapperElement extends MapperElementBase<User> {
  UserMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  User decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  User fromMap(Map<String, dynamic> map) => User(
      id: container.$get(map, 'id'),
      username: container.$get(map, 'username'),
      slug: container.$get(map, 'slug'),
      avatarFilename:
          container.$get(map, 'avatar_url', const AvatarFilenameHook()),
      superuser: container.$get(map, 'is_superuser'),
      staff: container.$get(map, 'is_staff'));

  @override
  Function get encoder => encode;
  dynamic encode(User v) => toMap(v);
  Map<String, dynamic> toMap(User u) => {
        'id': container.$enc(u.id, 'id'),
        'username': container.$enc(u.username, 'username'),
        'slug': container.$enc(u.slug, 'slug'),
        'avatar_url': container.$enc(
            u.avatarFilename, 'avatarFilename', const AvatarFilenameHook()),
        'is_superuser': container.$enc(u.superuser, 'superuser'),
        'is_staff': container.$enc(u.staff, 'staff')
      };

  @override
  String stringify(User self) =>
      'User(id: ${container.asString(self.id)}, username: ${container.asString(self.username)}, slug: ${container.asString(self.slug)}, avatarFilename: ${container.asString(self.avatarFilename)}, superuser: ${container.asString(self.superuser)}, staff: ${container.asString(self.staff)})';
}

mixin UserMappable {
  String toJson() => UserMapper.container.toJson(this as User);
  Map<String, dynamic> toMap() => UserMapper.container.toMap(this as User);
  @override
  String toString() => UserMapper.container.asString(this);
}
