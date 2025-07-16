// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInRequest _$LogInRequestFromJson(Map<String, dynamic> json) => LogInRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LogInRequestToJson(LogInRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

LogInResponse _$LogInResponseFromJson(Map<String, dynamic> json) =>
    LogInResponse(
      message: json['message'] as String? ?? '',
      data: LogInDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogInResponseToJson(LogInResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

LogInDataResponse _$LogInDataResponseFromJson(Map<String, dynamic> json) =>
    LogInDataResponse(
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$LogInDataResponseToJson(LogInDataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      password_confirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.password_confirmation,
    };

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    LogoutResponse(
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
