import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// All possible roles user can have.
enum Role { admin, agent, moderator, user }

/// A class that represents user.
@JsonSerializable()
@immutable
class User extends Equatable {
  /// Creates a user.
  const User(
      {this.createdAt,
      this.firstName,
      required this.id,
      this.avatar,
      this.lastName,
      this.lastSeen,
      this.metadata,
      this.role,
      this.updatedAt,
      this.token,
      this.online,
      this.gender,
      this.userId,
      this.isVerified,
      this.level,
      this.uuid});

  /// Creates user from a map (decoded JSON).
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Converts user to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Creates a copy of the user with an updated data.
  /// [firstName], [imageUrl], [lastName], [lastSeen], [role] and [updatedAt]
  /// with null values will nullify existing values.
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  User copyWith({
    String? firstName,
    String? imageUrl,
    String? lastName,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    int? updatedAt,
    String? token,
    int? online,
    int? gender,
    int? userId,
    int? isVerified,
    int? level,
    String? uuid,
  }) {
    return User(
      firstName: firstName,
      id: id,
      avatar: imageUrl,
      lastName: lastName,
      lastSeen: lastSeen,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
      role: role,
      updatedAt: updatedAt,
      token: token,
      online: online,
      gender: gender,
      userId: userId,
      isVerified: isVerified,
      level: level,
      uuid: uuid,
    );
  }

  /// Equatable props
  @override
  List<Object?> get props => [
        createdAt,
        firstName,
        id,
        avatar,
        lastName,
        lastSeen,
        metadata,
        role,
        updatedAt,
        token,
        online,
        gender,
        userId,
        isVerified,
        level,
        uuid
      ];

  /// Created user timestamp, in ms
  final int? createdAt;

  /// First name of the user
  final String? firstName;

  /// Unique ID of the user
  final String id;

  /// Remote image URL representing user's avatar
  final String? avatar;

  /// Last name of the user
  final String? lastName;

  /// Timestamp when user was last visible, in ms
  final int? lastSeen;

  /// Additional custom metadata or attributes related to the user
  final Map<String, dynamic>? metadata;

  /// User [Role]
  final Role? role;

  /// Updated user timestamp, in ms
  final int? updatedAt;

  /// Fcm token to send push notifications
  final String? token;

  /// online flag indicated whether the user is online or offline
  final int? online;

  /// Gender 1 means male
  final int? gender;

  /// knackit user id
  final int? userId;

  /// knackit user is verified or not
  final int? isVerified;

  /// knackit user's level
  final int? level;

  /// knackit user's level
  final String? uuid;
}
