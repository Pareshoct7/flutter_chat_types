import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../preview_data.dart' show PreviewData;
import '../user.dart' show User;
import 'partial_text.dart';

part 'text_message.g.dart';

/// A class that represents text message.
@JsonSerializable()
@immutable
class TextMessage extends Message {
  /// Creates a text message.
  const TextMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    this.previewData,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    // StatusType? status,
    required this.text,
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
          // status,
          type ?? MessageType.text,
          updatedAt,
          deleteType ?? MessageDeleteType.none,
          deletedAt,
        );

  /// Creates a full text message from a partial one.
  TextMessage.fromPartial({
    required User author,
    int? createdAt,
    required String id,
    required PartialText partialText,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    // StatusType? status,
    int? updatedAt,
    MessageDeleteType? deleteType,
    int? deletedAt,
  })  : previewData = partialText.previewData,
        text = partialText.text,
        super(
          author,
          createdAt,
          id,
          partialText.metadata,
          remoteId,
          repliedMessage,
          roomId,
          // status,
          MessageType.text,
          updatedAt,
          deleteType ?? MessageDeleteType.none,
          deletedAt,
        );

  /// Creates a text message from a map (decoded JSON).
  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);

  /// Converts a text message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$TextMessageToJson(this);

  /// Creates a copy of the text message with an updated data
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  /// [remoteId] and [updatedAt] with null values will nullify existing value.
  /// [status] and [text] with null values will be overwritten by previous values.
  /// [uri] is ignored for this message type.
  @override
  Message copyWith({
    Map<String, dynamic>? metadata,
    PreviewData? previewData,
    String? remoteId,
    // StatusType? status,
    String? text,
    int? updatedAt,
    String? uri,
    MessageDeleteType? deleteType,
    int? deletedAt,
  }) {
    return TextMessage(
      author: author,
      createdAt: createdAt,
      id: id,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      previewData: previewData,
      remoteId: remoteId,
      repliedMessage: repliedMessage,
      roomId: roomId,
      // status: status ?? this.status,
      text: text ?? this.text,
      updatedAt: updatedAt,
      deleteType: deleteType,
      deletedAt: deletedAt,
    );
  }

  @override
  Message clone({required User author}) {
    // TODO: implement clone
    throw TextMessage(author: author, id: id, text: text);
  }

  /// Equatable props
  @override
  List<Object?> get props => [
        author,
        createdAt,
        id,
        metadata,
        previewData,
        remoteId,
        repliedMessage,
        roomId,
        // status,
        text,
        updatedAt,
        deleteType,
        deletedAt,
      ];

  /// See [PreviewData]
  final PreviewData? previewData;

  /// User's message
  final String text;
}
