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
      allStatus: (json['allStatus'] as List<dynamic>?)
          ?.map((e) => AllStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
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
  writeNotNull(
      'allStatus', instance.allStatus?.map((e) => e.toJson()).toList());
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

AllStatus _$AllStatusFromJson(Map<String, dynamic> json) => AllStatus(
      status: $enumDecodeNullable(_$StatusTypeEnumMap, json['status']),
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$AllStatusToJson(AllStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$StatusTypeEnumMap[instance.status]);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  return val;
}
