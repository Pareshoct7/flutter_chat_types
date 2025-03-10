import 'package:flutter_chat_types/src/status.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../preview_data.dart' show PreviewData;
import '../user.dart' show User;
import 'partial_custom.dart';

part 'custom_message.g.dart';

/// A class that represents custom message. Use [metadata] to store anything
/// you want.
@JsonSerializable()
@immutable
class CustomMessage extends Message {
  /// Creates a custom message.
  const CustomMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    StatusType? status,
    bool? showStatus,
    MessageType? type,
    int? updatedAt,
    MessageDeleteType? deleteType,
    int? deletedAt,
  }) : super(
          author,
          createdAt,
          id,
          metadata,
          remoteId,
          repliedMessage,
          roomId,
          showStatus,
          status,
          type ?? MessageType.custom,
          updatedAt,
          deleteType ?? MessageDeleteType.none,
          deletedAt,
        );

  /// Creates a full custom message from a partial one.
  CustomMessage.fromPartial({
    required User author,
    int? createdAt,
    required String id,
    required PartialCustom partialCustom,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    StatusType? status,

    bool? showStatus,
    
    int? updatedAt,
    MessageDeleteType? deleteType,
    int? deletedAt,
  }) : super(
          author,
          createdAt,
          id,
          partialCustom.metadata,
          remoteId,
          repliedMessage,
          roomId,
          showStatus,
          status,
          MessageType.custom,
          updatedAt,
          deleteType ?? MessageDeleteType.none,
          deletedAt,
        );

  /// Creates a custom message from a map (decoded JSON).
  factory CustomMessage.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageFromJson(json);

  /// Converts a custom message to the map representation,
  /// encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$CustomMessageToJson(this);

  /// Creates a copy of the custom message with an updated data.
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  /// [isLoading], [previewData] is ignored for this message type.
  /// [remoteId], [showStatus] and [updatedAt] with null values will nullify existing value.
  /// [author], [createdAt] and [status] with null values will be overwritten by the previous values.
  /// [text] is ignored for this message type.
  /// [uri] is ignored for this message type.
  @override
  Message copyWith({
    User? author,
    int? createdAt,
    bool? isLoading,
    Map<String, dynamic>? metadata,
    PreviewData? previewData,
    String? remoteId,

    StatusType? status,

    bool? showStatus,
    
    String? text,
    int? updatedAt,
    String? uri,
    MessageDeleteType? deleteType,
    int? deletedAt,
  }) {
    return CustomMessage(
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      id: id,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      remoteId: remoteId,
      repliedMessage: repliedMessage,
      roomId: roomId,
      status: status ?? this.status,
      showStatus: showStatus,
      updatedAt: updatedAt,
      deleteType: deleteType,
      deletedAt: deletedAt,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props => [
        author,
        createdAt,
        id,
        metadata,
        remoteId,
        repliedMessage,
        roomId,
        status,
        updatedAt,
        deleteType,
        deletedAt,
      ];
}
