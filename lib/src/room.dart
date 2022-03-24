import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'message.dart';
import 'user.dart';

part 'room.g.dart';

/// All possible room types
enum RoomType { channel, direct, group }

/// All possible room types
enum RoomStatus { pending, accept, reject, block, cancel }

/// A class that represents a room where 2 or more participants can chat
@JsonSerializable()
@immutable
class Room extends Equatable {
  /// Creates a [Room]
  const Room(
      {this.createdAt,
      required this.id,
      this.imageUrl,
      this.lastMessages,
      this.metadata,
      this.name,
      required this.type,
      this.updatedAt,
      required this.users,
      required this.requestedBy,
      this.requestedAt,
      this.requestModifiedAt,
      this.status,
      this.roomStatusChangedBy,
      this.roomStatusChangedAt,
      this.blocks});

  /// Creates room from a map (decoded JSON).
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  /// Converts room to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$RoomToJson(this);

  /// Creates a copy of the room with an updated data.
  /// [imageUrl], [name] and [updatedAt] with null values will nullify existing values
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  /// [type] and [users] with null values will be overwritten by previous values.
  Room copyWith({
    String? imageUrl,
    Map<String, dynamic>? metadata,
    String? name,
    RoomType? type,
    int? updatedAt,
    List<User>? users,
    List<Block>? blocks,
  }) {
    return Room(
      id: id,
      requestedBy: requestedBy,
      imageUrl: imageUrl,
      lastMessages: lastMessages,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      name: name,
      type: type ?? this.type,
      updatedAt: updatedAt,
      users: users ?? this.users,
      blocks: blocks ?? this.blocks,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props => [
        createdAt,
        id,
        imageUrl,
        lastMessages,
        metadata,
        name,
        type,
        updatedAt,
        users,
        requestedBy,
        requestedAt,
        requestModifiedAt,
        status,
        roomStatusChangedBy,
        roomStatusChangedAt,
        blocks
      ];

  /// Created room timestamp, in ms
  final int? createdAt;

  /// Room's unique ID
  final String id;

  /// Room's image. In case of the [RoomType.direct] - avatar of the second person,
  /// otherwise a custom image [RoomType.group].
  final String? imageUrl;

  /// List of last messages this room has received
  final List<Message>? lastMessages;

  /// Additional custom metadata or attributes related to the room
  final Map<String, dynamic>? metadata;

  /// Room's name. In case of the [RoomType.direct] - name of the second person,
  /// otherwise a custom name [RoomType.group].
  final String? name;

  /// [RoomType]
  final RoomType? type;

  /// Updated room timestamp, in ms
  final int? updatedAt;

  /// List of users which are in the room
  final List<User> users;

  /// User's id who requested to start conversation
  final String requestedBy;

  /// chat request timestamp, in ms
  final int? requestedAt;

  /// when roomStatus changes timestamp, in ms
  final int? requestModifiedAt;

  /// [RoomStatus]
  final RoomStatus? status;

  /// User's id who changed last status
  final String? roomStatusChangedBy;

  /// when roomStatus changes timestamp, in ms
  final int? roomStatusChangedAt;

  /// List of users which are blocked by someone
  final List<Block>? blocks;
}

@JsonSerializable()
@immutable
class Block extends Equatable {
  const Block({required this.blockedBy, required this.blockedTo});

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);

  /// Converts a particular message to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$BlockToJson(this);

  /// User who blocked
  final String blockedBy;

  // blocked user
  final String blockedTo;

  /// Equatable props
  @override
  List<Object?> get props => [blockedBy, blockedTo];
}
