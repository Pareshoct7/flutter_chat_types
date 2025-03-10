import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../preview_data.dart' show PreviewData;
import '../user.dart' show User;

part 'unsupported_message.g.dart';

/// A class that represents unsupported message. Used for backwards
/// compatibility. If chat's end user doesn't update to a new version
/// where new message types are being sent, some of them will result
/// to unsupported.
@JsonSerializable()
@immutable
class UnsupportedMessage extends Message {
  /// Creates an unsupported message.
  const UnsupportedMessage({
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
          type ?? MessageType.unsupported,
          updatedAt,
          deleteType ?? MessageDeleteType.none,
          deletedAt,
        );

  /// Creates an unsupported message from a map (decoded JSON).
  factory UnsupportedMessage.fromJson(Map<String, dynamic> json) =>
      _$UnsupportedMessageFromJson(json);

  /// Converts an unsupported message to the map representation,
  /// encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$UnsupportedMessageToJson(this);

  /// Creates a copy of the unsupported message with an updated data.
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  /// [isLoading], [previewData] is ignored for this message type.
  /// [remoteId], [showStatus] and [updatedAt] with null values will nullify existing value.
  /// [author], [createdAt], [status] with null values will be overwritten by the previous values.
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
    return UnsupportedMessage(
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
      showStatus: showStatus,
      status: status ?? this.status,
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
