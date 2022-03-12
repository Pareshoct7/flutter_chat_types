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
      this.allStatus,
      required this.id});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Status copyWith({
    StatusType? status,
    int? updatedAt,
    List<AllStatus>? allStatus,
  }) {
    return Status(
      id: this.id,
      userId: this.userId,
      status: status,
      updatedAt: updatedAt,
      allStatus: allStatus ?? this.allStatus,
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

  /// All Status with type
  final List<AllStatus>? allStatus;

  /// Unique ID of the message
  final String id;

  /// Equatable props
  @override
  List<Object?> get props =>
      [userId, status, createdAt, updatedAt, allStatus, id];
}

@JsonSerializable()
@immutable
class AllStatus extends Equatable {
  const AllStatus({this.status, this.createdAt, this.updatedAt});

  factory AllStatus.fromJson(Map<String, dynamic> json) =>
      _$AllStatusFromJson(json);

  AllStatus copyWith({
    StatusType? status,
    int? updatedAt,
  }) {
    return AllStatus(status: status, updatedAt: updatedAt);
  }

  /// Converts a particular message to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$AllStatusToJson(this);

  /// Message [StatusType]
  final StatusType? status;

  /// Created message timestamp, in ms
  final int? createdAt;

  /// Updated message timestamp, in ms
  final int? updatedAt;

  /// Equatable props
  @override
  List<Object?> get props => [status, createdAt, updatedAt];
}
