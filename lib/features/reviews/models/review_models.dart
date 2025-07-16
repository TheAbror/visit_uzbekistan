import 'package:json_annotation/json_annotation.dart';
import 'package:visit_uzbekistan/features/auth/models/auth_models.dart';

part 'review_models.g.dart';

// /api/review

// bodyda iwu parametrlani yuvarasan

// user_id
// comment
// rating
// model_id
// model_type (city, place, tour,…)

@JsonSerializable(includeIfNull: true)
class ReviewRequest {
  final String user_id;
  final String comment;
  final String rating;
  final String model_id;
  final String model_type;

  ReviewRequest({
    required this.user_id,
    required this.comment,
    required this.rating,
    required this.model_id,
    required this.model_type,
  });

  factory ReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewRequestToJson(this);
}

@JsonSerializable(includeIfNull: true)
class MobileResponse {
  final bool success;

  MobileResponse({required this.success});

  factory MobileResponse.fromJson(Map<String, dynamic> json) =>
      _$MobileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MobileResponseToJson(this);
}

@JsonSerializable(includeIfNull: true)
class ReviewsResponse {
  @JsonKey(defaultValue: 0, name: 'current_page')
  final int currentPage;
  @JsonKey(defaultValue: [])
  final List<UserCommentResponse> data;

  ReviewsResponse({
    required this.currentPage,
    required this.data,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsResponseToJson(this);
}

// Model Review:

// id
// user_id
// comment
// rating
// created_at
// model_id
// model_type

@JsonSerializable(includeIfNull: true)
class UserCommentResponse {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: 0, name: 'user_id')
  final int userID;
  @JsonKey(defaultValue: '')
  final String comment;
  @JsonKey(defaultValue: 0)
  final int rating;
  @JsonKey(defaultValue: '', name: 'created_at')
  final String createdAt;
  @JsonKey()
  final UserResponse user;

  UserCommentResponse({
    required this.id,
    required this.userID,
    required this.comment,
    required this.rating,
    required this.createdAt,
    required this.user,
  });

  factory UserCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$UserCommentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserCommentResponseToJson(this);
}
