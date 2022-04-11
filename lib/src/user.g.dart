// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      createdAt: json['createdAt'] as int?,
      firstName: json['firstName'] as String?,
      id: json['id'] as String,
      avatar: json['avatar'] as String?,
      lastName: json['lastName'] as String?,
      lastSeen: json['lastSeen'] as int?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      updatedAt: json['updatedAt'] as int?,
      token: json['token'] as String?,
      online: json['online'] as int?,
      gender: json['gender'] as int?,
      userId: json['userId'] as int?,
      isVerified: json['isVerified'] as int?,
      level: json['level'] as int?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('firstName', instance.firstName);
  val['id'] = instance.id;
  writeNotNull('avatar', instance.avatar);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('lastSeen', instance.lastSeen);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('role', _$RoleEnumMap[instance.role]);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('token', instance.token);
  writeNotNull('online', instance.online);
  writeNotNull('gender', instance.gender);
  writeNotNull('userId', instance.userId);
  writeNotNull('isVerified', instance.isVerified);
  writeNotNull('level', instance.level);
  writeNotNull('uuid', instance.uuid);
  return val;
}

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.agent: 'agent',
  Role.moderator: 'moderator',
  Role.user: 'user',
};
