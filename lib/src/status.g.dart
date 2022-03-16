// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      userId: json['userId'] as String,
      status: $enumDecodeNullable(_$StatusTypeEnumMap, json['status']),
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      sentAt: json['sentAt'] as int?,
      deliveredAt: json['deliveredAt'] as int?,
      seenAt: json['seenAt'] as int?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$StatusToJson(Status instance) {
  final val = <String, dynamic>{
    'userId': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$StatusTypeEnumMap[instance.status]);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('sentAt', instance.sentAt);
  writeNotNull('deliveredAt', instance.deliveredAt);
  writeNotNull('seenAt', instance.seenAt);
  val['id'] = instance.id;
  return val;
}

const _$StatusTypeEnumMap = {
  StatusType.delivered: 'delivered',
  StatusType.error: 'error',
  StatusType.seen: 'seen',
  StatusType.sending: 'sending',
  StatusType.sent: 'sent',
};
