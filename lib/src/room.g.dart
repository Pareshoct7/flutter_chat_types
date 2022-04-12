// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      createdAt: json['createdAt'] as int?,
      id: json['id'] as String,
      avatar: json['avatar'] as String?,
      lastMessage: json['lastMessage'] == null
          ? null
          : Message.fromJson(json['lastMessage'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      name: json['name'] as String?,
      type: $enumDecodeNullable(_$RoomTypeEnumMap, json['type']),
      updatedAt: json['updatedAt'] as int?,
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestedBy: json['requestedBy'] as String,
      requestedAt: json['requestedAt'] as int?,
      requestModifiedAt: json['requestModifiedAt'] as int?,
      status: $enumDecodeNullable(_$RoomStatusEnumMap, json['status']),
      roomStatusChangedBy: json['roomStatusChangedBy'] as String?,
      roomStatusChangedAt: json['roomStatusChangedAt'] as int?,
      blocks: (json['blocks'] as List<dynamic>?)
          ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      unRead: json['unRead'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RoomToJson(Room instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdAt', instance.createdAt);
  val['id'] = instance.id;
  writeNotNull('avatar', instance.avatar);
  writeNotNull('lastMessage', instance.lastMessage?.toJson());
  writeNotNull('metadata', instance.metadata);
  writeNotNull('name', instance.name);
  writeNotNull('type', _$RoomTypeEnumMap[instance.type]);
  writeNotNull('updatedAt', instance.updatedAt);
  val['users'] = instance.users.map((e) => e.toJson()).toList();
  val['requestedBy'] = instance.requestedBy;
  writeNotNull('requestedAt', instance.requestedAt);
  writeNotNull('requestModifiedAt', instance.requestModifiedAt);
  writeNotNull('status', _$RoomStatusEnumMap[instance.status]);
  writeNotNull('roomStatusChangedBy', instance.roomStatusChangedBy);
  writeNotNull('roomStatusChangedAt', instance.roomStatusChangedAt);
  writeNotNull('blocks', instance.blocks?.map((e) => e.toJson()).toList());
  writeNotNull('unRead', instance.unRead);
  return val;
}

const _$RoomTypeEnumMap = {
  RoomType.channel: 'channel',
  RoomType.direct: 'direct',
  RoomType.group: 'group',
};

const _$RoomStatusEnumMap = {
  RoomStatus.pending: 'pending',
  RoomStatus.accept: 'accept',
  RoomStatus.reject: 'reject',
  RoomStatus.block: 'block',
  RoomStatus.cancel: 'cancel',
};

Block _$BlockFromJson(Map<String, dynamic> json) => Block(
      blockedBy: json['blockedBy'] as String,
      blockedTo: json['blockedTo'] as String,
    );

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'blockedBy': instance.blockedBy,
      'blockedTo': instance.blockedTo,
    };
