// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewRequest _$ReviewRequestFromJson(Map<String, dynamic> json) =>
    ReviewRequest(
      user_id: json['user_id'] as String,
      comment: json['comment'] as String,
      rating: json['rating'] as String,
      model_id: json['model_id'] as String,
      model_type: json['model_type'] as String,
    );

Map<String, dynamic> _$ReviewRequestToJson(ReviewRequest instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'comment': instance.comment,
      'rating': instance.rating,
      'model_id': instance.model_id,
      'model_type': instance.model_type,
    };

MobileResponse _$MobileResponseFromJson(Map<String, dynamic> json) =>
    MobileResponse(
      success: json['success'] as bool,
    );

Map<String, dynamic> _$MobileResponseToJson(MobileResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

ReviewsResponse _$ReviewsResponseFromJson(Map<String, dynamic> json) =>
    ReviewsResponse(
      currentPage: json['current_page'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  UserCommentResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ReviewsResponseToJson(ReviewsResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
    };

UserCommentResponse _$UserCommentResponseFromJson(Map<String, dynamic> json) =>
    UserCommentResponse(
      id: json['id'] as int? ?? 0,
      userID: json['user_id'] as int? ?? 0,
      comment: json['comment'] as String? ?? '',
      rating: json['rating'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$UserCommentResponseToJson(
        UserCommentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userID,
      'comment': instance.comment,
      'rating': instance.rating,
      'created_at': instance.createdAt,
    };
