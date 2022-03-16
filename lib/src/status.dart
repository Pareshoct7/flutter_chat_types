import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'status.g.dart';

/// All possible statuses message can have.
enum StatusType { delivered, error, seen, sending, sent }

@JsonSerializable()
@immutable
class Status extends Equatable {
  const Status(
      {required this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.sentAt,
      this.deliveredAt,
      this.seenAt,
      required this.id});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Status copyWith({
    StatusType? status,
    int? updatedAt,
    int? sentAt,
    int? deliveredAt,
    int? seenAt,
  }) {
    return Status(
      id: this.id,
      userId: this.userId,
      status: status,
      updatedAt: updatedAt,
      sentAt: sentAt,
      deliveredAt: deliveredAt,
      seenAt: seenAt,
    );
  }

  /// Converts a particular message to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$StatusToJson(this);

  /// User who sent this message
  final String userId;

  /// Message [StatusType]
  final StatusType? status;

  /// Created message timestamp, in ms
  final int? createdAt;

  /// Updated message timestamp, in ms
  final int? updatedAt;

  /// Updated message timestamp, in ms
  final int? sentAt;

  /// Updated message timestamp, in ms
  final int? deliveredAt;

  /// Updated message timestamp, in ms
  final int? seenAt;

  /// Unique ID of the message
  final String id;

  /// Equatable props
  @override
  List<Object?> get props =>
      [userId, status, createdAt, updatedAt, sentAt, deliveredAt, seenAt, id];
}