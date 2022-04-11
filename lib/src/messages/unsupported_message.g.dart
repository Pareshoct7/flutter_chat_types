// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsupported_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsupportedMessage _$UnsupportedMessageFromJson(Map<String, dynamic> json) =>
    UnsupportedMessage(
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as int?,
      id: json['id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      remoteId: json['remoteId'] as String?,
      repliedMessage: json['repliedMessage'] == null
          ? null
          : Message.fromJson(json['repliedMessage'] as Map<String, dynamic>),
      roomId: json['roomId'] as String?,
      status: $enumDecodeNullable(_$StatusTypeEnumMap, json['status']),
      showStatus: json['showStatus'] as bool?,
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
      updatedAt: json['updatedAt'] as int?,
      deleteType:
          $enumDecodeNullable(_$MessageDeleteTypeEnumMap, json['deleteType']),
      deletedAt: json['deletedAt'] as int?,
    );

Map<String, dynamic> _$UnsupportedMessageToJson(UnsupportedMessage instance) {
  final val = <String, dynamic>{
    'author': instance.author.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdAt', instance.createdAt);
  val['id'] = instance.id;
  writeNotNull('metadata', instance.metadata);
  writeNotNull('remoteId', instance.remoteId);
  writeNotNull('repliedMessage', instance.repliedMessage?.toJson());
  writeNotNull('roomId', instance.roomId);
  writeNotNull('status', _$StatusTypeEnumMap[instance.status]);
  writeNotNull('showStatus', instance.showStatus);
  val['type'] = _$MessageTypeEnumMap[instance.type];
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('deleteType', _$MessageDeleteTypeEnumMap[instance.deleteType]);
  writeNotNull('deletedAt', instance.deletedAt);
  return val;
}

const _$StatusTypeEnumMap = {
  StatusType.delivered: 'delivered',
  StatusType.error: 'error',
  StatusType.seen: 'seen',
  StatusType.sending: 'sending',
  StatusType.sent: 'sent',
};

const _$MessageTypeEnumMap = {
  MessageType.custom: 'custom',
  MessageType.file: 'file',
  MessageType.image: 'image',
  MessageType.text: 'text',
  MessageType.unsupported: 'unsupported',
};

const _$MessageDeleteTypeEnumMap = {
  MessageDeleteType.none: 'none',
  MessageDeleteType.me: 'me',
  MessageDeleteType.everyone: 'everyone',
};
